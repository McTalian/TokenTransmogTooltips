#!/usr/bin/env python3
"""
Scrape Wowhead "Contains" tab data for Black Empire armor tokens.
Fetches each item page and extracts the contained item IDs/names from
the embedded Listview JavaScript data.
"""

import json
import re
import subprocess
import time
import sys

INPUT_FILE = "BlackEmpireArmor.jsonc"
OUTPUT_FILE = "BlackEmpireArmor.jsonc"

def strip_jsonc_comments(text):
    """Remove // and /* */ comments from JSONC text."""
    # Remove single-line comments
    text = re.sub(r'//.*?$', '', text, flags=re.MULTILINE)
    # Remove multi-line comments
    text = re.sub(r'/\*.*?\*/', '', text, flags=re.DOTALL)
    return text

def fetch_contains(item_id):
    """Fetch Wowhead item page and extract 'contains' listview data."""
    url = f"https://www.wowhead.com/item={item_id}&xml"
    # First get the item slug from XML for the full page URL
    slug_url = f"https://www.wowhead.com/item={item_id}"

    cmd = [
        "curl", "-s", "-L",
        "-H", "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:120.0) Gecko/20100101 Firefox/120.0",
        "-H", "Accept: text/html,application/xhtml+xml",
        slug_url
    ]

    result = subprocess.run(cmd, capture_output=True, text=True, timeout=30)
    html = result.stdout

    if not html or len(html) < 1000:
        print(f"  WARNING: Got empty or very short response for {item_id}", file=sys.stderr)
        return None

    # Find the 'contains' listview block
    # Pattern: new Listview({ ... id: 'contains' ... data: [...] ... })
    # We need a more robust extraction since the data array can be very large

    # First, find where "id: 'contains'" appears
    contains_pos = html.find("id: 'contains'")
    if contains_pos == -1:
        contains_pos = html.find('"id":"contains"')
    if contains_pos == -1:
        print(f"  WARNING: No 'contains' listview found for {item_id}", file=sys.stderr)
        return None

    # Find the "data:" key after this position
    data_pos = html.find("data:", contains_pos)
    if data_pos == -1:
        data_pos = html.find('"data":', contains_pos)
    if data_pos == -1:
        print(f"  WARNING: No 'data:' found in contains listview for {item_id}", file=sys.stderr)
        return None

    # Find the opening bracket of the data array
    bracket_start = html.find("[", data_pos)
    if bracket_start == -1:
        print(f"  WARNING: No data array found for {item_id}", file=sys.stderr)
        return None

    # Now find the matching closing bracket
    depth = 0
    i = bracket_start
    while i < len(html):
        if html[i] == '[':
            depth += 1
        elif html[i] == ']':
            depth -= 1
            if depth == 0:
                break
        i += 1

    if depth != 0:
        print(f"  WARNING: Unbalanced brackets in data array for {item_id}", file=sys.stderr)
        return None

    data_str = html[bracket_start:i+1]

    # Parse the JSON array - need to handle JS-style keys without quotes
    # Wowhead uses quoted keys in the data array, so it should be valid JSON
    try:
        items = json.loads(data_str)
    except json.JSONDecodeError as e:
        print(f"  WARNING: Failed to parse JSON for {item_id}: {e}", file=sys.stderr)
        # Try to extract just the IDs and names with regex
        items_raw = re.findall(r'"id":(\d+),"level":\d+,"name":"([^"]+)"', data_str)
        if items_raw:
            return [{"id": int(id_), "name": name} for id_, name in items_raw]
        return None

    # Extract just id and name from each contained item
    contained = []
    for item in items:
        contained.append({
            "id": item.get("id"),
            "name": item.get("name", item.get("displayName", "Unknown")),
            "slot": item.get("slotbak"),
            "appearances": item.get("appearances", {}),
            "specs": item.get("specs", []),
        })

    return contained


def main():
    # Read existing JSONC file
    with open(INPUT_FILE, "r") as f:
        raw = f.read()

    data = json.loads(strip_jsonc_comments(raw))

    item_ids = list(data.keys())
    total = len(item_ids)
    print(f"Processing {total} Black Empire tokens...")

    for idx, item_id in enumerate(item_ids, 1):
        name = data[item_id]["name_enus"]
        print(f"[{idx}/{total}] Fetching contains for {item_id} ({name})...")

        contains = fetch_contains(item_id)
        if contains:
            data[item_id]["contains"] = contains
            print(f"  Found {len(contains)} contained items")
        else:
            print(f"  No contains data found")

        # Be polite - wait between requests
        if idx < total:
            time.sleep(1.5)

    # Write output
    with open(OUTPUT_FILE, "w") as f:
        json.dump(data, f, indent=4)
        f.write("\n")

    print(f"\nDone! Output written to {OUTPUT_FILE}")


if __name__ == "__main__":
    main()

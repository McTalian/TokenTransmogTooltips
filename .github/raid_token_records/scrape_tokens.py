#!/usr/bin/env python3
"""
scrape_tokens.py — Token Discovery & Contained-Item Scraper for TokenTransmogTooltips

PURPOSE:
  Automates the two most tedious manual steps for non-raid token sources:
  1. Token Discovery: Given a Wowhead search URL or category filter, find all
     token item IDs and their metadata (name, slot, armor type).
  2. Contains Extraction: For each discovered token, fetch its Wowhead "Contains"
     tab to find the result items (the gear the token creates).

  The output is formatted to plug directly into the TokenTransmogTooltips
  onboarding pipeline:
  - Token Discovery section of a raid_token_record .md file
  - Item list input for /tttgen Item List mode (CSV format)

USAGE:
  # Mode 1: Scrape token IDs from a Wowhead search results page
  python3 scrape_tokens.py discover --url "https://www.wowhead.com/items?filter=..."

  # Mode 2: Scrape token IDs from a Wowhead item category/subcategory
  python3 scrape_tokens.py discover --category "Junk" --name-filter "Benthic"

  # Mode 3: Fetch "Contains" data for tokens listed in an existing JSONC file
  python3 scrape_tokens.py contains --input tokens.jsonc --output tokens_with_contains.jsonc

  # Mode 4: Fetch "Contains" data for a single token ID (quick test)
  python3 scrape_tokens.py contains --item-id 169479

  # Full pipeline: discover tokens, then fetch their contains data
  python3 scrape_tokens.py pipeline --url "https://www.wowhead.com/items?filter=..." --output result.jsonc

OUTPUT FORMATS:
  --format record    (default) Token Discovery format for raid_token_record .md files:
                     -- [ITEMID] - Token Name - SLOT - Source
  --format tttgen    Item list for /tttgen Item List mode:
                     itemId, ARMOR_TYPE, SLOT
  --format jsonc     Full JSONC with contains data (like BlackEmpireArmor.jsonc)

ARCHITECTURE:
  The scraper uses curl (via subprocess) rather than requests/aiohttp to avoid
  adding Python package dependencies. This keeps the tool zero-dependency (just Python 3 + curl).

WOWHEAD SCRAPING NOTES:
  - Wowhead renders item lists via JavaScript Listview objects embedded in HTML
  - Search results appear as: new Listview({..., data: [{id:...}, ...], ...})
  - The "contains" tab on item pages uses the same Listview pattern
  - Rate limiting: 1.5s delay between requests to be respectful
  - User-Agent header required to get full HTML (not a bot-redirect page)

SLOT MAPPING (Wowhead slotbak → addon slot name):
  1  → HELM
  3  → SHOULDERS
  5  → CHEST
  6  → BELT
  8  → BOOTS
  9  → BRACERS
  10 → GAUNTLETS
  15 → CLOAK
  7  → LEGGINGS

ARMOR CLASS MAPPING (Wowhead subclass → armor type):
  1 → CLOTH
  2 → LEATHER
  3 → MAIL
  4 → PLATE
"""

import argparse
import json
import re
import subprocess
import sys
import time


# ---------------------------------------------------------------------------
# Constants
# ---------------------------------------------------------------------------

WOWHEAD_SLOT_MAP = {
    1: "HELM",
    3: "SHOULDERS",
    5: "CHEST",
    6: "BELT",
    7: "LEGGINGS",
    8: "BOOTS",
    9: "BRACERS",
    10: "GAUNTLETS",
    15: "CLOAK",
    16: "CLOAK",  # Back slot variant
}

WOWHEAD_ARMOR_CLASS_MAP = {
    1: "CLOTH",
    2: "LEATHER",
    3: "MAIL",
    4: "PLATE",
}

# WoW specialization ID → armor type mapping
# Used to infer armor type from the "specs" list on contained items
SPEC_TO_ARMOR_TYPE = {
    # Warrior (Plate)
    71: "PLATE", 72: "PLATE", 73: "PLATE",
    # Paladin (Plate)
    65: "PLATE", 66: "PLATE", 70: "PLATE",
    # Death Knight (Plate)
    250: "PLATE", 251: "PLATE", 252: "PLATE",
    # Hunter (Mail)
    253: "MAIL", 254: "MAIL", 255: "MAIL",
    # Shaman (Mail)
    262: "MAIL", 263: "MAIL", 264: "MAIL",
    # Evoker (Mail)
    1467: "MAIL", 1468: "MAIL", 1473: "MAIL",
    # Rogue (Leather)
    259: "LEATHER", 260: "LEATHER", 261: "LEATHER",
    # Monk (Leather)
    268: "LEATHER", 269: "LEATHER", 270: "LEATHER",
    # Druid (Leather)
    102: "LEATHER", 103: "LEATHER", 104: "LEATHER", 105: "LEATHER",
    # Demon Hunter (Leather)
    577: "LEATHER", 581: "LEATHER",
    # Mage (Cloth)
    62: "CLOTH", 63: "CLOTH", 64: "CLOTH",
    # Priest (Cloth)
    256: "CLOTH", 257: "CLOTH", 258: "CLOTH",
    # Warlock (Cloth)
    265: "CLOTH", 266: "CLOTH", 267: "CLOTH",
}

REQUEST_DELAY = 1.5  # seconds between requests

USER_AGENT = (
    "Mozilla/5.0 (X11; Linux x86_64; rv:120.0) Gecko/20100101 Firefox/120.0"
)


# ---------------------------------------------------------------------------
# HTTP fetching (curl-based, zero Python dependencies)
# ---------------------------------------------------------------------------

def fetch_url(url):
    """Fetch a URL using curl and return the response body as a string.

    Returns None if the request fails or returns an empty/very short response.
    """
    cmd = [
        "curl", "-s", "-L",
        "-H", f"User-Agent: {USER_AGENT}",
        "-H", "Accept: text/html,application/xhtml+xml",
        url,
    ]
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=30)
    except subprocess.TimeoutExpired:
        print(f"  WARNING: Request timed out for {url}", file=sys.stderr)
        return None

    body = result.stdout
    if not body or len(body) < 500:
        print(f"  WARNING: Empty or very short response for {url}", file=sys.stderr)
        return None

    return body


# ---------------------------------------------------------------------------
# Wowhead HTML parsing helpers
# ---------------------------------------------------------------------------

def _extract_json_array(html, start_pos):
    """Extract a JSON array starting at start_pos in html.

    Finds the opening '[' at or after start_pos, then matches the closing ']'
    handling nested brackets. Returns the parsed list, or None on failure.
    """
    bracket_start = html.find("[", start_pos)
    if bracket_start == -1:
        return None

    depth = 0
    i = bracket_start
    while i < len(html):
        if html[i] == "[":
            depth += 1
        elif html[i] == "]":
            depth -= 1
            if depth == 0:
                break
        i += 1

    if depth != 0:
        return None

    data_str = html[bracket_start:i + 1]

    try:
        return json.loads(data_str)
    except json.JSONDecodeError:
        # Fallback: try regex extraction for id/name pairs
        items_raw = re.findall(
            r'"id":(\d+).*?"name":"([^"]+)"', data_str
        )
        if items_raw:
            return [{"id": int(id_), "name": name} for id_, name in items_raw]
        return None


def extract_listview_data(html, listview_id=None):
    """Extract the data array from a Wowhead Listview block.

    If listview_id is given (e.g. "contains", "items"), look for the block
    with that id. Otherwise, extract the first Listview data array found.

    Handles two Wowhead patterns:
      1. Inline data:  data: [{...}, ...]
      2. Variable ref:  data: listviewitems  (with var listviewitems = [...] elsewhere)

    Returns a list of dicts, or None on failure.
    """
    if listview_id:
        # Find the specific Listview block
        patterns = [
            f"id: '{listview_id}'",
            f'"id":"{listview_id}"',
            f"id:'{listview_id}'",
        ]
        pos = -1
        for pat in patterns:
            pos = html.find(pat)
            if pos != -1:
                break
        if pos == -1:
            return None
        search_start = pos
    else:
        search_start = 0

    # Find "data:" or '"data":' after the anchor position
    data_pos = html.find("data:", search_start)
    alt_pos = html.find('"data":', search_start)
    if data_pos == -1 and alt_pos == -1:
        return None
    if data_pos == -1:
        data_pos = alt_pos
    elif alt_pos != -1:
        data_pos = min(data_pos, alt_pos)

    # Skip past "data:" or '"data":' to find what follows
    colon_pos = html.find(":", data_pos)
    if colon_pos == -1:
        return None
    after_colon = html[colon_pos + 1:colon_pos + 100].lstrip()

    if after_colon.startswith("["):
        # Pattern 1: Inline data array
        return _extract_json_array(html, colon_pos + 1)
    else:
        # Pattern 2: Variable reference (e.g. "data: listviewitems")
        # Extract the variable name
        var_match = re.match(r'([a-zA-Z_][a-zA-Z0-9_]*)', after_colon)
        if not var_match:
            return None
        var_name = var_match.group(1)

        # Find the variable declaration: "var <name> = [...]"
        var_decl = re.search(
            rf'var\s+{re.escape(var_name)}\s*=\s*', html
        )
        if not var_decl:
            return None

        return _extract_json_array(html, var_decl.end())


def armor_type_from_specs(specs):
    """Infer armor type from a list of WoW specialization IDs.

    All specs for a given item should map to the same armor type (since an
    armor piece is always one armor class). Returns the armor type string
    if any spec is recognized, otherwise returns None.
    """
    if not specs:
        return None
    for spec_id in specs:
        atype = SPEC_TO_ARMOR_TYPE.get(spec_id)
        if atype:
            return atype
    return None


def slot_name(slotbak):
    """Convert Wowhead slotbak integer to addon slot name string.

    Returns 'TOKEN' for slotbak=0, which represents tokens/junk items
    that don't occupy an armor slot themselves.
    """
    if slotbak == 0:
        return "TOKEN"
    return WOWHEAD_SLOT_MAP.get(slotbak, f"UNKNOWN_SLOT_{slotbak}")


def armor_type(subclass):
    """Convert Wowhead armor subclass integer to addon armor type string."""
    return WOWHEAD_ARMOR_CLASS_MAP.get(subclass, f"UNKNOWN_ARMOR_{subclass}")


# ---------------------------------------------------------------------------
# JSONC helpers
# ---------------------------------------------------------------------------

def strip_jsonc_comments(text):
    """Remove // and /* */ style comments from JSONC text."""
    text = re.sub(r"//.*?$", "", text, flags=re.MULTILINE)
    text = re.sub(r"/\*.*?\*/", "", text, flags=re.DOTALL)
    return text


def read_jsonc(filepath):
    """Read and parse a JSONC file, returning a Python dict."""
    with open(filepath, "r") as f:
        raw = f.read()
    return json.loads(strip_jsonc_comments(raw))


def write_jsonc(filepath, data):
    """Write data as formatted JSON to a file."""
    with open(filepath, "w") as f:
        json.dump(data, f, indent=4)
        f.write("\n")


# ---------------------------------------------------------------------------
# Core operations
# ---------------------------------------------------------------------------

def discover_tokens_from_url(url, name_filter=None):
    """Scrape a Wowhead search/category page for token items.

    Fetches the URL, extracts the 'items' Listview data, and returns
    structured token metadata.

    Args:
        url: Full Wowhead URL (search results or item category page).
        name_filter: Optional substring filter on item names (case-insensitive).

    Returns:
        List of dicts with keys: id, name, slotbak, armor_subclass, quality
    """
    html = fetch_url(url)
    if not html:
        print("ERROR: Failed to fetch URL", file=sys.stderr)
        return []

    items = extract_listview_data(html, listview_id="items")
    if not items:
        print("ERROR: No 'items' Listview found on page", file=sys.stderr)
        return []

    tokens = []
    for item in items:
        if not isinstance(item, dict):
            continue

        name = item.get("name", item.get("displayName", "Unknown"))

        # Apply name filter if provided
        if name_filter and name_filter.lower() not in name.lower():
            continue

        tokens.append({
            "id": item.get("id"),
            "name": name,
            "slotbak": item.get("slotbak", item.get("slot", 0)),
            "armor_subclass": item.get("subclass", 0),
            "quality": item.get("quality", 0),
        })

    print(f"Discovered {len(tokens)} tokens", file=sys.stderr)
    return tokens


def discover_tokens_from_category(category, name_filter=None):
    """Build a Wowhead category URL and scrape it for token items.

    Args:
        category: Wowhead item category name or ID.
        name_filter: Optional substring filter on item names.

    Returns:
        List of dicts (same as discover_tokens_from_url).
    """
    # Wowhead category URLs follow the pattern /items/{category-slug}
    # Common categories for tokens: "junk" (class 15), "miscellaneous",
    # "armor", or specific subcategories.
    # Name filters are appended as /name:{filter} in the URL path for
    # server-side filtering (Wowhead paginates large categories).
    slug = category.lower().replace(" ", "-")
    url = f"https://www.wowhead.com/items/{slug}"
    if name_filter:
        url += f"/name:{name_filter}"
    print(f"Built category URL: {url}", file=sys.stderr)
    tokens = discover_tokens_from_url(url, name_filter=None)
    if not tokens and not name_filter:
        print(
            "WARNING: No results. Large categories may be paginated server-side.\n"
            "  Try adding --name-filter to narrow results, or use --url with a\n"
            "  Wowhead search URL that includes explicit filters.",
            file=sys.stderr,
        )
    return tokens


def fetch_contains(item_id):
    """Fetch a Wowhead item page and extract the 'contains' listview data.

    Args:
        item_id: Integer or string Wowhead item ID.

    Returns:
        List of dicts with keys: id, name, slot, slotbak, appearances, specs
        None if no contains data found.
    """
    url = f"https://www.wowhead.com/item={item_id}"
    html = fetch_url(url)
    if not html:
        return None

    items = extract_listview_data(html, listview_id="contains")
    if not items:
        print(
            f"  WARNING: No 'contains' listview found for item {item_id}",
            file=sys.stderr,
        )
        return None

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


def fetch_contains_for_file(input_path, output_path):
    """Read a JSONC file of tokens and fetch contains data for each.

    Args:
        input_path: Path to input JSONC file with token metadata.
        output_path: Path to write output JSONC with contains data added.
    """
    data = read_jsonc(input_path)
    item_ids = list(data.keys())
    total = len(item_ids)
    print(f"Processing {total} tokens...")

    for idx, item_id in enumerate(item_ids, 1):
        name = data[item_id].get("name_enus", data[item_id].get("name", item_id))
        print(f"[{idx}/{total}] Fetching contains for {item_id} ({name})...")

        contains = fetch_contains(item_id)
        if contains:
            data[item_id]["contains"] = contains
            print(f"  Found {len(contains)} contained items")
        else:
            print(f"  No contains data found")

        if idx < total:
            time.sleep(REQUEST_DELAY)

    write_jsonc(output_path, data)
    print(f"\nDone! Output written to {output_path}")


# ---------------------------------------------------------------------------
# Output formatters
# ---------------------------------------------------------------------------

def format_record(tokens):
    """Format token list as raid_token_record Token Discovery output.

    Output format:
      -- [ITEMID] - Token Name - SLOT - Wowhead
    """
    lines = []
    for t in tokens:
        slot = slot_name(t.get("slotbak", 0))
        lines.append(f"-- [{t['id']}] - {t['name']} - {slot} - Wowhead")
    return "\n".join(lines)


def format_tttgen(tokens):
    """Format token list as /tttgen Item List mode CSV input.

    For contained items (result gear), not the tokens themselves.
    Output format:
      itemId, ARMOR_TYPE, SLOT
    """
    lines = []
    for t in tokens:
        atype = armor_type(t.get("armor_subclass", 0))
        slot = slot_name(t.get("slotbak", 0))
        lines.append(f"{t['id']}, {atype}, {slot}")
    return "\n".join(lines)


def format_tttgen_from_contains(tokens_with_contains):
    """Format contained items from all tokens as /tttgen Item List CSV.

    Takes the full token dict (with contains data) and produces a flat
    CSV of all result items, ready to paste into /tttgen Item List mode.

    Output format:
      # Token Name (itemId)
      resultItemId, ARMOR_TYPE, SLOT
    """
    lines = []
    for token_id, token_data in tokens_with_contains.items():
        name = token_data.get("name_enus", token_data.get("name", token_id))
        contains = token_data.get("contains", [])
        if not contains:
            lines.append(f"# {name} ({token_id}) — no contains data")
            continue

        lines.append(f"# {name} ({token_id})")
        for item in contains:
            slot = slot_name(item.get("slot", 0))
            # Infer armor type from the item's spec list
            specs = item.get("specs", [])
            atype = armor_type_from_specs(specs) or "UNKNOWN"
            lines.append(f"{item['id']}, {atype}, {slot}")

    return "\n".join(lines)


# ---------------------------------------------------------------------------
# CLI subcommands
# ---------------------------------------------------------------------------

def cmd_discover(args):
    """Handle the 'discover' subcommand."""
    if args.url:
        tokens = discover_tokens_from_url(args.url, name_filter=args.name_filter)
    elif args.category:
        tokens = discover_tokens_from_category(
            args.category, name_filter=args.name_filter
        )
    else:
        print("ERROR: --url or --category is required for discover", file=sys.stderr)
        sys.exit(1)

    if args.format == "record":
        print(format_record(tokens))
    elif args.format == "tttgen":
        print(format_tttgen(tokens))
    elif args.format == "jsonc":
        # Build a JSONC-compatible dict and print
        result = {}
        for t in tokens:
            result[str(t["id"])] = {
                "name_enus": t["name"],
                "slotbak": t.get("slotbak"),
            }
        print(json.dumps(result, indent=4))


def cmd_contains(args):
    """Handle the 'contains' subcommand."""
    if args.item_id:
        # Single item quick test
        contains = fetch_contains(args.item_id)
        if contains:
            print(json.dumps(contains, indent=2))
        else:
            print("No contains data found.", file=sys.stderr)
            sys.exit(1)
    elif args.input:
        output = args.output or args.input.replace(".jsonc", "_contains.jsonc")
        fetch_contains_for_file(args.input, output)
    else:
        print(
            "ERROR: --item-id or --input is required for contains", file=sys.stderr
        )
        sys.exit(1)


def cmd_pipeline(args):
    """Handle the 'pipeline' subcommand (discover + contains)."""
    # Step 1: Discover tokens
    print("Step 1: Discovering tokens...", file=sys.stderr)
    tokens = discover_tokens_from_url(args.url, name_filter=args.name_filter)
    if not tokens:
        print("ERROR: No tokens discovered. Aborting pipeline.", file=sys.stderr)
        sys.exit(1)

    # Step 2: Fetch contains data for each token
    print(f"\nStep 2: Fetching contains data for {len(tokens)} tokens...", file=sys.stderr)
    result = {}
    total = len(tokens)
    for idx, token in enumerate(tokens, 1):
        token_id = token["id"]
        print(f"[{idx}/{total}] Fetching contains for {token_id} ({token['name']})...", file=sys.stderr)

        result[str(token_id)] = {
            "name_enus": token["name"],
            "slotbak": token.get("slotbak"),
            "quality": token.get("quality"),
        }

        contains = fetch_contains(token_id)
        if contains:
            result[str(token_id)]["contains"] = contains
            print(f"  Found {len(contains)} contained items", file=sys.stderr)
        else:
            print(f"  No contains data found", file=sys.stderr)

        if idx < total:
            time.sleep(REQUEST_DELAY)

    # Step 3: Output
    if args.format == "jsonc":
        if args.output:
            write_jsonc(args.output, result)
            print(f"\nDone! Output written to {args.output}", file=sys.stderr)
        else:
            print(json.dumps(result, indent=4))
    elif args.format == "tttgen":
        print(format_tttgen_from_contains(result))
    elif args.format == "record":
        print(format_record(tokens))
        print("\n# Contains data available in JSONC format (use --format jsonc)", file=sys.stderr)


# ---------------------------------------------------------------------------
# Argument parser
# ---------------------------------------------------------------------------

def build_parser():
    """Build the argparse argument parser."""
    parser = argparse.ArgumentParser(
        description="Token Discovery & Contains Scraper for TokenTransmogTooltips",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Discover tokens from a Wowhead search URL
  %(prog)s discover --url "https://www.wowhead.com/items?filter=..." --format record

  # Discover tokens and filter by name
  %(prog)s discover --url "https://www.wowhead.com/items/junk" --name-filter "Benthic"

  # Fetch contains data for tokens in a JSONC file
  %(prog)s contains --input BlackEmpireArmor.jsonc

  # Quick test: fetch contains for a single token
  %(prog)s contains --item-id 169479

  # Full pipeline: discover + fetch contains
  %(prog)s pipeline --url "https://www.wowhead.com/items?filter=..." --output result.jsonc
        """,
    )

    subparsers = parser.add_subparsers(dest="command", help="Subcommand to run")
    subparsers.required = True

    # --- discover ---
    discover = subparsers.add_parser(
        "discover",
        help="Discover token item IDs from a Wowhead page",
    )
    discover_source = discover.add_mutually_exclusive_group(required=True)
    discover_source.add_argument(
        "--url",
        help="Wowhead search results or category URL to scrape",
    )
    discover_source.add_argument(
        "--category",
        help="Wowhead item category name or ID",
    )
    discover.add_argument(
        "--name-filter",
        help="Only include items whose name contains this substring (case-insensitive)",
    )
    discover.add_argument(
        "--format",
        choices=["record", "tttgen", "jsonc"],
        default="record",
        help="Output format (default: record)",
    )
    discover.set_defaults(func=cmd_discover)

    # --- contains ---
    contains = subparsers.add_parser(
        "contains",
        help="Fetch 'Contains' tab data from Wowhead for token items",
    )
    contains_source = contains.add_mutually_exclusive_group(required=True)
    contains_source.add_argument(
        "--input",
        help="Path to JSONC file with token metadata (same format as BlackEmpireArmor.jsonc)",
    )
    contains_source.add_argument(
        "--item-id",
        help="Single item ID to fetch contains data for (quick test)",
    )
    contains.add_argument(
        "--output",
        help="Path to write output JSONC file (default: input with _contains suffix)",
    )
    contains.set_defaults(func=cmd_contains)

    # --- pipeline ---
    pipeline = subparsers.add_parser(
        "pipeline",
        help="Full pipeline: discover tokens then fetch their contains data",
    )
    pipeline.add_argument(
        "--url",
        required=True,
        help="Wowhead search results or category URL to scrape",
    )
    pipeline.add_argument(
        "--name-filter",
        help="Only include items whose name contains this substring",
    )
    pipeline.add_argument(
        "--output",
        help="Path to write output JSONC file (if omitted, prints to stdout)",
    )
    pipeline.add_argument(
        "--format",
        choices=["record", "tttgen", "jsonc"],
        default="jsonc",
        help="Output format (default: jsonc for pipeline)",
    )
    pipeline.set_defaults(func=cmd_pipeline)

    return parser


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main():
    parser = build_parser()
    args = parser.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()

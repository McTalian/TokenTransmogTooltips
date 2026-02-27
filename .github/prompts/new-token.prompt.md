---
name: 'new-token'
description: 'Start collecting token data for a new token source (raid or non-raid)'
agent: agent
argument-hint: 'sourceName [sourceAbbrev] [patch]'
---
# New Token Source Data Collection

Begin the process of adding a new token source's data to the addon by creating a structured data collection document. Supports both raid and non-raid token sources (open world drops, vendors, quests, events, etc.).

## Parameters

- `sourceName`: An identifier for the token source, with no spaces or special characters (e.g., "CastleNathria", "Benthic", "BlackEmpire")
- `sourceAbbrev` (optional): A short abbreviation (e.g., "CN", "Ben"). If omitted, use uppercase initials of each word
- `patch` (optional): The WoW patch version when the source was released (e.g., "9.0.2")

## Process

### 1. Validate Input

If `sourceName` is omitted or contains invalid characters (spaces, special characters):
- Prompt the user to provide a valid source name
- Explain the format requirements

### 2. Determine Next ID

1. Examine files in `/.github/raid_token_records/`
2. Find the highest existing ID (sequential 3-digit integers with leading zeros, starting from 001)
3. Increment by 1 to get the next ID

### 3. Create Record

1. Copy `/.github/docs/NEW_RAID_TEMPLATE.md` to `/.github/raid_token_records/{nextID}_{sourceName}.md`
2. Fill in the header with provided information:
   - Source Name
   - Source Abbreviation (provided or derived)
   - Patch Version (if provided)

### 4. Verify Creation

Confirm that the new file was created successfully at the expected path.

### 5. Provide Next Steps

Instruct the user to:
1. Open the newly created record file
2. Fill in the **Source Type** field (Raid | Open World | Vendor | Quest | Event)
3. Fill in **Has Difficulty Tiers** and **Token Group Style** fields
4. Follow the appropriate data collection path:
   - **Raids**: Use the Dungeon Journal "Extract Tokens" button for token IDs, and `/tttgen` for appearance data
   - **Non-Raid sources**: Gather token IDs manually (Wowhead, in-game, `scrape_tokens.py`), and use `/tttgen` Item List mode for appearance data
5. Complete the Class/Difficulty/Slot → AppearanceID/ModID mappings
6. Invoke `@#file:plan-token` with the ID when ready to continue

## Example Usage

```
/new-token sourceName="ManaforgeOmega" sourceAbbrev="MFO" patch="12.1.0"
/new-token sourceName="Benthic" sourceAbbrev="Ben" patch="8.2.0"
```

## Output

- Creates: `/.github/raid_token_records/{ID}_{sourceName}.md`
- User receives: Path to new file and instructions for data collection

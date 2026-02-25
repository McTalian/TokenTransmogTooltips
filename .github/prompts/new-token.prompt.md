---
name: 'new-token'
description: 'Start collecting token data for a new raid'
agent: agent
argument-hint: 'raidName [raidAbbrev] [patch]'
---
# New Raid Data Collection

Begin the process of adding a new raid's token data to the addon by creating a structured data collection document.

## Parameters

- `raidName`: An identifier for the raid, with no spaces or special characters (e.g., "CastleNathria")
- `raidAbbrev` (optional): A short abbreviation for the raid (e.g., "CN"). If omitted, use uppercase initials of each word
- `patch` (optional): The WoW patch version when the raid was released (e.g., "9.0.2")

## Process

### 1. Validate Input

If `raidName` is omitted or contains invalid characters (spaces, special characters):
- Prompt the user to provide a valid raid name
- Explain the format requirements

### 2. Determine Next ID

1. Examine files in `/.github/raid_token_records/`
2. Find the highest existing ID (sequential 3-digit integers with leading zeros, starting from 001)
3. Increment by 1 to get the next ID

### 3. Create Raid Record

1. Copy `/.github/docs/NEW_RAID_TEMPLATE.md` to `/.github/raid_token_records/{nextID}_{raidName}.md`
2. Fill in the header with provided information:
   - Raid Name
   - Raid Abbreviation (provided or derived)
   - Patch Version (if provided)

### 4. Verify Creation

Confirm that the new file was created successfully at the expected path.

### 5. Provide Next Steps

Instruct the user to:
1. Open the newly created raid record file
2. Follow the instructions within to collect token data:
   - Use the Dungeon Journal "Extract Tokens" button for token IDs
   - Use `/tttgen` command for appearance data
   - Complete the Class/Difficulty/Slot → AppearanceID/ModID mappings
3. Invoke `@#file:plan-token` with the ID when ready to continue

## Example Usage

```
/new-token raidName="ManaforgeOmega" raidAbbrev="MFO" patch="12.1.0"
```

## Output

- Creates: `/.github/raid_token_records/{ID}_{raidName}.md`
- User receives: Path to new file and instructions for data collection

# Debugging & Data Collection Tools

This document covers the debugging tools and data collection aids available in alpha builds of the TokenTransmogTooltips addon. These tools are designed to assist with gathering token data, verifying addon behavior, and troubleshooting issues during development.

**Important**: All tools described in this document are only available in alpha builds (code between `--@alpha@` and `--@end-alpha@` markers). They are automatically stripped from release builds.

## Available Tools

### Item Context Display (Tooltip Enhancement)

**What it does**: Displays the numeric `itemContext` value directly on item tooltips.

**Purpose**: Verify that the addon correctly detects the difficulty/acquisition context of tokens.

**Location**: Automatically appears on token tooltips when hovering over tokens

**Current behavior**: Shows the raw numeric value (e.g., `16` for Mythic)

**Usage**: 
1. Hover over any token item (inventory, chat link, Dungeon Journal, etc.)
2. Look for the numeric context value in the tooltip
3. Cross-reference with `Enum.ItemCreationContext` values

**Common context values**:
- `4` = Raid Finder
- `3` = Normal
- `5` = Heroic
- `6` = Mythic

**Note**: To find the Enum name for a context value, see [DungeonJournalExtractor.lua around Line 21](../../TokenTransmogTooltips/DungeonJournalExtractor.lua) for the full difficulty mappings. While showing the Enum name (e.g., "RaidMythic") would be more user-friendly, this would require reverse-lookup logic that hasn't been implemented yet.

### Appearance & Mod IDs (Transmog Collection UI)

**What it does**: Shows `appearanceID` and `modID` values in the Appearance Journal (Collections > Appearance) tooltips.

**Purpose**: Assist in collecting the appearance and mod IDs needed for token data generation.

**Usage**:
1. Open Collections (Shift+P)
2. Navigate to the Appearances tab
3. Browse to a transmog set
4. Hover over individual pieces
5. The tooltip will include appearance and mod ID information

**When to use**: Cross-checking or manually collecting appearance data when `/tttgen` output needs verification.

### TTT_Debug Global Variable

**What it does**: Exposes the entire `ns.tokenClassAppearanceModInfo` table as a global variable for inspection.

**Purpose**: Inspect the fully aggregated token data structure that the addon uses at runtime.

**Access**: Type `/dump TTT_Debug` in-game (requires an addon like DevTool or similar to display Lua tables)

**Location**: Defined in [tokenClassAppearanceModInfo.lua around Line 37](../../TokenTransmogTooltips/tokenClassAppearanceModInfo.lua)

**Usage scenarios**:
- Verify token IDs are registered correctly
- Check difficulty mappings
- Debug faction-specific token data
- Confirm class/appearance/modID relationships
- Identify duplicate token IDs (addon warns on init if detected)

**Structure**: Matches the data model described in [data-model.instructions.md](../data-model.instructions.md)

### Extract Tokens Button (Dungeon Journal)

**What it does**: Extracts token item information from the currently selected raid and difficulty in the Dungeon Journal.

**Purpose**: Automate the identification of token item IDs for a specific raid/difficulty combination.

**Location**: Appears next to the loot tab of the Dungeon Journal when opened

**Implementation**: See [DungeonJournalExtractor.lua around Line 234](../../TokenTransmogTooltips/DungeonJournalExtractor.lua)

**Usage**:
1. Open Dungeon Journal (Shift+J)
2. Select a raid from the dropdown
3. Select a difficulty (LFR, Normal, Heroic, Mythic)
4. Click the "Extract Tokens" button
5. Output will be printed to chat

**Output format**:
```
TokenID: 12345, Context: MYTHIC, Slot: HELM, Classes: Death Knight, Demon Hunter, Warlock
TokenID: 12346, Context: MYTHIC, Slot: SHOULDERS, Classes: Death Knight, Demon Hunter, Warlock
...
```

**Important notes**:
- Extracts **Epic quality items from the "Other" slot** (where tokens are typically listed)
- May include non-token items that can be manually filtered/ignored
- The slot detection is best-effort based on tooltip keyword matching
- Class information is parsed from tooltip text

**When to use**: During the `@#file:new-raid` workflow when filling out the "Token Item ID Mapping" section of the raid template.

### /tttgen Slash Command

**What it does**: Generates raw appearance and modID data by analyzing Transmog Sets in the Collections UI.

**Purpose**: Primary tool for collecting class/difficulty/slot/appearance/modID mappings from in-game transmog sets.

**Implementation**: See [DataGenerator.lua around Line 283](../../TokenTransmogTooltips/DataGenerator.lua)

**Usage**:
1. Open Collections (Shift+P)
2. Navigate to Sets tab
3. Select a set category (e.g., "Raid Finder", "Heroic")
4. Select a class-specific armor set
5. Type `/tttgen` in chat
6. A modal window opens with options and a text area containing the generated output
7. Copy the output from the text area and paste it into the raid template

**Output structure**:

The command generates two main sections:

#### TEMPLATE Block
```
### CLASS - Set Name - DIFFICULTY
SLOT, appearanceID, modID
SLOT, appearanceID, modID
...
```

**Purpose**: Machine-readable format for the `@#file:plan-raid` workflow to consume

**Headers**: `### CLASS - Set Name - Difficulty` (converted by `@#file:plan-raid` to `### TOKENGROUP - CLASS - DIFFICULTY`)

#### AUDIT Block
```
### CLASS - Set Name - DIFFICULTY - SLOT
[ ] Source Item Name (modID)
[X] Source Item Name (modID)  ← Pre-selected best match
[ ] Source Item Name (modID)
```

**Purpose**: Manual verification for slots with multiple source items

**Selection**: Mark the correct source with `[X]`, leave others as `[ ]`

**Pre-selection logic**: The tool attempts to auto-select the best match by comparing set name words with source item names (see [DataGenerator.lua around Line 26](../../TokenTransmogTooltips/DataGenerator.lua) `TokenizeWords` and `GetWordOverlapScore`)

**When to use**: During the `@#file:new-raid` workflow after filling token IDs and before running `@#file:plan-raid`.

**Key behaviors**:
- If an appearance has multiple sources (different items that grant the same appearance), all are listed in the AUDIT block
- If multiple modIDs are valid for an appearance, they can be kept using `|` separator in the final data
- The TEMPLATE block uses the pre-selected source, but you can change the `[X]` in AUDIT if needed

**Workflow integration**:
1. User runs `/tttgen` for each relevant set
2. User pastes RAW OUTPUT into raid template
3. User reviews AUDIT blocks and marks selections with `[X]`
4. User runs `@#file:plan-raid` to generate PLAN OUTPUT
5. If any AUDIT block lacks `[X]`, planning halts with blocking issues listed

#### Understanding /tttgen Output Format

The `/tttgen` output includes additional details that help with the `@#file:plan-raid` workflow:

**TEMPLATE headers format**: `### CLASS - Set Name - Difficulty`
- Example: `### MAGE - Mystic Raiment - HEROIC`
- The `@#file:plan-raid` command transforms these into `### TOKENGROUP - CLASS - DIFFICULTY` using the Token Groups & Class Mappings section
- Example result: `### MYSTIC - MAGE - HEROIC`

**Using appearanceID and modID**:
- Use `appearanceID` and `modID` from the best candidate source
- If multiple modIDs are valid for a single appearanceID, keep all using `|` separator (e.g., `12345|12346`)
- The AUDIT block helps track which source was selected for each appearance

**Pre-selection notes**:
- In the AUDIT block, mark the chosen source with `[X]` and leave others as `[ ]` for a paper trail
- The generator pre-selects a candidate by matching set name words with source item names
- You can change the `[X]` selection if the pre-selected source isn't correct

## Data Collection Workflow Overview

The typical flow for collecting token data:

1. **Token IDs**: Use "Extract Tokens" button in Dungeon Journal
2. **Appearance Data**: Use `/tttgen` command for each class/difficulty/set
3. **Verification**: Use TTT_Debug global to inspect final data structure
4. **Testing**: Use Item Context display to verify difficulty detection in-game

## Troubleshooting

### /tttgen produces no output
- Ensure you're viewing a class-specific armor set (not a weapon or cosmetic set)
- Verify the set has items in slots that tokens cover (helm, shoulders, chest, etc.)
- Check that you're on the Sets tab, not Appearances

### Extract Tokens button missing
- Ensure you're running an alpha build
- Verify the Dungeon Journal is fully loaded
- Check that you've selected a raid (not a dungeon)

### Item Context shows unexpected values
- Legacy tokens may show `itemContext = 0` (no difficulty data)
- Some item creation contexts may map to a "non-standard" difficulty (e.g., Extended variants)
- See [DungeonJournalExtractor.lua around Line 21](../../TokenTransmogTooltips/DungeonJournalExtractor.lua) for mappings

### TTT_Debug is nil
- Ensure you're running an alpha build
- The variable is only populated after all Raids/ files load
- wow-build-tools generates alpha builds only if the current git commit is not tagged as a release - even if you have uncommitted changes, it will be a release build if the last commit is tagged
- Try reloading UI (`/reload`) if accessed too early

## Future Enhancements

### Item Context Display - Enum Name Lookup

**Current State**: Item Context tooltip shows only the numeric value (e.g., `16`)

**Enhancement**: Display the Enum name alongside the numeric value (e.g., `16 (RaidMythic)`)

**Implementation Approach**: 
Since WoW Lua enums are tables, they can be reverse-looked up by iterating through the table to find the key that matches the numeric value:

```lua
local function GetEnumName(enumTable, value)
  for name, enumValue in pairs(enumTable) do
    if enumValue == value then
      return name
    end
  end
  return nil
end

-- Usage: GetEnumName(Enum.ItemCreationContext, 16) → "RaidMythic"
```

**Benefits**:
- Faster visual identification of difficulty during data collection
- Reduces need to cross-reference numeric values with mappings
- Improves overall data extraction workflow efficiency
- Eliminates potential for misidentifying context values

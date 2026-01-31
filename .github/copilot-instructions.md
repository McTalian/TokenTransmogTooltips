# TokenTransmogTooltips - AI Agent Instructions

## Project Overview
World of Warcraft addon that enhances tooltips for raid gear tokens by showing which transmog appearances the player is missing. **All transmog data is manually maintained** - there is no Blizzard API for token-to-gear mappings.

## Architecture & Data Flow

### Core Components
1. **[Core.lua](../TokenTransmogTooltips/Core.lua)**: Tooltip hook system using WoW's `TooltipDataProcessor` API
2. **[tokenClassAppearanceModInfo.lua](../TokenTransmogTooltips/tokenClassAppearanceModInfo.lua)**: Central registry that aggregates all raid data into token lookups
3. **Raids/**: Hierarchical data structure organized by raid → token group → class → difficulty → slot

### Data Model Pattern
Each raid follows this structure:
```
Raids/
  RaidName/
    _index.lua          # Creates ns._Gear.RaidName namespace
    _index.xml          # Loads subdirectories and tokens.lua
    tokens.lua          # Maps item IDs to appearance/mod ID lookups
    tokengroup/         # e.g., mystic, venerated, conqueror
      class.lua         # appearanceID → {modID} mappings by difficulty
      tokengroup.lua    # Aggregates classes into token group structure
      _index.xml        # Loads all class files + aggregator
```

**Key IDs**:
- `itemID`: Token item identifier
- `appearanceID`: Visual appearance (multiple gear pieces may share)
- `modID` (sourceID): Specific gear piece variant (difficulty/color)
- `itemContext`: Difficulty level (LFR=17, Normal=1, Heroic=5, Mythic=6)

### Token Resolution Flow
1. User hovers over token → [Core.lua](../TokenTransmogTooltips/Core.lua#L27) `GetTooltipInfo()`
2. Extract `itemContext` from item link (difficulty)
3. Lookup in `ns.tokenClassAppearanceModInfo[tokenId]`
4. Navigate: `tokenData.Difficulties[itemContext]` → faction branch → class appearances
5. Query `C_TransmogCollection` API to check player collection status
6. Display missing items with class icons in tooltip

## Development Workflows

### Building & Packaging
```bash
# Development build with alpha markers (--@alpha@/--@end-alpha@ blocks included)
make build

# Watch mode for live development
make watch
```

Uses `McTalian/wow-build-tools` which processes special comments:
- `--@alpha@`/`--@end-alpha@`: Debug code (stripped in releases)
- `@project-version@`: Replaced with version from `.toc` file

### Data Collection Workflow

**For Current/Recent Content**: Use WoW's built-in tools:
1. **Dungeon Journal**: Identify token item IDs and which tokens belong to each raid and difficulty
2. **/tttgen (alpha builds)**: Generate per-class per-difficulty appearance/modID data from Transmog Sets
3. **Transmog Set Collection UI** (in Collections): Cross-check appearances if needed

**Notes**:
- Wowhead can help identify token group class compositions and potentially item IDs, but it should always be verified in-game.
- "Curio" tokens (wildcard items for any slot) appeared in Shadowlands/Dragonflight but may not exist in all seasons.

### Adding New Raid Data

**Workflow**:
1. **User** issues `$newRaid RaidName` → creates numbered copy of [NEW_RAID_TEMPLATE.md](../.collab/templates/NEW_RAID_TEMPLATE.md) in `.collab/raid_token_records/` directory (e.g., `001_RaidName.md`)
2. **User** fills "Raid Information", "Token Groups & Class Mappings", "Difficulties", "Token Names & Slots"
3. **User** issues `$stub 001` → generates Token Item ID Mapping stubs
4. **User** fills Token Item ID Mapping from the Dungeon Journal
5. **User** runs `/tttgen` (alpha builds) and pastes the RAW OUTPUT into the template
6. **User** reviews the AUDIT output and marks the selected line with `[X]`
7. **User** issues `$plan 001` → generates the PLAN OUTPUT section from RAW OUTPUT + selections
8. **User** reviews PLAN OUTPUT
9. **User** issues `$generate 001` → triggers final code generation
7. **Agent** reads completed template and generates all Lua/XML files using patterns below
8. **Agent** verifies all XML wiring and load order

#### /tttgen Output Notes (Alpha)
- Output includes a TEMPLATE block (slot, appearanceID, modID) and an AUDIT block (all sources for multi-source slots).
- TEMPLATE headers are `### CLASS - Set Name - Difficulty` and are converted by `$plan` into `### TOKENGROUP - CLASS - DIFFICULTY`.
- Use `appearanceID` and `modID` from the best candidate source; if multiple are valid, keep all `modID`s using `|`.
- In the AUDIT block, mark the chosen source with `[X]` and leave others as `[ ]` for a paper trail.
- The generator preselects a candidate by matching the set name in the source item name; change `[X]` if needed.

#### Plan Generation (`$plan [ID]`)
- Reads RAW OUTPUT and AUDIT selections from the agent record.
- Maps CLASS to TOKENGROUP using the Token Groups & Class Mappings section.
- Produces the PLAN OUTPUT section with `### TOKENGROUP - CLASS - DIFFICULTY` headers and `SLOT, appearanceID, modID` lines.
- If any AUDIT block has no `[X]` selection, list it as a blocking issue in the PLAN OUTPUT section.

#### Lua Generation Patterns

**Class file** (e.g., `Raids/NewRaid/tokengroup/class.lua`):
```lua
local addonName, ns = ...
local mergeTable = ns.mergeTable

ns._Gear.NewRaid.CLASS = {
  ["RAID_FINDER"] = {
    ["HELM"] = {[appearanceID]={modID,},},
    ["SHOULDERS"] = {[appearanceID]={modID,},},
    -- ... slots ...
  },
  -- ... other difficulties ...
}
-- Merge all slots into ["ALL"] for wildcard tokens
ns._Gear.NewRaid.CLASS["RAID_FINDER"]["ALL"] = { /* merged */ }
```

**Token group aggregator** (e.g., `tokengroup/tokengroup.lua`):
```lua
local addonName, ns = ...
local gear = ns._Gear.NewRaid

ns._Gear.NewRaid["TOKENGROUP"] = {
  ["RAID_FINDER"] = {
    ["HELM"] = {
      ["CLASS1"] = gear["CLASS1"]["RAID_FINDER"]["HELM"],
      ["CLASS2"] = gear["CLASS2"]["RAID_FINDER"]["HELM"],
    },
    -- ... other slots & difficulties ...
  },
}
```

**Token mapping** (e.g., `tokens.lua`):
```lua
local addonName, ns = ...
local tokenGroup = ns._Gear.NewRaid["TOKENGROUP"]

ns.Raids.NewRaid = {
  [12345] = {  -- Token item ID
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = tokenGroup["RAID_FINDER"]["HELM"],
      [Enum.ItemCreationContext.RaidNormal] = tokenGroup["NORMAL"]["HELM"],
      [Enum.ItemCreationContext.RaidHeroic] = tokenGroup["HEROIC"]["HELM"],
      [Enum.ItemCreationContext.RaidMythic] = tokenGroup["MYTHIC"]["HELM"],
    }
  },
}
```

**Important**: The `Difficulties` table keys must match the Enum values specified in the template's "Difficulties" section. Do not convert them to numeric values.

#### XML Wiring

- **Class `_index.xml`**: Load all class files, then aggregator
- **Token group `_index.xml`**: Load all class files for that group, then the group aggregator
- **Raid `_index.xml`**: Load `_index.lua` as first script, then include all token group `_index.xml` files, then load `tokens.lua` as last script
- **`_raids.xml`**: Add raid include (alphabetical for legacy, chronological for modern)

**Critical**: Load order matters:
1. Raid `_index.lua` (creates namespace, must be first)
2. Token group `_index.xml` files (include classes and aggregators)
3. `tokens.lua` (references token groups, must be last)

**Example raid `_index.xml`**:
```xml
<Ui xmlns="http://www.blizzard.com/wow/ui/">
  <Script file="_index.lua"/>
  <Include file="tokengroup1/_index.xml"/>
  <Include file="tokengroup2/_index.xml"/>
  <Include file="tokengroup3/_index.xml"/>
  <Include file="tokengroup4/_index.xml"/>
  <Script file="tokens.lua"/>
</Ui>
```

### Debugging Tools
- **Item Context**: Displayed on tooltips (alpha builds) to verify difficulty detection
- **Appearance IDs**: Shown in Appearance Journal tooltips (alpha) for data collection
- `TTT_Debug` global: Dump of `ns.tokenClassAppearanceModInfo` for inspection
- **In-Game Sources**: `alpha` builds add `appearanceID` and `modID` to Collection window tooltips for easy data extraction

## Project-Specific Conventions

### Token Group Naming & Composition
**Token group names and class compositions vary by raid/tier/season** — there is no universal standard across expansions.

**Examples**:
- **Shadowlands**: MYSTIC (Druid/Hunter/Mage), VENERATED (Paladin/Priest/Shaman), ZENITH (Evoker/Monk/Rogue/Warrior), DREADFUL (DK/DH/Warlock)
- **Dragonflight**: VOIDWOVEN (Mage/Priest/Warlock), VOIDCURED (DH/Druid/Monk/Rogue), VOIDCAST (Evoker/Hunter/Shaman), VOIDFORGED (DK/Paladin/Warrior)
- **WoD/Legion**: CONQUEROR, PROTECTOR, VANQUISHER
- **TBC/Wrath**: CHAMPION, DEFENDER, HERO (or Conqueror/Protector/Vanquisher)

When adding new raids, extract group names and class mappings from the Dungeon Journal.

### Faction-Specific Tokens
Some raids have Alliance/Horde variants. Use this pattern:
```lua
[tokenID] = {
  ALLIANCE = { ... },
  HORDE = { ... },
}
```
[Core.lua](../TokenTransmogTooltips/Core.lua#L50) handles faction detection via `UnitFactionGroup("player")`.

### Wildcard/Multi-Slot Tokens
Tokens redeemable for any slot (e.g., Curios) use `["ALL"]` key containing merged slot data.

## External Dependencies
- **Blizzard APIs**: `C_TransmogCollection`, `LinkUtil`, `TooltipDataProcessor`
- **Build**: `wow-build-tools` (Node-based packager for CurseForge/GitHub releases)
- **No Libraries**: Pure Lua, no third-party addon libraries

## Testing Checklist
- [ ] Tooltip shows correct class icons (uses `CreateAtlasMarkup`)
- [ ] Missing items appear as clickable links
- [ ] Collected appearances show green "Collected" text
- [ ] Works across all difficulties (LFR/N/H/M)
- [ ] Faction-specific tokens resolve correctly
- [ ] No duplicate token IDs error (alpha builds detect this)

## Common Gotchas
1. **Single-element arrays**: Must use `{value,}` - trailing comma prevents Lua from unpacking
2. **itemContext 0**: Some old tokens lack difficulty data, handle gracefully
3. **Async link loading**: Tooltips may refresh multiple times as `GetAppearanceSourceInfo()` loads
4. **XML load order matters**: Classes before aggregators, token groups before tokens.lua

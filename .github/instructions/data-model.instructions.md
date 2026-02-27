---
name: 'Data Model'
description: 'Data architecture and directory organization for raid/token/appearance data'
applyTo: '**'
---

# Data Model Architecture

This document defines the mandatory data structure and organization patterns for TokenTransmogTooltips. These rules ensure consistency and maintainability across the large dataset.

## Key Identifiers

- **`itemID`**: Token item identifier
- **`appearanceID`**: Visual appearance (multiple items may grant the same appearance)
- **`modID`** (sourceID): The specific item that grants the appearance
- **`itemContext`**: How/where the token was obtained (usually difficulty: LFR/Normal/Heroic/Mythic)

## Directory Structure Requirements

```
TokenTransmogTooltips/
  Raids/
    {RaidName}/
      {tokengroup1}/
        _index.xml           # Load order: classes → aggregator
        {class1}.lua         # Class-specific appearance data
        {class2}.lua
        ...
        {tokengroup1}.lua    # Aggregates class data for this token group
      {tokengroup2}/
        ...
      _index.lua             # Creates ns._Gear.{RaidName} table
      _index.xml             # Load order: _index.lua → token groups → tokens.lua
      tokens.lua             # Maps token IDs to aggregated data
    _index.lua               # Creates ns._Gear and ns.Raids tables
    _raids.xml               # Includes all raid _index.xml files
  tokenClassAppearanceModInfo.lua  # Central registry, imports from ns.Raids
```

## Token Group Naming Patterns

**Token group names and class compositions vary by raid/tier/season** - there is no universal standard across expansions.

### Examples by Era

**Midnight (TWW Season 2+)**:
- VOIDWOVEN (Mage/Priest/Warlock)
- VOIDCURED (DH/Druid/Monk/Rogue)
- VOIDCAST (Evoker/Hunter/Shaman)
- VOIDFORGED (DK/Paladin/Warrior)
- Pattern: Grouped by armor class (Cloth/Leather/Mail/Plate)

**Shadowlands/Dragonflight**:
- MYSTIC (Druid/Hunter/Mage)
- VENERATED (Paladin/Priest/Shaman)
- ZENITH (Evoker/Monk/Rogue/Warrior)
- DREADFUL (DK/DH/Warlock)

**WoD/Legion**:
- CONQUEROR
- PROTECTOR
- VANQUISHER

**TBC/Wrath**:
- CHAMPION
- DEFENDER
- HERO
- (or Conqueror/Protector/Vanquisher)

Token group names are used **only for directory organization** to aid troubleshooting and data maintenance.

## Required Load Order

### Token Group `_index.xml`
1. All class `.lua` files (order doesn't matter)
2. Token group aggregator `.lua` file

### Raid `_index.xml`
1. `_index.lua` (creates namespace, **must be first**)
2. All token group `_index.xml` files (order doesn't matter)
3. `tokens.lua` (references token groups, **must be last**)

### Root `_raids.xml`
- Legacy raids: Alphabetical order
- Modern raids: Chronological order

**Violation of load order will cause nil reference errors.**

## tokens.lua Data Structure

The `tokens.lua` file creates and populates the `ns.Raids.{RaidName}` table.

### Standard Structure (Modern Raids)

```lua
local addonName, ns = ...
ns.Raids.RaidName = {
  [tokenID] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = {
        ["WARRIOR"] = {
          [appearanceID] = { modID, },
        },
        ["MAGE"] = {
          [appearanceID] = { modID, },
        },
      },
      [Enum.ItemCreationContext.RaidNormal] = {
        -- Same structure
      },
      [Enum.ItemCreationContext.RaidHeroic] = {
        -- Same structure
      },
      [Enum.ItemCreationContext.RaidMythic] = {
        -- Same structure
      },
    },
  },
  [anotherTokenID] = {
    -- Same structure
  },
}
```

### Faction-Specific Tokens

Some raids have different tokens for Alliance and Horde:

```lua
[tokenID] = {
  Difficulties = {
    [Enum.ItemCreationContext.RaidNormal] = {
      ["ALLIANCE"] = {
        ["WARRIOR"] = { [appearanceID] = { modID, }, },
      },
      ["HORDE"] = {
        ["WARRIOR"] = { [appearanceID] = { modID, }, },
      },
    },
  },
}
```

### Curio/Wildcard Tokens

Since Shadowlands, some raids include "curio" tokens that work for any slot:

```lua
-- Class file includes ALL slot using mergeTable(target, source)
-- mergeTable takes exactly 2 arguments: copies source keys into target, returns target.
local LOCAL_DIFFICULTY_GEAR = {}
mergeTable(LOCAL_DIFFICULTY_GEAR, gear.CLASS["DIFFICULTY"]["HELM"])
mergeTable(LOCAL_DIFFICULTY_GEAR, gear.CLASS["DIFFICULTY"]["SHOULDERS"])
mergeTable(LOCAL_DIFFICULTY_GEAR, gear.CLASS["DIFFICULTY"]["CHEST"])
-- ... all slots ...
ns._Gear.RaidName.CLASS["DIFFICULTY"]["ALL"] = LOCAL_DIFFICULTY_GEAR

-- Token mapping references ALL
[curioTokenID] = {
  Difficulties = {
    [Enum.ItemCreationContext.RaidMythic] = tokenGroup["MYTHIC"]["ALL"],
  },
}
```

## Class File Structure

Each class file populates `ns._Gear.{RaidName}.{CLASS}` with difficulty → slot → appearance → modID mappings:

```lua
local addonName, ns = ...
local mergeTable = ns.mergeTable

ns._Gear.RaidName.CLASS = {
  ["RAID_FINDER"] = {
    ["HELM"] = {[appearanceID] = {modID,},},
    ["SHOULDERS"] = {[appearanceID] = {modID,},},
    ["CHEST"] = {[appearanceID] = {modID,},},
    ["HANDS"] = {[appearanceID] = {modID,},},
    ["LEGS"] = {[appearanceID] = {modID,},},
  },
  ["NORMAL"] = {
    -- Same slot structure
  },
  ["HEROIC"] = {
    -- Same slot structure
  },
  ["MYTHIC"] = {
    -- Same slot structure
  },
}

-- If curio tokens exist, merge all slots per difficulty
-- mergeTable(target, source) takes exactly 2 args.
local LOCAL_RAID_FINDER_GEAR = {}
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.RaidName.CLASS["RAID_FINDER"]["HELM"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.RaidName.CLASS["RAID_FINDER"]["SHOULDERS"])
-- ... etc for all slots
ns._Gear.RaidName.CLASS["RAID_FINDER"]["ALL"] = LOCAL_RAID_FINDER_GEAR
-- Repeat for NORMAL, HEROIC, MYTHIC
```

## Token Group Aggregator Structure

Token group files aggregate class data by difficulty and slot:

```lua
local addonName, ns = ...
local gear = ns._Gear.RaidName

ns._Gear.RaidName.TOKENGROUP = {
  ["RAID_FINDER"] = {
    ["HELM"] = {
      ["WARRIOR"] = gear.WARRIOR["RAID_FINDER"]["HELM"],
      ["DEATHKNIGHT"] = gear.DEATHKNIGHT["RAID_FINDER"]["HELM"],
      ["PALADIN"] = gear.PALADIN["RAID_FINDER"]["HELM"],
    },
    ["SHOULDERS"] = {
      -- Same class structure
    },
    -- ... other slots
  },
  ["NORMAL"] = {
    -- Same structure
  },
  -- ... other difficulties
}
```

## Difficulty Enum Values

Use `Enum.ItemCreationContext` constants, not numeric values:

- `Enum.ItemCreationContext.RaidFinder` (LFR)
- `Enum.ItemCreationContext.RaidNormal`
- `Enum.ItemCreationContext.RaidHeroic`
- `Enum.ItemCreationContext.RaidMythic`

Some legacy tokens use `itemContext = 0` for unknown/universal difficulty.

## Slot Names

Standard slot identifiers used as table keys:
- `HELM`
- `SHOULDERS`
- `CLOAK`
- `CHEST`
- `BELT`
- `BRACERS`
- `GAUNTLETS`
- `LEGGINGS`
- `BOOTS`
- `ALL` (curio/wildcard tokens only)

Not all slots appear in every token source — raid tier tokens typically only cover `HELM`, `SHOULDERS`, `CHEST`, `GAUNTLETS`, and `LEGGINGS`, while open world token sources may cover all armor slots.

When naming local variables in `tokens.lua`, shortened slot names are used:
- `HELM` → `_HEAD`
- `LEGGINGS` → `_LEGS`
- `GAUNTLETS` → `_HANDS`
- Other slots use their table key name as-is

## Non-Raid Token Patterns

Not all token sources come from raids. Open world drops, vendors, quests, and events may also have tokens that the addon supports. These follow slightly different structural patterns:

### Armor-Type Specific (e.g., BlackEmpire, ForbiddenReach)

Tokens are organized by armor type rather than class-based groups. Directory structure uses `cloth/`, `leather/`, `mail/`, `plate/` instead of named groups.

```lua
-- Class files use a source-specific difficulty key instead of standard difficulties
ns._Gear.SourceName.CLASS = {
  ["SOURCE_KEY"] = {  -- e.g., "NZOTH_ASSAULTS", "THE_FORBIDDEN_REACH"
    ["HELM"] = {[appearanceID] = {modID,},},
    -- ... other slots
  },
}

-- Aggregator uses armor type string key
ns._Gear.SourceName["PLATE"] = {
  ["SOURCE_KEY"] = {
    ["HELM"] = {
      ["WARRIOR"] = gear.WARRIOR["SOURCE_KEY"]["HELM"],
      -- ... other classes
    },
  },
}

-- tokens.lua maps directly, no Difficulties wrapper
ns.Raids.SourceName = {
  [tokenID] = plateGear["HELM"],  -- Direct mapping, itemContext = 0
}
```

### Universal Token (e.g., Benthic)

One token per slot usable by all classes. All armor types are merged into a single table per slot using `mergeTable`.

```lua
-- tokens.lua merges all armor types per slot
local allClassGear = {}
for _, slot in ipairs(SLOTS) do
  allClassGear[slot] = {}
  mergeTable(allClassGear[slot], clothGear[slot])
  mergeTable(allClassGear[slot], leatherGear[slot])
  mergeTable(allClassGear[slot], mailGear[slot])
  mergeTable(allClassGear[slot], plateGear[slot])
end

ns.Raids.SourceName = {
  [tokenID] = allClassGear["HELM"],  -- Contains all classes, itemContext = 0
}
```

### How itemContext = 0 Works

When a token has `itemContext = 0` (no difficulty information), [Core.lua](/TokenTransmogTooltips/Core.lua) skips the `Difficulties` unwrapping step:

```lua
if itemContext > 0 and tokenData.Difficulties then
  tokenData = tokenData.Difficulties[itemContext]
end
```

This means non-raid tokens map directly from `tokenID` → class appearance data without any difficulty indirection.

## Backwards Compatibility Considerations

Blizzard has changed token systems multiple times. The data model must accommodate:
- Legacy tokens without difficulty context
- Faction-specific token variants
- Curio/wildcard tokens (Shadowlands+)
- Varying token group compositions across expansions
- Non-raid token sources (open world, vendors, quests, events)
- Armor-type-based token groups vs. class-based token groups

When adding new token source data, verify the structure matches existing patterns for that era/expansion. Use the Source Type and Token Group Style fields in the record template to determine the correct code generation pattern.

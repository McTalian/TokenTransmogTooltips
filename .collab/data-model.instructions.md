---
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
-- Class file includes ALL slot
ns._Gear.RaidName.CLASS["DIFFICULTY"]["ALL"] = mergeTable(
  gear.CLASS["DIFFICULTY"]["HELM"],
  gear.CLASS["DIFFICULTY"]["SHOULDERS"],
  gear.CLASS["DIFFICULTY"]["CHEST"],
  -- ... all slots ...
)

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

-- If curio tokens exist, merge all slots
ns._Gear.RaidName.CLASS["RAID_FINDER"]["ALL"] = mergeTable(
  ns._Gear.RaidName.CLASS["RAID_FINDER"]["HELM"],
  ns._Gear.RaidName.CLASS["RAID_FINDER"]["SHOULDERS"],
  -- ... etc
)
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

Standard slot identifiers:
- `HELM`
- `SHOULDERS`
- `CHEST`
- `HANDS`
- `LEGS`
- `ALL` (curio/wildcard tokens only)

## Backwards Compatibility Considerations

Blizzard has changed token systems multiple times. The data model must accommodate:
- Legacy tokens without difficulty context
- Faction-specific token variants
- Curio/wildcard tokens (Shadowlands+)
- Varying token group compositions across expansions

When adding new raid data, verify the structure matches existing patterns for that era/expansion.

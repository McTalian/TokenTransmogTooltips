local addonName, ns = ...

local mergeTable = ns.mergeTable

---@type MS1GearLookup
local ms1Gear = ns._Gear.MS1
---@type MS1Woven
local wovenGear = ms1Gear["_WOVEN"]
---@type MS1Forged
local forgedGear = ms1Gear["_FORGED"]
---@type MS1Cured
local curedGear = ms1Gear["_CURED"]
---@type MS1Cast
local castGear = ms1Gear["_CAST"]

local RAID_FINDER_WOVEN_HEAD = wovenGear["RAID_FINDER"]["HELM"]
local RAID_FINDER_WOVEN_SHOULDERS = wovenGear["RAID_FINDER"]["SHOULDERS"]
local RAID_FINDER_WOVEN_CHEST = wovenGear["RAID_FINDER"]["CHEST"]
local RAID_FINDER_WOVEN_LEGS = wovenGear["RAID_FINDER"]["LEGGINGS"]
local RAID_FINDER_WOVEN_HANDS = wovenGear["RAID_FINDER"]["GAUNTLETS"]
local NORMAL_WOVEN_HEAD = wovenGear["NORMAL"]["HELM"]
local NORMAL_WOVEN_SHOULDERS = wovenGear["NORMAL"]["SHOULDERS"]
local NORMAL_WOVEN_CHEST = wovenGear["NORMAL"]["CHEST"]
local NORMAL_WOVEN_LEGS = wovenGear["NORMAL"]["LEGGINGS"]
local NORMAL_WOVEN_HANDS = wovenGear["NORMAL"]["GAUNTLETS"]
local HEROIC_WOVEN_HEAD = wovenGear["HEROIC"]["HELM"]
local HEROIC_WOVEN_SHOULDERS = wovenGear["HEROIC"]["SHOULDERS"]
local HEROIC_WOVEN_CHEST = wovenGear["HEROIC"]["CHEST"]
local HEROIC_WOVEN_LEGS = wovenGear["HEROIC"]["LEGGINGS"]
local HEROIC_WOVEN_HANDS = wovenGear["HEROIC"]["GAUNTLETS"]
local MYTHIC_WOVEN_HEAD = wovenGear["MYTHIC"]["HELM"]
local MYTHIC_WOVEN_SHOULDERS = wovenGear["MYTHIC"]["SHOULDERS"]
local MYTHIC_WOVEN_CHEST = wovenGear["MYTHIC"]["CHEST"]
local MYTHIC_WOVEN_LEGS = wovenGear["MYTHIC"]["LEGGINGS"]
local MYTHIC_WOVEN_HANDS = wovenGear["MYTHIC"]["GAUNTLETS"]

local RAID_FINDER_FORGED_HEAD = forgedGear["RAID_FINDER"]["HELM"]
local RAID_FINDER_FORGED_SHOULDERS = forgedGear["RAID_FINDER"]["SHOULDERS"]
local RAID_FINDER_FORGED_CHEST = forgedGear["RAID_FINDER"]["CHEST"]
local RAID_FINDER_FORGED_LEGS = forgedGear["RAID_FINDER"]["LEGGINGS"]
local RAID_FINDER_FORGED_HANDS = forgedGear["RAID_FINDER"]["GAUNTLETS"]
local NORMAL_FORGED_HEAD = forgedGear["NORMAL"]["HELM"]
local NORMAL_FORGED_SHOULDERS = forgedGear["NORMAL"]["SHOULDERS"]
local NORMAL_FORGED_CHEST = forgedGear["NORMAL"]["CHEST"]
local NORMAL_FORGED_LEGS = forgedGear["NORMAL"]["LEGGINGS"]
local NORMAL_FORGED_HANDS = forgedGear["NORMAL"]["GAUNTLETS"]
local HEROIC_FORGED_HEAD = forgedGear["HEROIC"]["HELM"]
local HEROIC_FORGED_SHOULDERS = forgedGear["HEROIC"]["SHOULDERS"]
local HEROIC_FORGED_CHEST = forgedGear["HEROIC"]["CHEST"]
local HEROIC_FORGED_LEGS = forgedGear["HEROIC"]["LEGGINGS"]
local HEROIC_FORGED_HANDS = forgedGear["HEROIC"]["GAUNTLETS"]
local MYTHIC_FORGED_HEAD = forgedGear["MYTHIC"]["HELM"]
local MYTHIC_FORGED_SHOULDERS = forgedGear["MYTHIC"]["SHOULDERS"]
local MYTHIC_FORGED_CHEST = forgedGear["MYTHIC"]["CHEST"]
local MYTHIC_FORGED_LEGS = forgedGear["MYTHIC"]["LEGGINGS"]
local MYTHIC_FORGED_HANDS = forgedGear["MYTHIC"]["GAUNTLETS"]

local RAID_FINDER_CURED_HEAD = curedGear["RAID_FINDER"]["HELM"]
local RAID_FINDER_CURED_SHOULDERS = curedGear["RAID_FINDER"]["SHOULDERS"]
local RAID_FINDER_CURED_CHEST = curedGear["RAID_FINDER"]["CHEST"]
local RAID_FINDER_CURED_LEGS = curedGear["RAID_FINDER"]["LEGGINGS"]
local RAID_FINDER_CURED_HANDS = curedGear["RAID_FINDER"]["GAUNTLETS"]
local NORMAL_CURED_HEAD = curedGear["NORMAL"]["HELM"]
local NORMAL_CURED_SHOULDERS = curedGear["NORMAL"]["SHOULDERS"]
local NORMAL_CURED_CHEST = curedGear["NORMAL"]["CHEST"]
local NORMAL_CURED_LEGS = curedGear["NORMAL"]["LEGGINGS"]
local NORMAL_CURED_HANDS = curedGear["NORMAL"]["GAUNTLETS"]
local HEROIC_CURED_HEAD = curedGear["HEROIC"]["HELM"]
local HEROIC_CURED_SHOULDERS = curedGear["HEROIC"]["SHOULDERS"]
local HEROIC_CURED_CHEST = curedGear["HEROIC"]["CHEST"]
local HEROIC_CURED_LEGS = curedGear["HEROIC"]["LEGGINGS"]
local HEROIC_CURED_HANDS = curedGear["HEROIC"]["GAUNTLETS"]
local MYTHIC_CURED_HEAD = curedGear["MYTHIC"]["HELM"]
local MYTHIC_CURED_SHOULDERS = curedGear["MYTHIC"]["SHOULDERS"]
local MYTHIC_CURED_CHEST = curedGear["MYTHIC"]["CHEST"]
local MYTHIC_CURED_LEGS = curedGear["MYTHIC"]["LEGGINGS"]
local MYTHIC_CURED_HANDS = curedGear["MYTHIC"]["GAUNTLETS"]

local RAID_FINDER_CAST_HEAD = castGear["RAID_FINDER"]["HELM"]
local RAID_FINDER_CAST_SHOULDERS = castGear["RAID_FINDER"]["SHOULDERS"]
local RAID_FINDER_CAST_CHEST = castGear["RAID_FINDER"]["CHEST"]
local RAID_FINDER_CAST_LEGS = castGear["RAID_FINDER"]["LEGGINGS"]
local RAID_FINDER_CAST_HANDS = castGear["RAID_FINDER"]["GAUNTLETS"]
local NORMAL_CAST_HEAD = castGear["NORMAL"]["HELM"]
local NORMAL_CAST_SHOULDERS = castGear["NORMAL"]["SHOULDERS"]
local NORMAL_CAST_CHEST = castGear["NORMAL"]["CHEST"]
local NORMAL_CAST_LEGS = castGear["NORMAL"]["LEGGINGS"]
local NORMAL_CAST_HANDS = castGear["NORMAL"]["GAUNTLETS"]
local HEROIC_CAST_HEAD = castGear["HEROIC"]["HELM"]
local HEROIC_CAST_SHOULDERS = castGear["HEROIC"]["SHOULDERS"]
local HEROIC_CAST_CHEST = castGear["HEROIC"]["CHEST"]
local HEROIC_CAST_LEGS = castGear["HEROIC"]["LEGGINGS"]
local HEROIC_CAST_HANDS = castGear["HEROIC"]["GAUNTLETS"]
local MYTHIC_CAST_HEAD = castGear["MYTHIC"]["HELM"]
local MYTHIC_CAST_SHOULDERS = castGear["MYTHIC"]["SHOULDERS"]
local MYTHIC_CAST_CHEST = castGear["MYTHIC"]["CHEST"]
local MYTHIC_CAST_LEGS = castGear["MYTHIC"]["LEGGINGS"]
local MYTHIC_CAST_HANDS = castGear["MYTHIC"]["GAUNTLETS"]

local RAID_FINDER_ALL_GEAR = {}
local NORMAL_ALL_GEAR = {}
local HEROIC_ALL_GEAR = {}
local MYTHIC_ALL_GEAR = {}

-- Populate ALL_GEAR tables by merging from all groups
mergeTable(RAID_FINDER_ALL_GEAR, wovenGear["RAID_FINDER"]["ALL"])
mergeTable(RAID_FINDER_ALL_GEAR, forgedGear["RAID_FINDER"]["ALL"])
mergeTable(RAID_FINDER_ALL_GEAR, curedGear["RAID_FINDER"]["ALL"])
mergeTable(RAID_FINDER_ALL_GEAR, castGear["RAID_FINDER"]["ALL"])

mergeTable(NORMAL_ALL_GEAR, wovenGear["NORMAL"]["ALL"])
mergeTable(NORMAL_ALL_GEAR, forgedGear["NORMAL"]["ALL"])
mergeTable(NORMAL_ALL_GEAR, curedGear["NORMAL"]["ALL"])
mergeTable(NORMAL_ALL_GEAR, castGear["NORMAL"]["ALL"])

mergeTable(HEROIC_ALL_GEAR, wovenGear["HEROIC"]["ALL"])
mergeTable(HEROIC_ALL_GEAR, forgedGear["HEROIC"]["ALL"])
mergeTable(HEROIC_ALL_GEAR, curedGear["HEROIC"]["ALL"])
mergeTable(HEROIC_ALL_GEAR, castGear["HEROIC"]["ALL"])

mergeTable(MYTHIC_ALL_GEAR, wovenGear["MYTHIC"]["ALL"])
mergeTable(MYTHIC_ALL_GEAR, forgedGear["MYTHIC"]["ALL"])
mergeTable(MYTHIC_ALL_GEAR, curedGear["MYTHIC"]["ALL"])
mergeTable(MYTHIC_ALL_GEAR, castGear["MYTHIC"]["ALL"])

ns.Raids.MS1 = {

  -- Curio token (wildcard)
  [249367] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = RAID_FINDER_ALL_GEAR,
      [Enum.ItemCreationContext.RaidNormal] = NORMAL_ALL_GEAR,
      [Enum.ItemCreationContext.RaidHeroic] = HEROIC_ALL_GEAR,
      [Enum.ItemCreationContext.RaidMythic] = MYTHIC_ALL_GEAR,
    },
  },

  --#region Woven (Priest, Mage, Warlock)
  --#region Helm
  [249355] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = RAID_FINDER_WOVEN_HEAD,
      [Enum.ItemCreationContext.RaidNormal] = NORMAL_WOVEN_HEAD,
      [Enum.ItemCreationContext.RaidHeroic] = HEROIC_WOVEN_HEAD,
      [Enum.ItemCreationContext.RaidMythic] = MYTHIC_WOVEN_HEAD,
    },
  },
  --#endregion
  --#region Shoulders
  [249363] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = RAID_FINDER_WOVEN_SHOULDERS,
      [Enum.ItemCreationContext.RaidNormal] = NORMAL_WOVEN_SHOULDERS,
      [Enum.ItemCreationContext.RaidHeroic] = HEROIC_WOVEN_SHOULDERS,
      [Enum.ItemCreationContext.RaidMythic] = MYTHIC_WOVEN_SHOULDERS,
    },
  },
  --#endregion
  --#region Chest
  [249347] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = RAID_FINDER_WOVEN_CHEST,
      [Enum.ItemCreationContext.RaidNormal] = NORMAL_WOVEN_CHEST,
      [Enum.ItemCreationContext.RaidHeroic] = HEROIC_WOVEN_CHEST,
      [Enum.ItemCreationContext.RaidMythic] = MYTHIC_WOVEN_CHEST,
    },
  },
  --#endregion
  --#region Leggings
  [249359] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = RAID_FINDER_WOVEN_LEGS,
      [Enum.ItemCreationContext.RaidNormal] = NORMAL_WOVEN_LEGS,
      [Enum.ItemCreationContext.RaidHeroic] = HEROIC_WOVEN_LEGS,
      [Enum.ItemCreationContext.RaidMythic] = MYTHIC_WOVEN_LEGS,
    },
  },
  --#endregion
  --#region Gauntlets
  [249351] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = RAID_FINDER_WOVEN_HANDS,
      [Enum.ItemCreationContext.RaidNormal] = NORMAL_WOVEN_HANDS,
      [Enum.ItemCreationContext.RaidHeroic] = HEROIC_WOVEN_HANDS,
      [Enum.ItemCreationContext.RaidMythic] = MYTHIC_WOVEN_HANDS,
    },
  },
  --#endregion
  --#endregion

  --#region Forged (Warrior, Paladin, Death Knight)
  --#region Helm
  [249358] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = RAID_FINDER_FORGED_HEAD,
      [Enum.ItemCreationContext.RaidNormal] = NORMAL_FORGED_HEAD,
      [Enum.ItemCreationContext.RaidHeroic] = HEROIC_FORGED_HEAD,
      [Enum.ItemCreationContext.RaidMythic] = MYTHIC_FORGED_HEAD,
    },
  },
  --#endregion
  --#region Shoulders
  [249366] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = RAID_FINDER_FORGED_SHOULDERS,
      [Enum.ItemCreationContext.RaidNormal] = NORMAL_FORGED_SHOULDERS,
      [Enum.ItemCreationContext.RaidHeroic] = HEROIC_FORGED_SHOULDERS,
      [Enum.ItemCreationContext.RaidMythic] = MYTHIC_FORGED_SHOULDERS,
    },
  },
  --#endregion
  --#region Chest
  [249350] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = RAID_FINDER_FORGED_CHEST,
      [Enum.ItemCreationContext.RaidNormal] = NORMAL_FORGED_CHEST,
      [Enum.ItemCreationContext.RaidHeroic] = HEROIC_FORGED_CHEST,
      [Enum.ItemCreationContext.RaidMythic] = MYTHIC_FORGED_CHEST,
    },
  },
  --#endregion
  --#region Leggings
  [249362] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = RAID_FINDER_FORGED_LEGS,
      [Enum.ItemCreationContext.RaidNormal] = NORMAL_FORGED_LEGS,
      [Enum.ItemCreationContext.RaidHeroic] = HEROIC_FORGED_LEGS,
      [Enum.ItemCreationContext.RaidMythic] = MYTHIC_FORGED_LEGS,
    },
  },
  --#endregion
  --#region Gauntlets
  [249354] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = RAID_FINDER_FORGED_HANDS,
      [Enum.ItemCreationContext.RaidNormal] = NORMAL_FORGED_HANDS,
      [Enum.ItemCreationContext.RaidHeroic] = HEROIC_FORGED_HANDS,
      [Enum.ItemCreationContext.RaidMythic] = MYTHIC_FORGED_HANDS,
    },
  },
  --#endregion
  --#endregion

  --#region Cured (Rogue, Monk, Druid, Demon Hunter)
  --#region Helm
  [249356] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = RAID_FINDER_CURED_HEAD,
      [Enum.ItemCreationContext.RaidNormal] = NORMAL_CURED_HEAD,
      [Enum.ItemCreationContext.RaidHeroic] = HEROIC_CURED_HEAD,
      [Enum.ItemCreationContext.RaidMythic] = MYTHIC_CURED_HEAD,
    },
  },
  --#endregion
  --#region Shoulders
  [249364] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = RAID_FINDER_CURED_SHOULDERS,
      [Enum.ItemCreationContext.RaidNormal] = NORMAL_CURED_SHOULDERS,
      [Enum.ItemCreationContext.RaidHeroic] = HEROIC_CURED_SHOULDERS,
      [Enum.ItemCreationContext.RaidMythic] = MYTHIC_CURED_SHOULDERS,
    },
  },
  --#endregion
  --#region Chest
  [249348] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = RAID_FINDER_CURED_CHEST,
      [Enum.ItemCreationContext.RaidNormal] = NORMAL_CURED_CHEST,
      [Enum.ItemCreationContext.RaidHeroic] = HEROIC_CURED_CHEST,
      [Enum.ItemCreationContext.RaidMythic] = MYTHIC_CURED_CHEST,
    },
  },
  --#endregion
  --#region Leggings
  [249360] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = RAID_FINDER_CURED_LEGS,
      [Enum.ItemCreationContext.RaidNormal] = NORMAL_CURED_LEGS,
      [Enum.ItemCreationContext.RaidHeroic] = HEROIC_CURED_LEGS,
      [Enum.ItemCreationContext.RaidMythic] = MYTHIC_CURED_LEGS,
    },
  },
  --#endregion
  --#region Gauntlets
  [249352] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = RAID_FINDER_CURED_HANDS,
      [Enum.ItemCreationContext.RaidNormal] = NORMAL_CURED_HANDS,
      [Enum.ItemCreationContext.RaidHeroic] = HEROIC_CURED_HANDS,
      [Enum.ItemCreationContext.RaidMythic] = MYTHIC_CURED_HANDS,
    },
  },
  --#endregion
  --#endregion

  --#region Cast (Hunter, Shaman, Evoker)
  --#region Helm
  [249357] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = RAID_FINDER_CAST_HEAD,
      [Enum.ItemCreationContext.RaidNormal] = NORMAL_CAST_HEAD,
      [Enum.ItemCreationContext.RaidHeroic] = HEROIC_CAST_HEAD,
      [Enum.ItemCreationContext.RaidMythic] = MYTHIC_CAST_HEAD,
    },
  },
  --#endregion
  --#region Shoulders
  [249365] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = RAID_FINDER_CAST_SHOULDERS,
      [Enum.ItemCreationContext.RaidNormal] = NORMAL_CAST_SHOULDERS,
      [Enum.ItemCreationContext.RaidHeroic] = HEROIC_CAST_SHOULDERS,
      [Enum.ItemCreationContext.RaidMythic] = MYTHIC_CAST_SHOULDERS,
    },
  },
  --#endregion
  --#region Chest
  [249349] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = RAID_FINDER_CAST_CHEST,
      [Enum.ItemCreationContext.RaidNormal] = NORMAL_CAST_CHEST,
      [Enum.ItemCreationContext.RaidHeroic] = HEROIC_CAST_CHEST,
      [Enum.ItemCreationContext.RaidMythic] = MYTHIC_CAST_CHEST,
    },
  },
  --#endregion
  --#region Leggings
  [249361] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = RAID_FINDER_CAST_LEGS,
      [Enum.ItemCreationContext.RaidNormal] = NORMAL_CAST_LEGS,
      [Enum.ItemCreationContext.RaidHeroic] = HEROIC_CAST_LEGS,
      [Enum.ItemCreationContext.RaidMythic] = MYTHIC_CAST_LEGS,
    },
  },
  --#endregion
  --#region Gauntlets
  [249353] = {
    Difficulties = {
      [Enum.ItemCreationContext.RaidFinder] = RAID_FINDER_CAST_HANDS,
      [Enum.ItemCreationContext.RaidNormal] = NORMAL_CAST_HANDS,
      [Enum.ItemCreationContext.RaidHeroic] = HEROIC_CAST_HANDS,
      [Enum.ItemCreationContext.RaidMythic] = MYTHIC_CAST_HANDS,
    },
  },
  --#endregion
  --#endregion
}

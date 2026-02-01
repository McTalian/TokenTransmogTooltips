local addonName, ns = ...

---@type MS1GearLookup
local gear = ns._Gear.MS1

---@type MS1Rogue
local rogue = gear["ROGUE"]
---@type MS1Monk
local monk = gear["MONK"]
---@type MS1Druid
local druid = gear["DRUID"]
---@type MS1Demonhunter
local demonhunter = gear["DEMONHUNTER"]

---@class MS1Cured
ns._Gear.MS1["_CURED"] = {
  ["RAID_FINDER"] = {
    ["HELM"] = {
      ["ROGUE"] = rogue["RAID_FINDER"]["HELM"],
      ["MONK"] = monk["RAID_FINDER"]["HELM"],
      ["DRUID"] = druid["RAID_FINDER"]["HELM"],
      ["DEMONHUNTER"] = demonhunter["RAID_FINDER"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["ROGUE"] = rogue["RAID_FINDER"]["SHOULDERS"],
      ["MONK"] = monk["RAID_FINDER"]["SHOULDERS"],
      ["DRUID"] = druid["RAID_FINDER"]["SHOULDERS"],
      ["DEMONHUNTER"] = demonhunter["RAID_FINDER"]["SHOULDERS"],
    },
    ["CHEST"] = {
      ["ROGUE"] = rogue["RAID_FINDER"]["CHEST"],
      ["MONK"] = monk["RAID_FINDER"]["CHEST"],
      ["DRUID"] = druid["RAID_FINDER"]["CHEST"],
      ["DEMONHUNTER"] = demonhunter["RAID_FINDER"]["CHEST"],
    },
    ["GAUNTLETS"] = {
      ["ROGUE"] = rogue["RAID_FINDER"]["GAUNTLETS"],
      ["MONK"] = monk["RAID_FINDER"]["GAUNTLETS"],
      ["DRUID"] = druid["RAID_FINDER"]["GAUNTLETS"],
      ["DEMONHUNTER"] = demonhunter["RAID_FINDER"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["ROGUE"] = rogue["RAID_FINDER"]["LEGGINGS"],
      ["MONK"] = monk["RAID_FINDER"]["LEGGINGS"],
      ["DRUID"] = druid["RAID_FINDER"]["LEGGINGS"],
      ["DEMONHUNTER"] = demonhunter["RAID_FINDER"]["LEGGINGS"],
    },
    ["ALL"] = {
      ["ROGUE"] = rogue["RAID_FINDER"]["ALL"],
      ["MONK"] = monk["RAID_FINDER"]["ALL"],
      ["DRUID"] = druid["RAID_FINDER"]["ALL"],
      ["DEMONHUNTER"] = demonhunter["RAID_FINDER"]["ALL"],
    },
  },
  ["NORMAL"] = {
    ["HELM"] = {
      ["ROGUE"] = rogue["NORMAL"]["HELM"],
      ["MONK"] = monk["NORMAL"]["HELM"],
      ["DRUID"] = druid["NORMAL"]["HELM"],
      ["DEMONHUNTER"] = demonhunter["NORMAL"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["ROGUE"] = rogue["NORMAL"]["SHOULDERS"],
      ["MONK"] = monk["NORMAL"]["SHOULDERS"],
      ["DRUID"] = druid["NORMAL"]["SHOULDERS"],
      ["DEMONHUNTER"] = demonhunter["NORMAL"]["SHOULDERS"],
    },
    ["CHEST"] = {
      ["ROGUE"] = rogue["NORMAL"]["CHEST"],
      ["MONK"] = monk["NORMAL"]["CHEST"],
      ["DRUID"] = druid["NORMAL"]["CHEST"],
      ["DEMONHUNTER"] = demonhunter["NORMAL"]["CHEST"],
    },
    ["GAUNTLETS"] = {
      ["ROGUE"] = rogue["NORMAL"]["GAUNTLETS"],
      ["MONK"] = monk["NORMAL"]["GAUNTLETS"],
      ["DRUID"] = druid["NORMAL"]["GAUNTLETS"],
      ["DEMONHUNTER"] = demonhunter["NORMAL"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["ROGUE"] = rogue["NORMAL"]["LEGGINGS"],
      ["MONK"] = monk["NORMAL"]["LEGGINGS"],
      ["DRUID"] = druid["NORMAL"]["LEGGINGS"],
      ["DEMONHUNTER"] = demonhunter["NORMAL"]["LEGGINGS"],
    },
    ["ALL"] = {
      ["ROGUE"] = rogue["NORMAL"]["ALL"],
      ["MONK"] = monk["NORMAL"]["ALL"],
      ["DRUID"] = druid["NORMAL"]["ALL"],
      ["DEMONHUNTER"] = demonhunter["NORMAL"]["ALL"],
    },
  },
  ["HEROIC"] = {
    ["HELM"] = {
      ["ROGUE"] = rogue["HEROIC"]["HELM"],
      ["MONK"] = monk["HEROIC"]["HELM"],
      ["DRUID"] = druid["HEROIC"]["HELM"],
      ["DEMONHUNTER"] = demonhunter["HEROIC"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["ROGUE"] = rogue["HEROIC"]["SHOULDERS"],
      ["MONK"] = monk["HEROIC"]["SHOULDERS"],
      ["DRUID"] = druid["HEROIC"]["SHOULDERS"],
      ["DEMONHUNTER"] = demonhunter["HEROIC"]["SHOULDERS"],
    },
    ["CHEST"] = {
      ["ROGUE"] = rogue["HEROIC"]["CHEST"],
      ["MONK"] = monk["HEROIC"]["CHEST"],
      ["DRUID"] = druid["HEROIC"]["CHEST"],
      ["DEMONHUNTER"] = demonhunter["HEROIC"]["CHEST"],
    },
    ["GAUNTLETS"] = {
      ["ROGUE"] = rogue["HEROIC"]["GAUNTLETS"],
      ["MONK"] = monk["HEROIC"]["GAUNTLETS"],
      ["DRUID"] = druid["HEROIC"]["GAUNTLETS"],
      ["DEMONHUNTER"] = demonhunter["HEROIC"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["ROGUE"] = rogue["HEROIC"]["LEGGINGS"],
      ["MONK"] = monk["HEROIC"]["LEGGINGS"],
      ["DRUID"] = druid["HEROIC"]["LEGGINGS"],
      ["DEMONHUNTER"] = demonhunter["HEROIC"]["LEGGINGS"],
    },
    ["ALL"] = {
      ["ROGUE"] = rogue["HEROIC"]["ALL"],
      ["MONK"] = monk["HEROIC"]["ALL"],
      ["DRUID"] = druid["HEROIC"]["ALL"],
      ["DEMONHUNTER"] = demonhunter["HEROIC"]["ALL"],
    },
  },
  ["MYTHIC"] = {
    ["HELM"] = {
      ["ROGUE"] = rogue["MYTHIC"]["HELM"],
      ["MONK"] = monk["MYTHIC"]["HELM"],
      ["DRUID"] = druid["MYTHIC"]["HELM"],
      ["DEMONHUNTER"] = demonhunter["MYTHIC"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["ROGUE"] = rogue["MYTHIC"]["SHOULDERS"],
      ["MONK"] = monk["MYTHIC"]["SHOULDERS"],
      ["DRUID"] = druid["MYTHIC"]["SHOULDERS"],
      ["DEMONHUNTER"] = demonhunter["MYTHIC"]["SHOULDERS"],
    },
    ["CHEST"] = {
      ["ROGUE"] = rogue["MYTHIC"]["CHEST"],
      ["MONK"] = monk["MYTHIC"]["CHEST"],
      ["DRUID"] = druid["MYTHIC"]["CHEST"],
      ["DEMONHUNTER"] = demonhunter["MYTHIC"]["CHEST"],
    },
    ["GAUNTLETS"] = {
      ["ROGUE"] = rogue["MYTHIC"]["GAUNTLETS"],
      ["MONK"] = monk["MYTHIC"]["GAUNTLETS"],
      ["DRUID"] = druid["MYTHIC"]["GAUNTLETS"],
      ["DEMONHUNTER"] = demonhunter["MYTHIC"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["ROGUE"] = rogue["MYTHIC"]["LEGGINGS"],
      ["MONK"] = monk["MYTHIC"]["LEGGINGS"],
      ["DRUID"] = druid["MYTHIC"]["LEGGINGS"],
      ["DEMONHUNTER"] = demonhunter["MYTHIC"]["LEGGINGS"],
    },
    ["ALL"] = {
      ["ROGUE"] = rogue["MYTHIC"]["ALL"],
      ["MONK"] = monk["MYTHIC"]["ALL"],
      ["DRUID"] = druid["MYTHIC"]["ALL"],
      ["DEMONHUNTER"] = demonhunter["MYTHIC"]["ALL"],
    },
  },
}

local addonName, ns = ...

---@type MS1GearLookup
local gear = ns._Gear.MS1

---@type MS1Hunter
local hunter = gear["HUNTER"]
---@type MS1Shaman
local shaman = gear["SHAMAN"]
---@type MS1Evoker
local evoker = gear["EVOKER"]

---@class MS1Cast
ns._Gear.MS1["_CAST"] = {
  ["RAID_FINDER"] = {
    ["HELM"] = {
      ["HUNTER"] = hunter["RAID_FINDER"]["HELM"],
      ["SHAMAN"] = shaman["RAID_FINDER"]["HELM"],
      ["EVOKER"] = evoker["RAID_FINDER"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["HUNTER"] = hunter["RAID_FINDER"]["SHOULDERS"],
      ["SHAMAN"] = shaman["RAID_FINDER"]["SHOULDERS"],
      ["EVOKER"] = evoker["RAID_FINDER"]["SHOULDERS"],
    },
    ["CHEST"] = {
      ["HUNTER"] = hunter["RAID_FINDER"]["CHEST"],
      ["SHAMAN"] = shaman["RAID_FINDER"]["CHEST"],
      ["EVOKER"] = evoker["RAID_FINDER"]["CHEST"],
    },
    ["GAUNTLETS"] = {
      ["HUNTER"] = hunter["RAID_FINDER"]["GAUNTLETS"],
      ["SHAMAN"] = shaman["RAID_FINDER"]["GAUNTLETS"],
      ["EVOKER"] = evoker["RAID_FINDER"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["HUNTER"] = hunter["RAID_FINDER"]["LEGGINGS"],
      ["SHAMAN"] = shaman["RAID_FINDER"]["LEGGINGS"],
      ["EVOKER"] = evoker["RAID_FINDER"]["LEGGINGS"],
    },
    ["ALL"] = {
      ["HUNTER"] = hunter["RAID_FINDER"]["ALL"],
      ["SHAMAN"] = shaman["RAID_FINDER"]["ALL"],
      ["EVOKER"] = evoker["RAID_FINDER"]["ALL"],
    },
  },
  ["NORMAL"] = {
    ["HELM"] = {
      ["HUNTER"] = hunter["NORMAL"]["HELM"],
      ["SHAMAN"] = shaman["NORMAL"]["HELM"],
      ["EVOKER"] = evoker["NORMAL"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["HUNTER"] = hunter["NORMAL"]["SHOULDERS"],
      ["SHAMAN"] = shaman["NORMAL"]["SHOULDERS"],
      ["EVOKER"] = evoker["NORMAL"]["SHOULDERS"],
    },
    ["CHEST"] = {
      ["HUNTER"] = hunter["NORMAL"]["CHEST"],
      ["SHAMAN"] = shaman["NORMAL"]["CHEST"],
      ["EVOKER"] = evoker["NORMAL"]["CHEST"],
    },
    ["GAUNTLETS"] = {
      ["HUNTER"] = hunter["NORMAL"]["GAUNTLETS"],
      ["SHAMAN"] = shaman["NORMAL"]["GAUNTLETS"],
      ["EVOKER"] = evoker["NORMAL"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["HUNTER"] = hunter["NORMAL"]["LEGGINGS"],
      ["SHAMAN"] = shaman["NORMAL"]["LEGGINGS"],
      ["EVOKER"] = evoker["NORMAL"]["LEGGINGS"],
    },
    ["ALL"] = {
      ["HUNTER"] = hunter["NORMAL"]["ALL"],
      ["SHAMAN"] = shaman["NORMAL"]["ALL"],
      ["EVOKER"] = evoker["NORMAL"]["ALL"],
    },
  },
  ["HEROIC"] = {
    ["HELM"] = {
      ["HUNTER"] = hunter["HEROIC"]["HELM"],
      ["SHAMAN"] = shaman["HEROIC"]["HELM"],
      ["EVOKER"] = evoker["HEROIC"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["HUNTER"] = hunter["HEROIC"]["SHOULDERS"],
      ["SHAMAN"] = shaman["HEROIC"]["SHOULDERS"],
      ["EVOKER"] = evoker["HEROIC"]["SHOULDERS"],
    },
    ["CHEST"] = {
      ["HUNTER"] = hunter["HEROIC"]["CHEST"],
      ["SHAMAN"] = shaman["HEROIC"]["CHEST"],
      ["EVOKER"] = evoker["HEROIC"]["CHEST"],
    },
    ["GAUNTLETS"] = {
      ["HUNTER"] = hunter["HEROIC"]["GAUNTLETS"],
      ["SHAMAN"] = shaman["HEROIC"]["GAUNTLETS"],
      ["EVOKER"] = evoker["HEROIC"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["HUNTER"] = hunter["HEROIC"]["LEGGINGS"],
      ["SHAMAN"] = shaman["HEROIC"]["LEGGINGS"],
      ["EVOKER"] = evoker["HEROIC"]["LEGGINGS"],
    },
    ["ALL"] = {
      ["HUNTER"] = hunter["HEROIC"]["ALL"],
      ["SHAMAN"] = shaman["HEROIC"]["ALL"],
      ["EVOKER"] = evoker["HEROIC"]["ALL"],
    },
  },
  ["MYTHIC"] = {
    ["HELM"] = {
      ["HUNTER"] = hunter["MYTHIC"]["HELM"],
      ["SHAMAN"] = shaman["MYTHIC"]["HELM"],
      ["EVOKER"] = evoker["MYTHIC"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["HUNTER"] = hunter["MYTHIC"]["SHOULDERS"],
      ["SHAMAN"] = shaman["MYTHIC"]["SHOULDERS"],
      ["EVOKER"] = evoker["MYTHIC"]["SHOULDERS"],
    },
    ["CHEST"] = {
      ["HUNTER"] = hunter["MYTHIC"]["CHEST"],
      ["SHAMAN"] = shaman["MYTHIC"]["CHEST"],
      ["EVOKER"] = evoker["MYTHIC"]["CHEST"],
    },
    ["GAUNTLETS"] = {
      ["HUNTER"] = hunter["MYTHIC"]["GAUNTLETS"],
      ["SHAMAN"] = shaman["MYTHIC"]["GAUNTLETS"],
      ["EVOKER"] = evoker["MYTHIC"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["HUNTER"] = hunter["MYTHIC"]["LEGGINGS"],
      ["SHAMAN"] = shaman["MYTHIC"]["LEGGINGS"],
      ["EVOKER"] = evoker["MYTHIC"]["LEGGINGS"],
    },
    ["ALL"] = {
      ["HUNTER"] = hunter["MYTHIC"]["ALL"],
      ["SHAMAN"] = shaman["MYTHIC"]["ALL"],
      ["EVOKER"] = evoker["MYTHIC"]["ALL"],
    },
  },
}

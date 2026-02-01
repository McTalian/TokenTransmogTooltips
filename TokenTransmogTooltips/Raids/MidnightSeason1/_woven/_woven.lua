local addonName, ns = ...

---@type MS1GearLookup
local gear = ns._Gear.MS1

---@type MS1Priest
local priest = gear["PRIEST"]
---@type MS1Mage
local mage = gear["MAGE"]
---@type MS1Warlock
local warlock = gear["WARLOCK"]

---@class MS1Woven
ns._Gear.MS1["_WOVEN"] = {
  ["RAID_FINDER"] = {
    ["HELM"] = {
      ["PRIEST"] = priest["RAID_FINDER"]["HELM"],
      ["MAGE"] = mage["RAID_FINDER"]["HELM"],
      ["WARLOCK"] = warlock["RAID_FINDER"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["PRIEST"] = priest["RAID_FINDER"]["SHOULDERS"],
      ["MAGE"] = mage["RAID_FINDER"]["SHOULDERS"],
      ["WARLOCK"] = warlock["RAID_FINDER"]["SHOULDERS"],
    },
    ["CHEST"] = {
      ["PRIEST"] = priest["RAID_FINDER"]["CHEST"],
      ["MAGE"] = mage["RAID_FINDER"]["CHEST"],
      ["WARLOCK"] = warlock["RAID_FINDER"]["CHEST"],
    },
    ["GAUNTLETS"] = {
      ["PRIEST"] = priest["RAID_FINDER"]["GAUNTLETS"],
      ["MAGE"] = mage["RAID_FINDER"]["GAUNTLETS"],
      ["WARLOCK"] = warlock["RAID_FINDER"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["PRIEST"] = priest["RAID_FINDER"]["LEGGINGS"],
      ["MAGE"] = mage["RAID_FINDER"]["LEGGINGS"],
      ["WARLOCK"] = warlock["RAID_FINDER"]["LEGGINGS"],
    },
    ["ALL"] = {
      ["PRIEST"] = priest["RAID_FINDER"]["ALL"],
      ["MAGE"] = mage["RAID_FINDER"]["ALL"],
      ["WARLOCK"] = warlock["RAID_FINDER"]["ALL"],
    },
  },
  ["NORMAL"] = {
    ["HELM"] = {
      ["PRIEST"] = priest["NORMAL"]["HELM"],
      ["MAGE"] = mage["NORMAL"]["HELM"],
      ["WARLOCK"] = warlock["NORMAL"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["PRIEST"] = priest["NORMAL"]["SHOULDERS"],
      ["MAGE"] = mage["NORMAL"]["SHOULDERS"],
      ["WARLOCK"] = warlock["NORMAL"]["SHOULDERS"],
    },
    ["CHEST"] = {
      ["PRIEST"] = priest["NORMAL"]["CHEST"],
      ["MAGE"] = mage["NORMAL"]["CHEST"],
      ["WARLOCK"] = warlock["NORMAL"]["CHEST"],
    },
    ["GAUNTLETS"] = {
      ["PRIEST"] = priest["NORMAL"]["GAUNTLETS"],
      ["MAGE"] = mage["NORMAL"]["GAUNTLETS"],
      ["WARLOCK"] = warlock["NORMAL"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["PRIEST"] = priest["NORMAL"]["LEGGINGS"],
      ["MAGE"] = mage["NORMAL"]["LEGGINGS"],
      ["WARLOCK"] = warlock["NORMAL"]["LEGGINGS"],
    },
    ["ALL"] = {
      ["PRIEST"] = priest["NORMAL"]["ALL"],
      ["MAGE"] = mage["NORMAL"]["ALL"],
      ["WARLOCK"] = warlock["NORMAL"]["ALL"],
    },
  },
  ["HEROIC"] = {
    ["HELM"] = {
      ["PRIEST"] = priest["HEROIC"]["HELM"],
      ["MAGE"] = mage["HEROIC"]["HELM"],
      ["WARLOCK"] = warlock["HEROIC"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["PRIEST"] = priest["HEROIC"]["SHOULDERS"],
      ["MAGE"] = mage["HEROIC"]["SHOULDERS"],
      ["WARLOCK"] = warlock["HEROIC"]["SHOULDERS"],
    },
    ["CHEST"] = {
      ["PRIEST"] = priest["HEROIC"]["CHEST"],
      ["MAGE"] = mage["HEROIC"]["CHEST"],
      ["WARLOCK"] = warlock["HEROIC"]["CHEST"],
    },
    ["GAUNTLETS"] = {
      ["PRIEST"] = priest["HEROIC"]["GAUNTLETS"],
      ["MAGE"] = mage["HEROIC"]["GAUNTLETS"],
      ["WARLOCK"] = warlock["HEROIC"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["PRIEST"] = priest["HEROIC"]["LEGGINGS"],
      ["MAGE"] = mage["HEROIC"]["LEGGINGS"],
      ["WARLOCK"] = warlock["HEROIC"]["LEGGINGS"],
    },
    ["ALL"] = {
      ["PRIEST"] = priest["HEROIC"]["ALL"],
      ["MAGE"] = mage["HEROIC"]["ALL"],
      ["WARLOCK"] = warlock["HEROIC"]["ALL"],
    },
  },
  ["MYTHIC"] = {
    ["HELM"] = {
      ["PRIEST"] = priest["MYTHIC"]["HELM"],
      ["MAGE"] = mage["MYTHIC"]["HELM"],
      ["WARLOCK"] = warlock["MYTHIC"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["PRIEST"] = priest["MYTHIC"]["SHOULDERS"],
      ["MAGE"] = mage["MYTHIC"]["SHOULDERS"],
      ["WARLOCK"] = warlock["MYTHIC"]["SHOULDERS"],
    },
    ["CHEST"] = {
      ["PRIEST"] = priest["MYTHIC"]["CHEST"],
      ["MAGE"] = mage["MYTHIC"]["CHEST"],
      ["WARLOCK"] = warlock["MYTHIC"]["CHEST"],
    },
    ["GAUNTLETS"] = {
      ["PRIEST"] = priest["MYTHIC"]["GAUNTLETS"],
      ["MAGE"] = mage["MYTHIC"]["GAUNTLETS"],
      ["WARLOCK"] = warlock["MYTHIC"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["PRIEST"] = priest["MYTHIC"]["LEGGINGS"],
      ["MAGE"] = mage["MYTHIC"]["LEGGINGS"],
      ["WARLOCK"] = warlock["MYTHIC"]["LEGGINGS"],
    },
    ["ALL"] = {
      ["PRIEST"] = priest["MYTHIC"]["ALL"],
      ["MAGE"] = mage["MYTHIC"]["ALL"],
      ["WARLOCK"] = warlock["MYTHIC"]["ALL"],
    },
  },
}

local addonName, ns = ...

---@type MS1GearLookup
local gear = ns._Gear.MS1

---@type MS1Warrior
local warrior = gear["WARRIOR"]
---@type MS1Paladin
local paladin = gear["PALADIN"]
---@type MS1Deathknight
local deathknight = gear["DEATHKNIGHT"]

---@class MS1Forged
ns._Gear.MS1["_FORGED"] = {
  ["RAID_FINDER"] = {
    ["HELM"] = {
      ["WARRIOR"] = warrior["RAID_FINDER"]["HELM"],
      ["PALADIN"] = paladin["RAID_FINDER"]["HELM"],
      ["DEATHKNIGHT"] = deathknight["RAID_FINDER"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["WARRIOR"] = warrior["RAID_FINDER"]["SHOULDERS"],
      ["PALADIN"] = paladin["RAID_FINDER"]["SHOULDERS"],
      ["DEATHKNIGHT"] = deathknight["RAID_FINDER"]["SHOULDERS"],
    },
    ["CHEST"] = {
      ["WARRIOR"] = warrior["RAID_FINDER"]["CHEST"],
      ["PALADIN"] = paladin["RAID_FINDER"]["CHEST"],
      ["DEATHKNIGHT"] = deathknight["RAID_FINDER"]["CHEST"],
    },
    ["GAUNTLETS"] = {
      ["WARRIOR"] = warrior["RAID_FINDER"]["GAUNTLETS"],
      ["PALADIN"] = paladin["RAID_FINDER"]["GAUNTLETS"],
      ["DEATHKNIGHT"] = deathknight["RAID_FINDER"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["WARRIOR"] = warrior["RAID_FINDER"]["LEGGINGS"],
      ["PALADIN"] = paladin["RAID_FINDER"]["LEGGINGS"],
      ["DEATHKNIGHT"] = deathknight["RAID_FINDER"]["LEGGINGS"],
    },
    ["ALL"] = {
      ["WARRIOR"] = warrior["RAID_FINDER"]["ALL"],
      ["PALADIN"] = paladin["RAID_FINDER"]["ALL"],
      ["DEATHKNIGHT"] = deathknight["RAID_FINDER"]["ALL"],
    },
  },
  ["NORMAL"] = {
    ["HELM"] = {
      ["WARRIOR"] = warrior["NORMAL"]["HELM"],
      ["PALADIN"] = paladin["NORMAL"]["HELM"],
      ["DEATHKNIGHT"] = deathknight["NORMAL"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["WARRIOR"] = warrior["NORMAL"]["SHOULDERS"],
      ["PALADIN"] = paladin["NORMAL"]["SHOULDERS"],
      ["DEATHKNIGHT"] = deathknight["NORMAL"]["SHOULDERS"],
    },
    ["CHEST"] = {
      ["WARRIOR"] = warrior["NORMAL"]["CHEST"],
      ["PALADIN"] = paladin["NORMAL"]["CHEST"],
      ["DEATHKNIGHT"] = deathknight["NORMAL"]["CHEST"],
    },
    ["GAUNTLETS"] = {
      ["WARRIOR"] = warrior["NORMAL"]["GAUNTLETS"],
      ["PALADIN"] = paladin["NORMAL"]["GAUNTLETS"],
      ["DEATHKNIGHT"] = deathknight["NORMAL"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["WARRIOR"] = warrior["NORMAL"]["LEGGINGS"],
      ["PALADIN"] = paladin["NORMAL"]["LEGGINGS"],
      ["DEATHKNIGHT"] = deathknight["NORMAL"]["LEGGINGS"],
    },
    ["ALL"] = {
      ["WARRIOR"] = warrior["NORMAL"]["ALL"],
      ["PALADIN"] = paladin["NORMAL"]["ALL"],
      ["DEATHKNIGHT"] = deathknight["NORMAL"]["ALL"],
    },
  },
  ["HEROIC"] = {
    ["HELM"] = {
      ["WARRIOR"] = warrior["HEROIC"]["HELM"],
      ["PALADIN"] = paladin["HEROIC"]["HELM"],
      ["DEATHKNIGHT"] = deathknight["HEROIC"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["WARRIOR"] = warrior["HEROIC"]["SHOULDERS"],
      ["PALADIN"] = paladin["HEROIC"]["SHOULDERS"],
      ["DEATHKNIGHT"] = deathknight["HEROIC"]["SHOULDERS"],
    },
    ["CHEST"] = {
      ["WARRIOR"] = warrior["HEROIC"]["CHEST"],
      ["PALADIN"] = paladin["HEROIC"]["CHEST"],
      ["DEATHKNIGHT"] = deathknight["HEROIC"]["CHEST"],
    },
    ["GAUNTLETS"] = {
      ["WARRIOR"] = warrior["HEROIC"]["GAUNTLETS"],
      ["PALADIN"] = paladin["HEROIC"]["GAUNTLETS"],
      ["DEATHKNIGHT"] = deathknight["HEROIC"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["WARRIOR"] = warrior["HEROIC"]["LEGGINGS"],
      ["PALADIN"] = paladin["HEROIC"]["LEGGINGS"],
      ["DEATHKNIGHT"] = deathknight["HEROIC"]["LEGGINGS"],
    },
    ["ALL"] = {
      ["WARRIOR"] = warrior["HEROIC"]["ALL"],
      ["PALADIN"] = paladin["HEROIC"]["ALL"],
      ["DEATHKNIGHT"] = deathknight["HEROIC"]["ALL"],
    },
  },
  ["MYTHIC"] = {
    ["HELM"] = {
      ["WARRIOR"] = warrior["MYTHIC"]["HELM"],
      ["PALADIN"] = paladin["MYTHIC"]["HELM"],
      ["DEATHKNIGHT"] = deathknight["MYTHIC"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["WARRIOR"] = warrior["MYTHIC"]["SHOULDERS"],
      ["PALADIN"] = paladin["MYTHIC"]["SHOULDERS"],
      ["DEATHKNIGHT"] = deathknight["MYTHIC"]["SHOULDERS"],
    },
    ["CHEST"] = {
      ["WARRIOR"] = warrior["MYTHIC"]["CHEST"],
      ["PALADIN"] = paladin["MYTHIC"]["CHEST"],
      ["DEATHKNIGHT"] = deathknight["MYTHIC"]["CHEST"],
    },
    ["GAUNTLETS"] = {
      ["WARRIOR"] = warrior["MYTHIC"]["GAUNTLETS"],
      ["PALADIN"] = paladin["MYTHIC"]["GAUNTLETS"],
      ["DEATHKNIGHT"] = deathknight["MYTHIC"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["WARRIOR"] = warrior["MYTHIC"]["LEGGINGS"],
      ["PALADIN"] = paladin["MYTHIC"]["LEGGINGS"],
      ["DEATHKNIGHT"] = deathknight["MYTHIC"]["LEGGINGS"],
    },
    ["ALL"] = {
      ["WARRIOR"] = warrior["MYTHIC"]["ALL"],
      ["PALADIN"] = paladin["MYTHIC"]["ALL"],
      ["DEATHKNIGHT"] = deathknight["MYTHIC"]["ALL"],
    },
  },
}

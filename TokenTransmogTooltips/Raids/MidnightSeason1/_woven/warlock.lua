local addonName, ns = ...

local mergeTable = ns.mergeTable

---@class MS1Warlock
---@field RAID_FINDER table<string, table>
---@field NORMAL table<string, table>
---@field HEROIC table<string, table>
---@field MYTHIC table<string, table>

ns._Gear.MS1.WARLOCK = {
  ["RAID_FINDER"] = {
    ["HELM"] = {[126544]={297523,},},
    ["SHOULDERS"] = {[126545]={297499,},},
    ["CHEST"] = {[126546]={297559,},},
    ["GAUNTLETS"] = {[126551]={297535,},},
    ["LEGGINGS"] = {[126548]={297511,},},
  },
  ["NORMAL"] = {
    ["HELM"] = {[126511]={297518,},},
    ["SHOULDERS"] = {[126512]={297494,},},
    ["CHEST"] = {[126513]={297554,},},
    ["GAUNTLETS"] = {[126518]={297530,},},
    ["LEGGINGS"] = {[126515]={297506,},},
  },
  ["HEROIC"] = {
    ["HELM"] = {[126500]={297524,},},
    ["SHOULDERS"] = {[126501]={297500,},},
    ["CHEST"] = {[126502]={297560,},},
    ["GAUNTLETS"] = {[126507]={297536,},},
    ["LEGGINGS"] = {[126504]={297512,},},
  },
  ["MYTHIC"] = {
    ["HELM"] = {[126498]={297525,},},
    ["SHOULDERS"] = {[126499]={297501,},},
    ["CHEST"] = {[126491]={297561,},},
    ["GAUNTLETS"] = {[126496]={297537,},},
    ["LEGGINGS"] = {[126493]={297513,},},
  },
}

-- Merge all gear pieces for each difficulty
local LOCAL_RAID_FINDER_GEAR = {}
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.WARLOCK["RAID_FINDER"]["HELM"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.WARLOCK["RAID_FINDER"]["SHOULDERS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.WARLOCK["RAID_FINDER"]["CHEST"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.WARLOCK["RAID_FINDER"]["GAUNTLETS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.WARLOCK["RAID_FINDER"]["LEGGINGS"])

local LOCAL_NORMAL_GEAR = {}
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.WARLOCK["NORMAL"]["HELM"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.WARLOCK["NORMAL"]["SHOULDERS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.WARLOCK["NORMAL"]["CHEST"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.WARLOCK["NORMAL"]["GAUNTLETS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.WARLOCK["NORMAL"]["LEGGINGS"])

local LOCAL_HEROIC_GEAR = {}
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.WARLOCK["HEROIC"]["HELM"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.WARLOCK["HEROIC"]["SHOULDERS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.WARLOCK["HEROIC"]["CHEST"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.WARLOCK["HEROIC"]["GAUNTLETS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.WARLOCK["HEROIC"]["LEGGINGS"])

local LOCAL_MYTHIC_GEAR = {}
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.WARLOCK["MYTHIC"]["HELM"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.WARLOCK["MYTHIC"]["SHOULDERS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.WARLOCK["MYTHIC"]["CHEST"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.WARLOCK["MYTHIC"]["GAUNTLETS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.WARLOCK["MYTHIC"]["LEGGINGS"])

-- Create ALL sections for wildcard token use
ns._Gear.MS1.WARLOCK["RAID_FINDER"]["ALL"] = LOCAL_RAID_FINDER_GEAR
ns._Gear.MS1.WARLOCK["NORMAL"]["ALL"] = LOCAL_NORMAL_GEAR
ns._Gear.MS1.WARLOCK["HEROIC"]["ALL"] = LOCAL_HEROIC_GEAR
ns._Gear.MS1.WARLOCK["MYTHIC"]["ALL"] = LOCAL_MYTHIC_GEAR

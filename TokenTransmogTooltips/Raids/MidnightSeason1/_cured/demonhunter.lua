local addonName, ns = ...

local mergeTable = ns.mergeTable

---@class MS1Demonhunter
---@field RAID_FINDER table<string, table>
---@field NORMAL table<string, table>
---@field HEROIC table<string, table>
---@field MYTHIC table<string, table>

ns._Gear.MS1.DEMONHUNTER = {
  ["RAID_FINDER"] = {
    ["HELM"] = {[124245]={297415,},},
    ["SHOULDERS"] = {[124246]={297391,},},
    ["CHEST"] = {[124247]={297451,},},
    ["GAUNTLETS"] = {[124252]={297427,},},
    ["LEGGINGS"] = {[124249]={297403,},},
  },
  ["NORMAL"] = {
    ["HELM"] = {[124185]={297410,},},
    ["SHOULDERS"] = {[124186]={297386,},},
    ["CHEST"] = {[124187]={297446,},},
    ["GAUNTLETS"] = {[124192]={297422,},},
    ["LEGGINGS"] = {[124189]={297398,},},
  },
  ["HEROIC"] = {
    ["HELM"] = {[124209]={297416,},},
    ["SHOULDERS"] = {[124210]={297392,},},
    ["CHEST"] = {[124211]={297452,},},
    ["GAUNTLETS"] = {[124216]={297428,},},
    ["LEGGINGS"] = {[124213]={297404,},},
  },
  ["MYTHIC"] = {
    ["HELM"] = {[124206]={297417,},},
    ["SHOULDERS"] = {[124207]={297393,},},
    ["CHEST"] = {[124199]={297453,},},
    ["GAUNTLETS"] = {[124204]={297429,},},
    ["LEGGINGS"] = {[124201]={297405,},},
  },
}

-- Merge all gear pieces for each difficulty
local LOCAL_RAID_FINDER_GEAR = {}
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.DEMONHUNTER["RAID_FINDER"]["HELM"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.DEMONHUNTER["RAID_FINDER"]["SHOULDERS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.DEMONHUNTER["RAID_FINDER"]["CHEST"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.DEMONHUNTER["RAID_FINDER"]["GAUNTLETS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.DEMONHUNTER["RAID_FINDER"]["LEGGINGS"])

local LOCAL_NORMAL_GEAR = {}
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.DEMONHUNTER["NORMAL"]["HELM"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.DEMONHUNTER["NORMAL"]["SHOULDERS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.DEMONHUNTER["NORMAL"]["CHEST"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.DEMONHUNTER["NORMAL"]["GAUNTLETS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.DEMONHUNTER["NORMAL"]["LEGGINGS"])

local LOCAL_HEROIC_GEAR = {}
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.DEMONHUNTER["HEROIC"]["HELM"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.DEMONHUNTER["HEROIC"]["SHOULDERS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.DEMONHUNTER["HEROIC"]["CHEST"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.DEMONHUNTER["HEROIC"]["GAUNTLETS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.DEMONHUNTER["HEROIC"]["LEGGINGS"])

local LOCAL_MYTHIC_GEAR = {}
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.DEMONHUNTER["MYTHIC"]["HELM"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.DEMONHUNTER["MYTHIC"]["SHOULDERS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.DEMONHUNTER["MYTHIC"]["CHEST"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.DEMONHUNTER["MYTHIC"]["GAUNTLETS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.DEMONHUNTER["MYTHIC"]["LEGGINGS"])

-- Create ALL sections for wildcard token use
ns._Gear.MS1.DEMONHUNTER["RAID_FINDER"]["ALL"] = LOCAL_RAID_FINDER_GEAR
ns._Gear.MS1.DEMONHUNTER["NORMAL"]["ALL"] = LOCAL_NORMAL_GEAR
ns._Gear.MS1.DEMONHUNTER["HEROIC"]["ALL"] = LOCAL_HEROIC_GEAR
ns._Gear.MS1.DEMONHUNTER["MYTHIC"]["ALL"] = LOCAL_MYTHIC_GEAR

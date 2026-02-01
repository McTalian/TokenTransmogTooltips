local addonName, ns = ...

local mergeTable = ns.mergeTable

---@class MS1Shaman
---@field RAID_FINDER table<string, table>
---@field NORMAL table<string, table>
---@field HEROIC table<string, table>
---@field MYTHIC table<string, table>

ns._Gear.MS1.SHAMAN = {
  ["RAID_FINDER"] = {
    ["HELM"] = {[127113]={296767,},},
    ["SHOULDERS"] = {[127114]={296743,},},
    ["CHEST"] = {[127115]={296800,},},
    ["GAUNTLETS"] = {[127120]={296779,},},
    ["LEGGINGS"] = {[127117]={296752,},},
  },
  ["NORMAL"] = {
    ["HELM"] = {[127101]={296762,},},
    ["SHOULDERS"] = {[127102]={296738,},},
    ["CHEST"] = {[127103]={296801,},},
    ["GAUNTLETS"] = {[127108]={296774,},},
    ["LEGGINGS"] = {[127105]={296753,},},
  },
  ["HEROIC"] = {
    ["HELM"] = {[127077]={296768,},},
    ["SHOULDERS"] = {[127078]={296744,},},
    ["CHEST"] = {[127079]={296802,},},
    ["GAUNTLETS"] = {[127084]={296780,},},
    ["LEGGINGS"] = {[127081]={296754,},},
  },
  ["MYTHIC"] = {
    ["HELM"] = {[127099]={296769,},},
    ["SHOULDERS"] = {[127100]={296745,},},
    ["CHEST"] = {[127091]={296803,},},
    ["GAUNTLETS"] = {[127096]={296781,},},
    ["LEGGINGS"] = {[127093]={296755,},},
  },
}

-- Merge all gear pieces for each difficulty
local LOCAL_RAID_FINDER_GEAR = {}
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.SHAMAN["RAID_FINDER"]["HELM"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.SHAMAN["RAID_FINDER"]["SHOULDERS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.SHAMAN["RAID_FINDER"]["CHEST"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.SHAMAN["RAID_FINDER"]["GAUNTLETS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.SHAMAN["RAID_FINDER"]["LEGGINGS"])

local LOCAL_NORMAL_GEAR = {}
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.SHAMAN["NORMAL"]["HELM"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.SHAMAN["NORMAL"]["SHOULDERS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.SHAMAN["NORMAL"]["CHEST"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.SHAMAN["NORMAL"]["GAUNTLETS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.SHAMAN["NORMAL"]["LEGGINGS"])

local LOCAL_HEROIC_GEAR = {}
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.SHAMAN["HEROIC"]["HELM"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.SHAMAN["HEROIC"]["SHOULDERS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.SHAMAN["HEROIC"]["CHEST"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.SHAMAN["HEROIC"]["GAUNTLETS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.SHAMAN["HEROIC"]["LEGGINGS"])

local LOCAL_MYTHIC_GEAR = {}
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.SHAMAN["MYTHIC"]["HELM"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.SHAMAN["MYTHIC"]["SHOULDERS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.SHAMAN["MYTHIC"]["CHEST"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.SHAMAN["MYTHIC"]["GAUNTLETS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.SHAMAN["MYTHIC"]["LEGGINGS"])

-- Create ALL sections for wildcard token use
ns._Gear.MS1.SHAMAN["RAID_FINDER"]["ALL"] = LOCAL_RAID_FINDER_GEAR
ns._Gear.MS1.SHAMAN["NORMAL"]["ALL"] = LOCAL_NORMAL_GEAR
ns._Gear.MS1.SHAMAN["HEROIC"]["ALL"] = LOCAL_HEROIC_GEAR
ns._Gear.MS1.SHAMAN["MYTHIC"]["ALL"] = LOCAL_MYTHIC_GEAR

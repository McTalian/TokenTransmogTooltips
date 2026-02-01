local addonName, ns = ...

local mergeTable = ns.mergeTable

---@class MS1Evoker
---@field RAID_FINDER table<string, table>
---@field NORMAL table<string, table>
---@field HEROIC table<string, table>
---@field MYTHIC table<string, table>

ns._Gear.MS1.EVOKER = {
  ["RAID_FINDER"] = {
    ["HELM"] = {[126201]={296983,},},
    ["SHOULDERS"] = {[126202]={296959,},},
    ["CHEST"] = {[126203]={297019,},},
    ["GAUNTLETS"] = {[126208]={296995,},},
    ["LEGGINGS"] = {[126205]={296971,},},
  },
  ["NORMAL"] = {
    ["HELM"] = {[126228]={296978,},},
    ["SHOULDERS"] = {[126229]={296954,},},
    ["CHEST"] = {[126211]={297014,},},
    ["GAUNTLETS"] = {[126216]={296990,},},
    ["LEGGINGS"] = {[126213]={296966,},},
  },
  ["HEROIC"] = {
    ["HELM"] = {[126191]={296984,},},
    ["SHOULDERS"] = {[126192]={296960,},},
    ["CHEST"] = {[126193]={297020,},},
    ["GAUNTLETS"] = {[126198]={296996,},},
    ["LEGGINGS"] = {[126195]={296972,},},
  },
  ["MYTHIC"] = {
    ["HELM"] = {[126218]={296985,},},
    ["SHOULDERS"] = {[126227]={296961,},},
    ["CHEST"] = {[126220]={297021,},},
    ["GAUNTLETS"] = {[126225]={296997,},},
    ["LEGGINGS"] = {[126222]={296973,},},
  },
}

-- Merge all gear pieces for each difficulty
local LOCAL_RAID_FINDER_GEAR = {}
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.EVOKER["RAID_FINDER"]["HELM"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.EVOKER["RAID_FINDER"]["SHOULDERS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.EVOKER["RAID_FINDER"]["CHEST"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.EVOKER["RAID_FINDER"]["GAUNTLETS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.EVOKER["RAID_FINDER"]["LEGGINGS"])

local LOCAL_NORMAL_GEAR = {}
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.EVOKER["NORMAL"]["HELM"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.EVOKER["NORMAL"]["SHOULDERS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.EVOKER["NORMAL"]["CHEST"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.EVOKER["NORMAL"]["GAUNTLETS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.EVOKER["NORMAL"]["LEGGINGS"])

local LOCAL_HEROIC_GEAR = {}
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.EVOKER["HEROIC"]["HELM"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.EVOKER["HEROIC"]["SHOULDERS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.EVOKER["HEROIC"]["CHEST"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.EVOKER["HEROIC"]["GAUNTLETS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.EVOKER["HEROIC"]["LEGGINGS"])

local LOCAL_MYTHIC_GEAR = {}
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.EVOKER["MYTHIC"]["HELM"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.EVOKER["MYTHIC"]["SHOULDERS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.EVOKER["MYTHIC"]["CHEST"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.EVOKER["MYTHIC"]["GAUNTLETS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.EVOKER["MYTHIC"]["LEGGINGS"])

-- Create ALL sections for wildcard token use
ns._Gear.MS1.EVOKER["RAID_FINDER"]["ALL"] = LOCAL_RAID_FINDER_GEAR
ns._Gear.MS1.EVOKER["NORMAL"]["ALL"] = LOCAL_NORMAL_GEAR
ns._Gear.MS1.EVOKER["HEROIC"]["ALL"] = LOCAL_HEROIC_GEAR
ns._Gear.MS1.EVOKER["MYTHIC"]["ALL"] = LOCAL_MYTHIC_GEAR

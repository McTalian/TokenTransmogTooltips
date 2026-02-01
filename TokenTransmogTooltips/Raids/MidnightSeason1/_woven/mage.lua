local addonName, ns = ...

local mergeTable = ns.mergeTable

---@class MS1Mage
---@field RAID_FINDER table<string, table>
---@field NORMAL table<string, table>
---@field HEROIC table<string, table>
---@field MYTHIC table<string, table>

ns._Gear.MS1.MAGE = {
  ["RAID_FINDER"] = {
    ["HELM"] = {[125444]={297739,},},
    ["SHOULDERS"] = {[125445]={297715,},},
    ["CHEST"] = {[125446]={297775,},},
    ["GAUNTLETS"] = {[125451]={297751,},},
    ["LEGGINGS"] = {[125448]={297727,},},
  },
  ["NORMAL"] = {
    ["HELM"] = {[125408]={297734,},},
    ["SHOULDERS"] = {[125409]={297710,},},
    ["CHEST"] = {[125410]={297770,},},
    ["GAUNTLETS"] = {[125415]={297746,},},
    ["LEGGINGS"] = {[125412]={297722,},},
  },
  ["HEROIC"] = {
    ["HELM"] = {[125456]={297740,},},
    ["SHOULDERS"] = {[125457]={297716,},},
    ["CHEST"] = {[125458]={297776,},},
    ["GAUNTLETS"] = {[125463]={297752,},},
    ["LEGGINGS"] = {[125460]={297728,},},
  },
  ["MYTHIC"] = {
    ["HELM"] = {[125442]={297741,},},
    ["SHOULDERS"] = {[125443]={297717,},},
    ["CHEST"] = {[125434]={297777,},},
    ["GAUNTLETS"] = {[125439]={297753,},},
    ["LEGGINGS"] = {[125436]={297729,},},
  },
}

-- Merge all gear pieces for each difficulty
local LOCAL_RAID_FINDER_GEAR = {}
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.MAGE["RAID_FINDER"]["HELM"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.MAGE["RAID_FINDER"]["SHOULDERS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.MAGE["RAID_FINDER"]["CHEST"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.MAGE["RAID_FINDER"]["GAUNTLETS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.MAGE["RAID_FINDER"]["LEGGINGS"])

local LOCAL_NORMAL_GEAR = {}
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.MAGE["NORMAL"]["HELM"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.MAGE["NORMAL"]["SHOULDERS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.MAGE["NORMAL"]["CHEST"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.MAGE["NORMAL"]["GAUNTLETS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.MAGE["NORMAL"]["LEGGINGS"])

local LOCAL_HEROIC_GEAR = {}
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.MAGE["HEROIC"]["HELM"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.MAGE["HEROIC"]["SHOULDERS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.MAGE["HEROIC"]["CHEST"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.MAGE["HEROIC"]["GAUNTLETS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.MAGE["HEROIC"]["LEGGINGS"])

local LOCAL_MYTHIC_GEAR = {}
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.MAGE["MYTHIC"]["HELM"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.MAGE["MYTHIC"]["SHOULDERS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.MAGE["MYTHIC"]["CHEST"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.MAGE["MYTHIC"]["GAUNTLETS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.MAGE["MYTHIC"]["LEGGINGS"])

-- Create ALL sections for wildcard token use
ns._Gear.MS1.MAGE["RAID_FINDER"]["ALL"] = LOCAL_RAID_FINDER_GEAR
ns._Gear.MS1.MAGE["NORMAL"]["ALL"] = LOCAL_NORMAL_GEAR
ns._Gear.MS1.MAGE["HEROIC"]["ALL"] = LOCAL_HEROIC_GEAR
ns._Gear.MS1.MAGE["MYTHIC"]["ALL"] = LOCAL_MYTHIC_GEAR

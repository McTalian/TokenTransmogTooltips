local addonName, ns = ...

local mergeTable = ns.mergeTable

---@class MS1Druid
---@field RAID_FINDER table<string, table>
---@field NORMAL table<string, table>
---@field HEROIC table<string, table>
---@field MYTHIC table<string, table>

ns._Gear.MS1.DRUID = {
  ["RAID_FINDER"] = {
    ["HELM"] = {[126723]={297307,},},
    ["SHOULDERS"] = {[126724]={297283,},},
    ["CHEST"] = {[126725]={297343,},},
    ["GAUNTLETS"] = {[126730]={297319,},},
    ["LEGGINGS"] = {[126727]={297295,},},
  },
  ["NORMAL"] = {
    ["HELM"] = {[126759]={297302,},},
    ["SHOULDERS"] = {[126760]={297278,},},
    ["CHEST"] = {[126761]={297338,},},
    ["GAUNTLETS"] = {[126766]={297314,},},
    ["LEGGINGS"] = {[126763]={297290,},},
  },
  ["HEROIC"] = {
    ["HELM"] = {[126711]={297308,},},
    ["SHOULDERS"] = {[126712]={297284,},},
    ["CHEST"] = {[126713]={297344,},},
    ["GAUNTLETS"] = {[126718]={297320,},},
    ["LEGGINGS"] = {[126715]={297296,},},
  },
  ["MYTHIC"] = {
    ["HELM"] = {[126757]={297309,},},
    ["SHOULDERS"] = {[126758]={297285,},},
    ["CHEST"] = {[126749]={297345,},},
    ["GAUNTLETS"] = {[126754]={297321,},},
    ["LEGGINGS"] = {[126751]={297297,},},
  },
}

-- Merge all gear pieces for each difficulty
local LOCAL_RAID_FINDER_GEAR = {}
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.DRUID["RAID_FINDER"]["HELM"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.DRUID["RAID_FINDER"]["SHOULDERS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.DRUID["RAID_FINDER"]["CHEST"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.DRUID["RAID_FINDER"]["GAUNTLETS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.DRUID["RAID_FINDER"]["LEGGINGS"])

local LOCAL_NORMAL_GEAR = {}
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.DRUID["NORMAL"]["HELM"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.DRUID["NORMAL"]["SHOULDERS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.DRUID["NORMAL"]["CHEST"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.DRUID["NORMAL"]["GAUNTLETS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.DRUID["NORMAL"]["LEGGINGS"])

local LOCAL_HEROIC_GEAR = {}
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.DRUID["HEROIC"]["HELM"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.DRUID["HEROIC"]["SHOULDERS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.DRUID["HEROIC"]["CHEST"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.DRUID["HEROIC"]["GAUNTLETS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.DRUID["HEROIC"]["LEGGINGS"])

local LOCAL_MYTHIC_GEAR = {}
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.DRUID["MYTHIC"]["HELM"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.DRUID["MYTHIC"]["SHOULDERS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.DRUID["MYTHIC"]["CHEST"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.DRUID["MYTHIC"]["GAUNTLETS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.DRUID["MYTHIC"]["LEGGINGS"])

-- Create ALL sections for wildcard token use
ns._Gear.MS1.DRUID["RAID_FINDER"]["ALL"] = LOCAL_RAID_FINDER_GEAR
ns._Gear.MS1.DRUID["NORMAL"]["ALL"] = LOCAL_NORMAL_GEAR
ns._Gear.MS1.DRUID["HEROIC"]["ALL"] = LOCAL_HEROIC_GEAR
ns._Gear.MS1.DRUID["MYTHIC"]["ALL"] = LOCAL_MYTHIC_GEAR

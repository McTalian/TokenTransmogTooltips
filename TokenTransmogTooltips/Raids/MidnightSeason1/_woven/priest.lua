local addonName, ns = ...

local mergeTable = ns.mergeTable

---@class MS1Priest
---@field RAID_FINDER table<string, table>
---@field NORMAL table<string, table>
---@field HEROIC table<string, table>
---@field MYTHIC table<string, table>

ns._Gear.MS1.PRIEST = {
  ["RAID_FINDER"] = {
    ["HELM"] = {[126918]={297631,},},
    ["SHOULDERS"] = {[126919]={297607,},},
    ["CHEST"] = {[126920]={297667,},},
    ["GAUNTLETS"] = {[126925]={297643,},},
    ["LEGGINGS"] = {[126922]={297619,},},
  },
  ["NORMAL"] = {
    ["HELM"] = {[126906]={297626,},},
    ["SHOULDERS"] = {[126907]={297602,},},
    ["CHEST"] = {[126908]={297662,},},
    ["GAUNTLETS"] = {[126913]={297638,},},
    ["LEGGINGS"] = {[126910]={297614,},},
  },
  ["HEROIC"] = {
    ["HELM"] = {[126930]={297632,},},
    ["SHOULDERS"] = {[126931]={297608,},},
    ["CHEST"] = {[126932]={297668,},},
    ["GAUNTLETS"] = {[126937]={297644,},},
    ["LEGGINGS"] = {[126934]={297620,},},
  },
  ["MYTHIC"] = {
    ["HELM"] = {[126964]={297633,},},
    ["SHOULDERS"] = {[126965]={297609,},},
    ["CHEST"] = {[126956]={297669,},},
    ["GAUNTLETS"] = {[126961]={297645,},},
    ["LEGGINGS"] = {[126958]={297621,},},
  },
}

-- Merge all gear pieces for each difficulty
local LOCAL_RAID_FINDER_GEAR = {}
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.PRIEST["RAID_FINDER"]["HELM"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.PRIEST["RAID_FINDER"]["SHOULDERS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.PRIEST["RAID_FINDER"]["CHEST"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.PRIEST["RAID_FINDER"]["GAUNTLETS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.PRIEST["RAID_FINDER"]["LEGGINGS"])

local LOCAL_NORMAL_GEAR = {}
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.PRIEST["NORMAL"]["HELM"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.PRIEST["NORMAL"]["SHOULDERS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.PRIEST["NORMAL"]["CHEST"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.PRIEST["NORMAL"]["GAUNTLETS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.PRIEST["NORMAL"]["LEGGINGS"])

local LOCAL_HEROIC_GEAR = {}
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.PRIEST["HEROIC"]["HELM"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.PRIEST["HEROIC"]["SHOULDERS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.PRIEST["HEROIC"]["CHEST"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.PRIEST["HEROIC"]["GAUNTLETS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.PRIEST["HEROIC"]["LEGGINGS"])

local LOCAL_MYTHIC_GEAR = {}
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.PRIEST["MYTHIC"]["HELM"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.PRIEST["MYTHIC"]["SHOULDERS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.PRIEST["MYTHIC"]["CHEST"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.PRIEST["MYTHIC"]["GAUNTLETS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.PRIEST["MYTHIC"]["LEGGINGS"])

-- Create ALL sections for wildcard token use
ns._Gear.MS1.PRIEST["RAID_FINDER"]["ALL"] = LOCAL_RAID_FINDER_GEAR
ns._Gear.MS1.PRIEST["NORMAL"]["ALL"] = LOCAL_NORMAL_GEAR
ns._Gear.MS1.PRIEST["HEROIC"]["ALL"] = LOCAL_HEROIC_GEAR
ns._Gear.MS1.PRIEST["MYTHIC"]["ALL"] = LOCAL_MYTHIC_GEAR

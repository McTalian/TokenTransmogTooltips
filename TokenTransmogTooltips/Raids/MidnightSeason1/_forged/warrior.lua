local addonName, ns = ...

local mergeTable = ns.mergeTable

---@class MS1Warrior
---@field RAID_FINDER table<string, table>
---@field NORMAL table<string, table>
---@field HEROIC table<string, table>
---@field MYTHIC table<string, table>

ns._Gear.MS1.WARRIOR = {
  ["RAID_FINDER"] = {
    ["HELM"] = {[127337]={296443,},},
    ["SHOULDERS"] = {[127338]={296419,},},
    ["CHEST"] = {[127339]={296479,},},
    ["GAUNTLETS"] = {[127344]={296455,},},
    ["LEGGINGS"] = {[127341]={296431,},},
  },
  ["NORMAL"] = {
    ["HELM"] = {[127326]={296438,},},
    ["SHOULDERS"] = {[127327]={296414,},},
    ["CHEST"] = {[127328]={296474,},},
    ["GAUNTLETS"] = {[127333]={296450,},},
    ["LEGGINGS"] = {[127330]={296426,},},
  },
  ["HEROIC"] = {
    ["HELM"] = {[127293]={296444,},},
    ["SHOULDERS"] = {[127294]={296420,},},
    ["CHEST"] = {[127295]={296480,},},
    ["GAUNTLETS"] = {[127300]={296456,},},
    ["LEGGINGS"] = {[127297]={296432,},},
  },
  ["MYTHIC"] = {
    ["HELM"] = {[127291]={296445,},},
    ["SHOULDERS"] = {[127292]={296421,},},
    ["CHEST"] = {[127284]={296481,},},
    ["GAUNTLETS"] = {[127289]={296457,},},
    ["LEGGINGS"] = {[127286]={296433,},},
  },
}

-- Merge all gear pieces for each difficulty
local LOCAL_RAID_FINDER_GEAR = {}
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.WARRIOR["RAID_FINDER"]["HELM"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.WARRIOR["RAID_FINDER"]["SHOULDERS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.WARRIOR["RAID_FINDER"]["CHEST"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.WARRIOR["RAID_FINDER"]["GAUNTLETS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.WARRIOR["RAID_FINDER"]["LEGGINGS"])

local LOCAL_NORMAL_GEAR = {}
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.WARRIOR["NORMAL"]["HELM"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.WARRIOR["NORMAL"]["SHOULDERS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.WARRIOR["NORMAL"]["CHEST"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.WARRIOR["NORMAL"]["GAUNTLETS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.WARRIOR["NORMAL"]["LEGGINGS"])

local LOCAL_HEROIC_GEAR = {}
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.WARRIOR["HEROIC"]["HELM"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.WARRIOR["HEROIC"]["SHOULDERS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.WARRIOR["HEROIC"]["CHEST"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.WARRIOR["HEROIC"]["GAUNTLETS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.WARRIOR["HEROIC"]["LEGGINGS"])

local LOCAL_MYTHIC_GEAR = {}
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.WARRIOR["MYTHIC"]["HELM"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.WARRIOR["MYTHIC"]["SHOULDERS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.WARRIOR["MYTHIC"]["CHEST"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.WARRIOR["MYTHIC"]["GAUNTLETS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.WARRIOR["MYTHIC"]["LEGGINGS"])

-- Create ALL sections for wildcard token use
ns._Gear.MS1.WARRIOR["RAID_FINDER"]["ALL"] = LOCAL_RAID_FINDER_GEAR
ns._Gear.MS1.WARRIOR["NORMAL"]["ALL"] = LOCAL_NORMAL_GEAR
ns._Gear.MS1.WARRIOR["HEROIC"]["ALL"] = LOCAL_HEROIC_GEAR
ns._Gear.MS1.WARRIOR["MYTHIC"]["ALL"] = LOCAL_MYTHIC_GEAR

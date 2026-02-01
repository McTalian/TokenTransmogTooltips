local addonName, ns = ...

local mergeTable = ns.mergeTable

---@class MS1Monk
---@field RAID_FINDER table<string, table>
---@field NORMAL table<string, table>
---@field HEROIC table<string, table>
---@field MYTHIC table<string, table>

ns._Gear.MS1.MONK = {
  ["RAID_FINDER"] = {
    ["HELM"] = {[125595]={297199,},},
    ["SHOULDERS"] = {[125596]={297175,},},
    ["CHEST"] = {[125597]={297235,},},
    ["GAUNTLETS"] = {[125602]={297211,},},
    ["LEGGINGS"] = {[125599]={297187,},},
  },
  ["NORMAL"] = {
    ["HELM"] = {[125535]={297194,},},
    ["SHOULDERS"] = {[125536]={297170,},},
    ["CHEST"] = {[125537]={297230,},},
    ["GAUNTLETS"] = {[125542]={297206,},},
    ["LEGGINGS"] = {[125539]={297182,},},
  },
  ["HEROIC"] = {
    ["HELM"] = {[125559]={297200,},},
    ["SHOULDERS"] = {[125560]={297176,},},
    ["CHEST"] = {[125561]={297236,},},
    ["GAUNTLETS"] = {[125566]={297212,},},
    ["LEGGINGS"] = {[125563]={297188,},},
  },
  ["MYTHIC"] = {
    ["HELM"] = {[125580]={297201,},},
    ["SHOULDERS"] = {[125581]={297177,},},
    ["CHEST"] = {[125573]={297237,},},
    ["GAUNTLETS"] = {[125578]={297213,},},
    ["LEGGINGS"] = {[125575]={297189,},},
  },
}

-- Merge all gear pieces for each difficulty
local LOCAL_RAID_FINDER_GEAR = {}
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.MONK["RAID_FINDER"]["HELM"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.MONK["RAID_FINDER"]["SHOULDERS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.MONK["RAID_FINDER"]["CHEST"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.MONK["RAID_FINDER"]["GAUNTLETS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.MONK["RAID_FINDER"]["LEGGINGS"])

local LOCAL_NORMAL_GEAR = {}
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.MONK["NORMAL"]["HELM"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.MONK["NORMAL"]["SHOULDERS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.MONK["NORMAL"]["CHEST"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.MONK["NORMAL"]["GAUNTLETS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.MONK["NORMAL"]["LEGGINGS"])

local LOCAL_HEROIC_GEAR = {}
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.MONK["HEROIC"]["HELM"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.MONK["HEROIC"]["SHOULDERS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.MONK["HEROIC"]["CHEST"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.MONK["HEROIC"]["GAUNTLETS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.MONK["HEROIC"]["LEGGINGS"])

local LOCAL_MYTHIC_GEAR = {}
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.MONK["MYTHIC"]["HELM"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.MONK["MYTHIC"]["SHOULDERS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.MONK["MYTHIC"]["CHEST"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.MONK["MYTHIC"]["GAUNTLETS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.MONK["MYTHIC"]["LEGGINGS"])

-- Create ALL sections for wildcard token use
ns._Gear.MS1.MONK["RAID_FINDER"]["ALL"] = LOCAL_RAID_FINDER_GEAR
ns._Gear.MS1.MONK["NORMAL"]["ALL"] = LOCAL_NORMAL_GEAR
ns._Gear.MS1.MONK["HEROIC"]["ALL"] = LOCAL_HEROIC_GEAR
ns._Gear.MS1.MONK["MYTHIC"]["ALL"] = LOCAL_MYTHIC_GEAR

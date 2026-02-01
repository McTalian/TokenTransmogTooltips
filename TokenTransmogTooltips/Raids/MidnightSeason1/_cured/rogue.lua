local addonName, ns = ...

local mergeTable = ns.mergeTable

---@class MS1Rogue
---@field RAID_FINDER table<string, table>
---@field NORMAL table<string, table>
---@field HEROIC table<string, table>
---@field MYTHIC table<string, table>

ns._Gear.MS1.ROGUE = {
  ["RAID_FINDER"] = {
    ["HELM"] = {[123453]={297091,},},
    ["SHOULDERS"] = {[123454]={297067,},},
    ["CHEST"] = {[123455]={297127,},},
    ["GAUNTLETS"] = {[123460]={297103,},},
    ["LEGGINGS"] = {[123457]={297079,},},
  },
  ["NORMAL"] = {
    ["HELM"] = {[123475]={297086,},},
    ["SHOULDERS"] = {[123476]={297062,},},
    ["CHEST"] = {[123477]={297122,},},
    ["GAUNTLETS"] = {[123482]={297098,},},
    ["LEGGINGS"] = {[123479]={297074,},},
  },
  ["HEROIC"] = {
    ["HELM"] = {[123442]={297092,},},
    ["SHOULDERS"] = {[123443]={297068,},},
    ["CHEST"] = {[123444]={297128,},},
    ["GAUNTLETS"] = {[123449]={297104,},},
    ["LEGGINGS"] = {[123446]={297080,},},
  },
  ["MYTHIC"] = {
    ["HELM"] = {[123440]={297093,},},
    ["SHOULDERS"] = {[123441]={297069,},},
    ["CHEST"] = {[123433]={297129,},},
    ["GAUNTLETS"] = {[123438]={297105,},},
    ["LEGGINGS"] = {[123435]={297081,},},
  },
}

-- Merge all gear pieces for each difficulty
local LOCAL_RAID_FINDER_GEAR = {}
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.ROGUE["RAID_FINDER"]["HELM"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.ROGUE["RAID_FINDER"]["SHOULDERS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.ROGUE["RAID_FINDER"]["CHEST"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.ROGUE["RAID_FINDER"]["GAUNTLETS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.ROGUE["RAID_FINDER"]["LEGGINGS"])

local LOCAL_NORMAL_GEAR = {}
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.ROGUE["NORMAL"]["HELM"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.ROGUE["NORMAL"]["SHOULDERS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.ROGUE["NORMAL"]["CHEST"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.ROGUE["NORMAL"]["GAUNTLETS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.ROGUE["NORMAL"]["LEGGINGS"])

local LOCAL_HEROIC_GEAR = {}
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.ROGUE["HEROIC"]["HELM"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.ROGUE["HEROIC"]["SHOULDERS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.ROGUE["HEROIC"]["CHEST"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.ROGUE["HEROIC"]["GAUNTLETS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.ROGUE["HEROIC"]["LEGGINGS"])

local LOCAL_MYTHIC_GEAR = {}
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.ROGUE["MYTHIC"]["HELM"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.ROGUE["MYTHIC"]["SHOULDERS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.ROGUE["MYTHIC"]["CHEST"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.ROGUE["MYTHIC"]["GAUNTLETS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.ROGUE["MYTHIC"]["LEGGINGS"])

-- Create ALL sections for wildcard token use
ns._Gear.MS1.ROGUE["RAID_FINDER"]["ALL"] = LOCAL_RAID_FINDER_GEAR
ns._Gear.MS1.ROGUE["NORMAL"]["ALL"] = LOCAL_NORMAL_GEAR
ns._Gear.MS1.ROGUE["HEROIC"]["ALL"] = LOCAL_HEROIC_GEAR
ns._Gear.MS1.ROGUE["MYTHIC"]["ALL"] = LOCAL_MYTHIC_GEAR

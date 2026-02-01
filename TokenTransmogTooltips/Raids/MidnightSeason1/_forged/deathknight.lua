local addonName, ns = ...

local mergeTable = ns.mergeTable

---@class MS1Deathknight
---@field RAID_FINDER table<string, table>
---@field NORMAL table<string, table>
---@field HEROIC table<string, table>
---@field MYTHIC table<string, table>

ns._Gear.MS1.DEATHKNIGHT = {
  ["RAID_FINDER"] = {
    ["HELM"] = {[125672]={296659,},},
    ["SHOULDERS"] = {[125673]={296635,},},
    ["CHEST"] = {[125674]={296695,},},
    ["GAUNTLETS"] = {[125679]={296671,},},
    ["LEGGINGS"] = {[125676]={296647,},},
  },
  ["NORMAL"] = {
    ["HELM"] = {[125620]={296654,},},
    ["SHOULDERS"] = {[125621]={296630,},},
    ["CHEST"] = {[125622]={296690,},},
    ["GAUNTLETS"] = {[125627]={296666,},},
    ["LEGGINGS"] = {[125624]={296642,},},
  },
  ["HEROIC"] = {
    ["HELM"] = {[125633]={296660,},},
    ["SHOULDERS"] = {[125634]={296636,},},
    ["CHEST"] = {[125635]={296696,},},
    ["GAUNTLETS"] = {[125640]={296672,},},
    ["LEGGINGS"] = {[125637]={296648,},},
  },
  ["MYTHIC"] = {
    ["HELM"] = {[125669]={296661,},},
    ["SHOULDERS"] = {[125670]={296637,},},
    ["CHEST"] = {[125661]={296697,},},
    ["GAUNTLETS"] = {[125666]={296673,},},
    ["LEGGINGS"] = {[125663]={296649,},},
  },
}

-- Merge all gear pieces for each difficulty
local LOCAL_RAID_FINDER_GEAR = {}
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.DEATHKNIGHT["RAID_FINDER"]["HELM"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.DEATHKNIGHT["RAID_FINDER"]["SHOULDERS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.DEATHKNIGHT["RAID_FINDER"]["CHEST"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.DEATHKNIGHT["RAID_FINDER"]["GAUNTLETS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.DEATHKNIGHT["RAID_FINDER"]["LEGGINGS"])

local LOCAL_NORMAL_GEAR = {}
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.DEATHKNIGHT["NORMAL"]["HELM"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.DEATHKNIGHT["NORMAL"]["SHOULDERS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.DEATHKNIGHT["NORMAL"]["CHEST"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.DEATHKNIGHT["NORMAL"]["GAUNTLETS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.DEATHKNIGHT["NORMAL"]["LEGGINGS"])

local LOCAL_HEROIC_GEAR = {}
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.DEATHKNIGHT["HEROIC"]["HELM"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.DEATHKNIGHT["HEROIC"]["SHOULDERS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.DEATHKNIGHT["HEROIC"]["CHEST"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.DEATHKNIGHT["HEROIC"]["GAUNTLETS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.DEATHKNIGHT["HEROIC"]["LEGGINGS"])

local LOCAL_MYTHIC_GEAR = {}
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.DEATHKNIGHT["MYTHIC"]["HELM"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.DEATHKNIGHT["MYTHIC"]["SHOULDERS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.DEATHKNIGHT["MYTHIC"]["CHEST"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.DEATHKNIGHT["MYTHIC"]["GAUNTLETS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.DEATHKNIGHT["MYTHIC"]["LEGGINGS"])

-- Create ALL sections for wildcard token use
ns._Gear.MS1.DEATHKNIGHT["RAID_FINDER"]["ALL"] = LOCAL_RAID_FINDER_GEAR
ns._Gear.MS1.DEATHKNIGHT["NORMAL"]["ALL"] = LOCAL_NORMAL_GEAR
ns._Gear.MS1.DEATHKNIGHT["HEROIC"]["ALL"] = LOCAL_HEROIC_GEAR
ns._Gear.MS1.DEATHKNIGHT["MYTHIC"]["ALL"] = LOCAL_MYTHIC_GEAR

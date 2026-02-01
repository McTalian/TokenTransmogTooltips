local addonName, ns = ...

local mergeTable = ns.mergeTable

---@class MS1Hunter
---@field RAID_FINDER table<string, table>
---@field NORMAL table<string, table>
---@field HEROIC table<string, table>
---@field MYTHIC table<string, table>

ns._Gear.MS1.HUNTER = {
  ["RAID_FINDER"] = {
    ["HELM"] = {[125960]={296875,},},
    ["SHOULDERS"] = {[125961]={296851,},},
    ["CHEST"] = {[125962]={296911,},},
    ["GAUNTLETS"] = {[125967]={296887,},},
    ["LEGGINGS"] = {[125964]={296863,},},
  },
  ["NORMAL"] = {
    ["HELM"] = {[125996]={296870,},},
    ["SHOULDERS"] = {[125997]={296846,},},
    ["CHEST"] = {[125998]={296906,},},
    ["GAUNTLETS"] = {[126003]={296882,},},
    ["LEGGINGS"] = {[126000]={296858,},},
  },
  ["HEROIC"] = {
    ["HELM"] = {[125948]={296876,},},
    ["SHOULDERS"] = {[125949]={296852,},},
    ["CHEST"] = {[125950]={296912,},},
    ["GAUNTLETS"] = {[125955]={296888,},},
    ["LEGGINGS"] = {[125952]={296864,},},
  },
  ["MYTHIC"] = {
    ["HELM"] = {[125993]={296877,},},
    ["SHOULDERS"] = {[125994]={296853,},},
    ["CHEST"] = {[125986]={296913,},},
    ["GAUNTLETS"] = {[126122]={296889,},},
    ["LEGGINGS"] = {[125988]={296865,},},
  },
}

-- Merge all gear pieces for each difficulty
local LOCAL_RAID_FINDER_GEAR = {}
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.HUNTER["RAID_FINDER"]["HELM"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.HUNTER["RAID_FINDER"]["SHOULDERS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.HUNTER["RAID_FINDER"]["CHEST"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.HUNTER["RAID_FINDER"]["GAUNTLETS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.HUNTER["RAID_FINDER"]["LEGGINGS"])

local LOCAL_NORMAL_GEAR = {}
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.HUNTER["NORMAL"]["HELM"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.HUNTER["NORMAL"]["SHOULDERS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.HUNTER["NORMAL"]["CHEST"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.HUNTER["NORMAL"]["GAUNTLETS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.HUNTER["NORMAL"]["LEGGINGS"])

local LOCAL_HEROIC_GEAR = {}
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.HUNTER["HEROIC"]["HELM"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.HUNTER["HEROIC"]["SHOULDERS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.HUNTER["HEROIC"]["CHEST"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.HUNTER["HEROIC"]["GAUNTLETS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.HUNTER["HEROIC"]["LEGGINGS"])

local LOCAL_MYTHIC_GEAR = {}
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.HUNTER["MYTHIC"]["HELM"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.HUNTER["MYTHIC"]["SHOULDERS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.HUNTER["MYTHIC"]["CHEST"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.HUNTER["MYTHIC"]["GAUNTLETS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.HUNTER["MYTHIC"]["LEGGINGS"])

-- Create ALL sections for wildcard token use
ns._Gear.MS1.HUNTER["RAID_FINDER"]["ALL"] = LOCAL_RAID_FINDER_GEAR
ns._Gear.MS1.HUNTER["NORMAL"]["ALL"] = LOCAL_NORMAL_GEAR
ns._Gear.MS1.HUNTER["HEROIC"]["ALL"] = LOCAL_HEROIC_GEAR
ns._Gear.MS1.HUNTER["MYTHIC"]["ALL"] = LOCAL_MYTHIC_GEAR

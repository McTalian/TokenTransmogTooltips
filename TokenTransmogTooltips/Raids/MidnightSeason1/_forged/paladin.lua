local addonName, ns = ...

local mergeTable = ns.mergeTable

---@class MS1Paladin
---@field RAID_FINDER table<string, table>
---@field NORMAL table<string, table>
---@field HEROIC table<string, table>
---@field MYTHIC table<string, table>

ns._Gear.MS1.PALADIN = {
  ["RAID_FINDER"] = {
    ["HELM"] = {[127392]={296551,},},
    ["SHOULDERS"] = {[127393]={296527,},},
    ["CHEST"] = {[127394]={296587,},},
    ["GAUNTLETS"] = {[127399]={296563,},},
    ["LEGGINGS"] = {[127396]={296539,},},
  },
  ["NORMAL"] = {
    ["HELM"] = {[127381]={296546,},},
    ["SHOULDERS"] = {[127382]={296522,},},
    ["CHEST"] = {[127383]={296582,},},
    ["GAUNTLETS"] = {[127388]={296558,},},
    ["LEGGINGS"] = {[127385]={296534,},},
  },
  ["HEROIC"] = {
    ["HELM"] = {[127348]={296552,},},
    ["SHOULDERS"] = {[127349]={296528,},},
    ["CHEST"] = {[127350]={296588,},},
    ["GAUNTLETS"] = {[127355]={296564,},},
    ["LEGGINGS"] = {[127352]={296540,},},
  },
  ["MYTHIC"] = {
    ["HELM"] = {[127379]={296553,},},
    ["SHOULDERS"] = {[127380]={296529,},},
    ["CHEST"] = {[127372]={296589,},},
    ["GAUNTLETS"] = {[127377]={296565,},},
    ["LEGGINGS"] = {[127374]={296541,},},
  },
}

-- Merge all gear pieces for each difficulty
local LOCAL_RAID_FINDER_GEAR = {}
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.PALADIN["RAID_FINDER"]["HELM"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.PALADIN["RAID_FINDER"]["SHOULDERS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.PALADIN["RAID_FINDER"]["CHEST"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.PALADIN["RAID_FINDER"]["GAUNTLETS"])
mergeTable(LOCAL_RAID_FINDER_GEAR, ns._Gear.MS1.PALADIN["RAID_FINDER"]["LEGGINGS"])

local LOCAL_NORMAL_GEAR = {}
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.PALADIN["NORMAL"]["HELM"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.PALADIN["NORMAL"]["SHOULDERS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.PALADIN["NORMAL"]["CHEST"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.PALADIN["NORMAL"]["GAUNTLETS"])
mergeTable(LOCAL_NORMAL_GEAR, ns._Gear.MS1.PALADIN["NORMAL"]["LEGGINGS"])

local LOCAL_HEROIC_GEAR = {}
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.PALADIN["HEROIC"]["HELM"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.PALADIN["HEROIC"]["SHOULDERS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.PALADIN["HEROIC"]["CHEST"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.PALADIN["HEROIC"]["GAUNTLETS"])
mergeTable(LOCAL_HEROIC_GEAR, ns._Gear.MS1.PALADIN["HEROIC"]["LEGGINGS"])

local LOCAL_MYTHIC_GEAR = {}
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.PALADIN["MYTHIC"]["HELM"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.PALADIN["MYTHIC"]["SHOULDERS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.PALADIN["MYTHIC"]["CHEST"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.PALADIN["MYTHIC"]["GAUNTLETS"])
mergeTable(LOCAL_MYTHIC_GEAR, ns._Gear.MS1.PALADIN["MYTHIC"]["LEGGINGS"])

-- Create ALL sections for wildcard token use
ns._Gear.MS1.PALADIN["RAID_FINDER"]["ALL"] = LOCAL_RAID_FINDER_GEAR
ns._Gear.MS1.PALADIN["NORMAL"]["ALL"] = LOCAL_NORMAL_GEAR
ns._Gear.MS1.PALADIN["HEROIC"]["ALL"] = LOCAL_HEROIC_GEAR
ns._Gear.MS1.PALADIN["MYTHIC"]["ALL"] = LOCAL_MYTHIC_GEAR

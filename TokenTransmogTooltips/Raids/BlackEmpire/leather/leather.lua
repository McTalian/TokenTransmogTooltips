local addonName, ns = ...

local gear = ns._Gear.BlackEmpire

local demonhunter = gear["DEMONHUNTER"]
local druid = gear["DRUID"]
local monk = gear["MONK"]
local rogue = gear["ROGUE"]

ns._Gear.BlackEmpire["LEATHER"] = {
  ["NZOTH_ASSAULTS"] = {
    ["HELM"] = {
      ["DEMONHUNTER"] = demonhunter["NZOTH_ASSAULTS"]["HELM"],
      ["DRUID"] = druid["NZOTH_ASSAULTS"]["HELM"],
      ["MONK"] = monk["NZOTH_ASSAULTS"]["HELM"],
      ["ROGUE"] = rogue["NZOTH_ASSAULTS"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["DEMONHUNTER"] = demonhunter["NZOTH_ASSAULTS"]["SHOULDERS"],
      ["DRUID"] = druid["NZOTH_ASSAULTS"]["SHOULDERS"],
      ["MONK"] = monk["NZOTH_ASSAULTS"]["SHOULDERS"],
      ["ROGUE"] = rogue["NZOTH_ASSAULTS"]["SHOULDERS"],
    },
    ["CHEST"] = {
      ["DEMONHUNTER"] = demonhunter["NZOTH_ASSAULTS"]["CHEST"],
      ["DRUID"] = druid["NZOTH_ASSAULTS"]["CHEST"],
      ["MONK"] = monk["NZOTH_ASSAULTS"]["CHEST"],
      ["ROGUE"] = rogue["NZOTH_ASSAULTS"]["CHEST"],
    },
    ["BELT"] = {
      ["DEMONHUNTER"] = demonhunter["NZOTH_ASSAULTS"]["BELT"],
      ["DRUID"] = druid["NZOTH_ASSAULTS"]["BELT"],
      ["MONK"] = monk["NZOTH_ASSAULTS"]["BELT"],
      ["ROGUE"] = rogue["NZOTH_ASSAULTS"]["BELT"],
    },
    ["BRACERS"] = {
      ["DEMONHUNTER"] = demonhunter["NZOTH_ASSAULTS"]["BRACERS"],
      ["DRUID"] = druid["NZOTH_ASSAULTS"]["BRACERS"],
      ["MONK"] = monk["NZOTH_ASSAULTS"]["BRACERS"],
      ["ROGUE"] = rogue["NZOTH_ASSAULTS"]["BRACERS"],
    },
    ["GAUNTLETS"] = {
      ["DEMONHUNTER"] = demonhunter["NZOTH_ASSAULTS"]["GAUNTLETS"],
      ["DRUID"] = druid["NZOTH_ASSAULTS"]["GAUNTLETS"],
      ["MONK"] = monk["NZOTH_ASSAULTS"]["GAUNTLETS"],
      ["ROGUE"] = rogue["NZOTH_ASSAULTS"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["DEMONHUNTER"] = demonhunter["NZOTH_ASSAULTS"]["LEGGINGS"],
      ["DRUID"] = druid["NZOTH_ASSAULTS"]["LEGGINGS"],
      ["MONK"] = monk["NZOTH_ASSAULTS"]["LEGGINGS"],
      ["ROGUE"] = rogue["NZOTH_ASSAULTS"]["LEGGINGS"],
    },
    ["BOOTS"] = {
      ["DEMONHUNTER"] = demonhunter["NZOTH_ASSAULTS"]["BOOTS"],
      ["DRUID"] = druid["NZOTH_ASSAULTS"]["BOOTS"],
      ["MONK"] = monk["NZOTH_ASSAULTS"]["BOOTS"],
      ["ROGUE"] = rogue["NZOTH_ASSAULTS"]["BOOTS"],
    },
  },
}

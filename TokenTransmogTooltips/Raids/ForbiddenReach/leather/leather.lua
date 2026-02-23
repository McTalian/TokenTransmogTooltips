local addonName, ns = ...

local gear = ns._Gear.ForbiddenReach

local demonhunter = gear["DEMONHUNTER"]
local druid = gear["DRUID"]
local monk = gear["MONK"]
local rogue = gear["ROGUE"]

ns._Gear.ForbiddenReach["LEATHER"] = {
  ["THE_FORBIDDEN_REACH"] = {
    ["HELM"] = {
      ["DEMONHUNTER"] = demonhunter["THE_FORBIDDEN_REACH"]["HELM"],
      ["DRUID"] = druid["THE_FORBIDDEN_REACH"]["HELM"],
      ["MONK"] = monk["THE_FORBIDDEN_REACH"]["HELM"],
      ["ROGUE"] = rogue["THE_FORBIDDEN_REACH"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["DEMONHUNTER"] = demonhunter["THE_FORBIDDEN_REACH"]["SHOULDERS"],
      ["DRUID"] = druid["THE_FORBIDDEN_REACH"]["SHOULDERS"],
      ["MONK"] = monk["THE_FORBIDDEN_REACH"]["SHOULDERS"],
      ["ROGUE"] = rogue["THE_FORBIDDEN_REACH"]["SHOULDERS"],
    },
    ["CLOAK"] = {
      ["DEMONHUNTER"] = demonhunter["THE_FORBIDDEN_REACH"]["CLOAK"],
      ["DRUID"] = druid["THE_FORBIDDEN_REACH"]["CLOAK"],
      ["MONK"] = monk["THE_FORBIDDEN_REACH"]["CLOAK"],
      ["ROGUE"] = rogue["THE_FORBIDDEN_REACH"]["CLOAK"],
    },
    ["CHEST"] = {
      ["DEMONHUNTER"] = demonhunter["THE_FORBIDDEN_REACH"]["CHEST"],
      ["DRUID"] = druid["THE_FORBIDDEN_REACH"]["CHEST"],
      ["MONK"] = monk["THE_FORBIDDEN_REACH"]["CHEST"],
      ["ROGUE"] = rogue["THE_FORBIDDEN_REACH"]["CHEST"],
    },
    ["BELT"] = {
      ["DEMONHUNTER"] = demonhunter["THE_FORBIDDEN_REACH"]["BELT"],
      ["DRUID"] = druid["THE_FORBIDDEN_REACH"]["BELT"],
      ["MONK"] = monk["THE_FORBIDDEN_REACH"]["BELT"],
      ["ROGUE"] = rogue["THE_FORBIDDEN_REACH"]["BELT"],
    },
    ["LEGGINGS"] = {
      ["DEMONHUNTER"] = demonhunter["THE_FORBIDDEN_REACH"]["LEGGINGS"],
      ["DRUID"] = druid["THE_FORBIDDEN_REACH"]["LEGGINGS"],
      ["MONK"] = monk["THE_FORBIDDEN_REACH"]["LEGGINGS"],
      ["ROGUE"] = rogue["THE_FORBIDDEN_REACH"]["LEGGINGS"],
    },
    ["BOOTS"] = {
      ["DEMONHUNTER"] = demonhunter["THE_FORBIDDEN_REACH"]["BOOTS"],
      ["DRUID"] = druid["THE_FORBIDDEN_REACH"]["BOOTS"],
      ["MONK"] = monk["THE_FORBIDDEN_REACH"]["BOOTS"],
      ["ROGUE"] = rogue["THE_FORBIDDEN_REACH"]["BOOTS"],
    },
    ["BRACERS"] = {
      ["DEMONHUNTER"] = demonhunter["THE_FORBIDDEN_REACH"]["BRACERS"],
      ["DRUID"] = druid["THE_FORBIDDEN_REACH"]["BRACERS"],
      ["MONK"] = monk["THE_FORBIDDEN_REACH"]["BRACERS"],
      ["ROGUE"] = rogue["THE_FORBIDDEN_REACH"]["BRACERS"],
    },
    ["GAUNTLETS"] = {
      ["DEMONHUNTER"] = demonhunter["THE_FORBIDDEN_REACH"]["GAUNTLETS"],
      ["DRUID"] = druid["THE_FORBIDDEN_REACH"]["GAUNTLETS"],
      ["MONK"] = monk["THE_FORBIDDEN_REACH"]["GAUNTLETS"],
      ["ROGUE"] = rogue["THE_FORBIDDEN_REACH"]["GAUNTLETS"],
    },
  },
}

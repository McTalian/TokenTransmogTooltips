local addonName, ns = ...

local gear = ns._Gear.Benthic

local demonhunter = gear["DEMONHUNTER"]
local druid = gear["DRUID"]
local monk = gear["MONK"]
local rogue = gear["ROGUE"]

ns._Gear.Benthic["LEATHER"] = {
  ["NAZJATAR"] = {
    ["HELM"] = {
      ["DEMONHUNTER"] = demonhunter["NAZJATAR"]["HELM"],
      ["DRUID"] = druid["NAZJATAR"]["HELM"],
      ["MONK"] = monk["NAZJATAR"]["HELM"],
      ["ROGUE"] = rogue["NAZJATAR"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["DEMONHUNTER"] = demonhunter["NAZJATAR"]["SHOULDERS"],
      ["DRUID"] = druid["NAZJATAR"]["SHOULDERS"],
      ["MONK"] = monk["NAZJATAR"]["SHOULDERS"],
      ["ROGUE"] = rogue["NAZJATAR"]["SHOULDERS"],
    },
    ["CLOAK"] = {
      ["DEMONHUNTER"] = demonhunter["NAZJATAR"]["CLOAK"],
      ["DRUID"] = druid["NAZJATAR"]["CLOAK"],
      ["MONK"] = monk["NAZJATAR"]["CLOAK"],
      ["ROGUE"] = rogue["NAZJATAR"]["CLOAK"],
    },
    ["CHEST"] = {
      ["DEMONHUNTER"] = demonhunter["NAZJATAR"]["CHEST"],
      ["DRUID"] = druid["NAZJATAR"]["CHEST"],
      ["MONK"] = monk["NAZJATAR"]["CHEST"],
      ["ROGUE"] = rogue["NAZJATAR"]["CHEST"],
    },
    ["BELT"] = {
      ["DEMONHUNTER"] = demonhunter["NAZJATAR"]["BELT"],
      ["DRUID"] = druid["NAZJATAR"]["BELT"],
      ["MONK"] = monk["NAZJATAR"]["BELT"],
      ["ROGUE"] = rogue["NAZJATAR"]["BELT"],
    },
    ["BRACERS"] = {
      ["DEMONHUNTER"] = demonhunter["NAZJATAR"]["BRACERS"],
      ["DRUID"] = druid["NAZJATAR"]["BRACERS"],
      ["MONK"] = monk["NAZJATAR"]["BRACERS"],
      ["ROGUE"] = rogue["NAZJATAR"]["BRACERS"],
    },
    ["GAUNTLETS"] = {
      ["DEMONHUNTER"] = demonhunter["NAZJATAR"]["GAUNTLETS"],
      ["DRUID"] = druid["NAZJATAR"]["GAUNTLETS"],
      ["MONK"] = monk["NAZJATAR"]["GAUNTLETS"],
      ["ROGUE"] = rogue["NAZJATAR"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["DEMONHUNTER"] = demonhunter["NAZJATAR"]["LEGGINGS"],
      ["DRUID"] = druid["NAZJATAR"]["LEGGINGS"],
      ["MONK"] = monk["NAZJATAR"]["LEGGINGS"],
      ["ROGUE"] = rogue["NAZJATAR"]["LEGGINGS"],
    },
    ["BOOTS"] = {
      ["DEMONHUNTER"] = demonhunter["NAZJATAR"]["BOOTS"],
      ["DRUID"] = druid["NAZJATAR"]["BOOTS"],
      ["MONK"] = monk["NAZJATAR"]["BOOTS"],
      ["ROGUE"] = rogue["NAZJATAR"]["BOOTS"],
    },
  },
}

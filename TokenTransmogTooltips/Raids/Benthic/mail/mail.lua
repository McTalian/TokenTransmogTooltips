local addonName, ns = ...

local gear = ns._Gear.Benthic

local evoker = gear["EVOKER"]
local hunter = gear["HUNTER"]
local shaman = gear["SHAMAN"]

ns._Gear.Benthic["MAIL"] = {
  ["NAZJATAR"] = {
    ["HELM"] = {
      ["EVOKER"] = evoker["NAZJATAR"]["HELM"],
      ["HUNTER"] = hunter["NAZJATAR"]["HELM"],
      ["SHAMAN"] = shaman["NAZJATAR"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["EVOKER"] = evoker["NAZJATAR"]["SHOULDERS"],
      ["HUNTER"] = hunter["NAZJATAR"]["SHOULDERS"],
      ["SHAMAN"] = shaman["NAZJATAR"]["SHOULDERS"],
    },
    ["CLOAK"] = {
      ["EVOKER"] = evoker["NAZJATAR"]["CLOAK"],
      ["HUNTER"] = hunter["NAZJATAR"]["CLOAK"],
      ["SHAMAN"] = shaman["NAZJATAR"]["CLOAK"],
    },
    ["CHEST"] = {
      ["EVOKER"] = evoker["NAZJATAR"]["CHEST"],
      ["HUNTER"] = hunter["NAZJATAR"]["CHEST"],
      ["SHAMAN"] = shaman["NAZJATAR"]["CHEST"],
    },
    ["BELT"] = {
      ["EVOKER"] = evoker["NAZJATAR"]["BELT"],
      ["HUNTER"] = hunter["NAZJATAR"]["BELT"],
      ["SHAMAN"] = shaman["NAZJATAR"]["BELT"],
    },
    ["BRACERS"] = {
      ["EVOKER"] = evoker["NAZJATAR"]["BRACERS"],
      ["HUNTER"] = hunter["NAZJATAR"]["BRACERS"],
      ["SHAMAN"] = shaman["NAZJATAR"]["BRACERS"],
    },
    ["GAUNTLETS"] = {
      ["EVOKER"] = evoker["NAZJATAR"]["GAUNTLETS"],
      ["HUNTER"] = hunter["NAZJATAR"]["GAUNTLETS"],
      ["SHAMAN"] = shaman["NAZJATAR"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["EVOKER"] = evoker["NAZJATAR"]["LEGGINGS"],
      ["HUNTER"] = hunter["NAZJATAR"]["LEGGINGS"],
      ["SHAMAN"] = shaman["NAZJATAR"]["LEGGINGS"],
    },
    ["BOOTS"] = {
      ["EVOKER"] = evoker["NAZJATAR"]["BOOTS"],
      ["HUNTER"] = hunter["NAZJATAR"]["BOOTS"],
      ["SHAMAN"] = shaman["NAZJATAR"]["BOOTS"],
    },
  },
}

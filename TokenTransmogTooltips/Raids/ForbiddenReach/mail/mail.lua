local addonName, ns = ...

local gear = ns._Gear.ForbiddenReach

local evoker = gear["EVOKER"]
local hunter = gear["HUNTER"]
local shaman = gear["SHAMAN"]

ns._Gear.ForbiddenReach["MAIL"] = {
  ["THE_FORBIDDEN_REACH"] = {
    ["HELM"] = {
      ["EVOKER"] = evoker["THE_FORBIDDEN_REACH"]["HELM"],
      ["HUNTER"] = hunter["THE_FORBIDDEN_REACH"]["HELM"],
      ["SHAMAN"] = shaman["THE_FORBIDDEN_REACH"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["EVOKER"] = evoker["THE_FORBIDDEN_REACH"]["SHOULDERS"],
      ["HUNTER"] = hunter["THE_FORBIDDEN_REACH"]["SHOULDERS"],
      ["SHAMAN"] = shaman["THE_FORBIDDEN_REACH"]["SHOULDERS"],
    },
    ["CLOAK"] = {
      ["EVOKER"] = evoker["THE_FORBIDDEN_REACH"]["CLOAK"],
      ["HUNTER"] = hunter["THE_FORBIDDEN_REACH"]["CLOAK"],
      ["SHAMAN"] = shaman["THE_FORBIDDEN_REACH"]["CLOAK"],
    },
    ["CHEST"] = {
      ["EVOKER"] = evoker["THE_FORBIDDEN_REACH"]["CHEST"],
      ["HUNTER"] = hunter["THE_FORBIDDEN_REACH"]["CHEST"],
      ["SHAMAN"] = shaman["THE_FORBIDDEN_REACH"]["CHEST"],
    },
    ["BELT"] = {
      ["EVOKER"] = evoker["THE_FORBIDDEN_REACH"]["BELT"],
      ["HUNTER"] = hunter["THE_FORBIDDEN_REACH"]["BELT"],
      ["SHAMAN"] = shaman["THE_FORBIDDEN_REACH"]["BELT"],
    },
    ["LEGGINGS"] = {
      ["EVOKER"] = evoker["THE_FORBIDDEN_REACH"]["LEGGINGS"],
      ["HUNTER"] = hunter["THE_FORBIDDEN_REACH"]["LEGGINGS"],
      ["SHAMAN"] = shaman["THE_FORBIDDEN_REACH"]["LEGGINGS"],
    },
    ["BOOTS"] = {
      ["EVOKER"] = evoker["THE_FORBIDDEN_REACH"]["BOOTS"],
      ["HUNTER"] = hunter["THE_FORBIDDEN_REACH"]["BOOTS"],
      ["SHAMAN"] = shaman["THE_FORBIDDEN_REACH"]["BOOTS"],
    },
    ["BRACERS"] = {
      ["EVOKER"] = evoker["THE_FORBIDDEN_REACH"]["BRACERS"],
      ["HUNTER"] = hunter["THE_FORBIDDEN_REACH"]["BRACERS"],
      ["SHAMAN"] = shaman["THE_FORBIDDEN_REACH"]["BRACERS"],
    },
    ["GAUNTLETS"] = {
      ["EVOKER"] = evoker["THE_FORBIDDEN_REACH"]["GAUNTLETS"],
      ["HUNTER"] = hunter["THE_FORBIDDEN_REACH"]["GAUNTLETS"],
      ["SHAMAN"] = shaman["THE_FORBIDDEN_REACH"]["GAUNTLETS"],
    },
  },
}

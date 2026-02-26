local addonName, ns = ...

local gear = ns._Gear.BlackEmpire

local evoker = gear["EVOKER"]
local hunter = gear["HUNTER"]
local shaman = gear["SHAMAN"]

ns._Gear.BlackEmpire["MAIL"] = {
  ["NZOTH_ASSAULTS"] = {
    ["HELM"] = {
      ["EVOKER"] = evoker["NZOTH_ASSAULTS"]["HELM"],
      ["HUNTER"] = hunter["NZOTH_ASSAULTS"]["HELM"],
      ["SHAMAN"] = shaman["NZOTH_ASSAULTS"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["EVOKER"] = evoker["NZOTH_ASSAULTS"]["SHOULDERS"],
      ["HUNTER"] = hunter["NZOTH_ASSAULTS"]["SHOULDERS"],
      ["SHAMAN"] = shaman["NZOTH_ASSAULTS"]["SHOULDERS"],
    },
    ["CHEST"] = {
      ["EVOKER"] = evoker["NZOTH_ASSAULTS"]["CHEST"],
      ["HUNTER"] = hunter["NZOTH_ASSAULTS"]["CHEST"],
      ["SHAMAN"] = shaman["NZOTH_ASSAULTS"]["CHEST"],
    },
    ["BELT"] = {
      ["EVOKER"] = evoker["NZOTH_ASSAULTS"]["BELT"],
      ["HUNTER"] = hunter["NZOTH_ASSAULTS"]["BELT"],
      ["SHAMAN"] = shaman["NZOTH_ASSAULTS"]["BELT"],
    },
    ["BRACERS"] = {
      ["EVOKER"] = evoker["NZOTH_ASSAULTS"]["BRACERS"],
      ["HUNTER"] = hunter["NZOTH_ASSAULTS"]["BRACERS"],
      ["SHAMAN"] = shaman["NZOTH_ASSAULTS"]["BRACERS"],
    },
    ["GAUNTLETS"] = {
      ["EVOKER"] = evoker["NZOTH_ASSAULTS"]["GAUNTLETS"],
      ["HUNTER"] = hunter["NZOTH_ASSAULTS"]["GAUNTLETS"],
      ["SHAMAN"] = shaman["NZOTH_ASSAULTS"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["EVOKER"] = evoker["NZOTH_ASSAULTS"]["LEGGINGS"],
      ["HUNTER"] = hunter["NZOTH_ASSAULTS"]["LEGGINGS"],
      ["SHAMAN"] = shaman["NZOTH_ASSAULTS"]["LEGGINGS"],
    },
    ["BOOTS"] = {
      ["EVOKER"] = evoker["NZOTH_ASSAULTS"]["BOOTS"],
      ["HUNTER"] = hunter["NZOTH_ASSAULTS"]["BOOTS"],
      ["SHAMAN"] = shaman["NZOTH_ASSAULTS"]["BOOTS"],
    },
  },
}

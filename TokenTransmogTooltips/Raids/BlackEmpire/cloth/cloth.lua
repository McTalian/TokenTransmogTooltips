local addonName, ns = ...

local gear = ns._Gear.BlackEmpire

local priest = gear["PRIEST"]
local mage = gear["MAGE"]
local warlock = gear["WARLOCK"]

ns._Gear.BlackEmpire["CLOTH"] = {
  ["NZOTH_ASSAULTS"] = {
    ["HELM"] = {
      ["PRIEST"] = priest["NZOTH_ASSAULTS"]["HELM"],
      ["MAGE"] = mage["NZOTH_ASSAULTS"]["HELM"],
      ["WARLOCK"] = warlock["NZOTH_ASSAULTS"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["PRIEST"] = priest["NZOTH_ASSAULTS"]["SHOULDERS"],
      ["MAGE"] = mage["NZOTH_ASSAULTS"]["SHOULDERS"],
      ["WARLOCK"] = warlock["NZOTH_ASSAULTS"]["SHOULDERS"],
    },
    ["CHEST"] = {
      ["PRIEST"] = priest["NZOTH_ASSAULTS"]["CHEST"],
      ["MAGE"] = mage["NZOTH_ASSAULTS"]["CHEST"],
      ["WARLOCK"] = warlock["NZOTH_ASSAULTS"]["CHEST"],
    },
    ["BELT"] = {
      ["PRIEST"] = priest["NZOTH_ASSAULTS"]["BELT"],
      ["MAGE"] = mage["NZOTH_ASSAULTS"]["BELT"],
      ["WARLOCK"] = warlock["NZOTH_ASSAULTS"]["BELT"],
    },
    ["BRACERS"] = {
      ["PRIEST"] = priest["NZOTH_ASSAULTS"]["BRACERS"],
      ["MAGE"] = mage["NZOTH_ASSAULTS"]["BRACERS"],
      ["WARLOCK"] = warlock["NZOTH_ASSAULTS"]["BRACERS"],
    },
    ["GAUNTLETS"] = {
      ["PRIEST"] = priest["NZOTH_ASSAULTS"]["GAUNTLETS"],
      ["MAGE"] = mage["NZOTH_ASSAULTS"]["GAUNTLETS"],
      ["WARLOCK"] = warlock["NZOTH_ASSAULTS"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["PRIEST"] = priest["NZOTH_ASSAULTS"]["LEGGINGS"],
      ["MAGE"] = mage["NZOTH_ASSAULTS"]["LEGGINGS"],
      ["WARLOCK"] = warlock["NZOTH_ASSAULTS"]["LEGGINGS"],
    },
    ["BOOTS"] = {
      ["PRIEST"] = priest["NZOTH_ASSAULTS"]["BOOTS"],
      ["MAGE"] = mage["NZOTH_ASSAULTS"]["BOOTS"],
      ["WARLOCK"] = warlock["NZOTH_ASSAULTS"]["BOOTS"],
    },
  },
}

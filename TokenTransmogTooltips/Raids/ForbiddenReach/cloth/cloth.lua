local addonName, ns = ...

local gear = ns._Gear.ForbiddenReach

local priest = gear["PRIEST"]
local mage = gear["MAGE"]
local warlock = gear["WARLOCK"]

ns._Gear.ForbiddenReach["CLOTH"] = {
  ["THE_FORBIDDEN_REACH"] = {
    ["HELM"] = {
      ["PRIEST"] = priest["THE_FORBIDDEN_REACH"]["HELM"],
      ["MAGE"] = mage["THE_FORBIDDEN_REACH"]["HELM"],
      ["WARLOCK"] = warlock["THE_FORBIDDEN_REACH"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["PRIEST"] = priest["THE_FORBIDDEN_REACH"]["SHOULDERS"],
      ["MAGE"] = mage["THE_FORBIDDEN_REACH"]["SHOULDERS"],
      ["WARLOCK"] = warlock["THE_FORBIDDEN_REACH"]["SHOULDERS"],
    },
    ["CLOAK"] = {
      ["PRIEST"] = priest["THE_FORBIDDEN_REACH"]["CLOAK"],
      ["MAGE"] = mage["THE_FORBIDDEN_REACH"]["CLOAK"],
      ["WARLOCK"] = warlock["THE_FORBIDDEN_REACH"]["CLOAK"],
    },
    ["CHEST"] = {
      ["PRIEST"] = priest["THE_FORBIDDEN_REACH"]["CHEST"],
      ["MAGE"] = mage["THE_FORBIDDEN_REACH"]["CHEST"],
      ["WARLOCK"] = warlock["THE_FORBIDDEN_REACH"]["CHEST"],
    },
    ["BELT"] = {
      ["PRIEST"] = priest["THE_FORBIDDEN_REACH"]["BELT"],
      ["MAGE"] = mage["THE_FORBIDDEN_REACH"]["BELT"],
      ["WARLOCK"] = warlock["THE_FORBIDDEN_REACH"]["BELT"],
    },
    ["LEGGINGS"] = {
      ["PRIEST"] = priest["THE_FORBIDDEN_REACH"]["LEGGINGS"],
      ["MAGE"] = mage["THE_FORBIDDEN_REACH"]["LEGGINGS"],
      ["WARLOCK"] = warlock["THE_FORBIDDEN_REACH"]["LEGGINGS"],
    },
    ["BOOTS"] = {
      ["PRIEST"] = priest["THE_FORBIDDEN_REACH"]["BOOTS"],
      ["MAGE"] = mage["THE_FORBIDDEN_REACH"]["BOOTS"],
      ["WARLOCK"] = warlock["THE_FORBIDDEN_REACH"]["BOOTS"],
    },
    ["BRACERS"] = {
      ["PRIEST"] = priest["THE_FORBIDDEN_REACH"]["BRACERS"],
      ["MAGE"] = mage["THE_FORBIDDEN_REACH"]["BRACERS"],
      ["WARLOCK"] = warlock["THE_FORBIDDEN_REACH"]["BRACERS"],
    },
    ["GAUNTLETS"] = {
      ["PRIEST"] = priest["THE_FORBIDDEN_REACH"]["GAUNTLETS"],
      ["MAGE"] = mage["THE_FORBIDDEN_REACH"]["GAUNTLETS"],
      ["WARLOCK"] = warlock["THE_FORBIDDEN_REACH"]["GAUNTLETS"],
    },
  },
}

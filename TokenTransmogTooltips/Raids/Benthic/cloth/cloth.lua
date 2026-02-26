local addonName, ns = ...

local gear = ns._Gear.Benthic

local priest = gear["PRIEST"]
local mage = gear["MAGE"]
local warlock = gear["WARLOCK"]

ns._Gear.Benthic["CLOTH"] = {
  ["NAZJATAR"] = {
    ["HELM"] = {
      ["PRIEST"] = priest["NAZJATAR"]["HELM"],
      ["MAGE"] = mage["NAZJATAR"]["HELM"],
      ["WARLOCK"] = warlock["NAZJATAR"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["PRIEST"] = priest["NAZJATAR"]["SHOULDERS"],
      ["MAGE"] = mage["NAZJATAR"]["SHOULDERS"],
      ["WARLOCK"] = warlock["NAZJATAR"]["SHOULDERS"],
    },
    ["CLOAK"] = {
      ["PRIEST"] = priest["NAZJATAR"]["CLOAK"],
      ["MAGE"] = mage["NAZJATAR"]["CLOAK"],
      ["WARLOCK"] = warlock["NAZJATAR"]["CLOAK"],
    },
    ["CHEST"] = {
      ["PRIEST"] = priest["NAZJATAR"]["CHEST"],
      ["MAGE"] = mage["NAZJATAR"]["CHEST"],
      ["WARLOCK"] = warlock["NAZJATAR"]["CHEST"],
    },
    ["BELT"] = {
      ["PRIEST"] = priest["NAZJATAR"]["BELT"],
      ["MAGE"] = mage["NAZJATAR"]["BELT"],
      ["WARLOCK"] = warlock["NAZJATAR"]["BELT"],
    },
    ["BRACERS"] = {
      ["PRIEST"] = priest["NAZJATAR"]["BRACERS"],
      ["MAGE"] = mage["NAZJATAR"]["BRACERS"],
      ["WARLOCK"] = warlock["NAZJATAR"]["BRACERS"],
    },
    ["GAUNTLETS"] = {
      ["PRIEST"] = priest["NAZJATAR"]["GAUNTLETS"],
      ["MAGE"] = mage["NAZJATAR"]["GAUNTLETS"],
      ["WARLOCK"] = warlock["NAZJATAR"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["PRIEST"] = priest["NAZJATAR"]["LEGGINGS"],
      ["MAGE"] = mage["NAZJATAR"]["LEGGINGS"],
      ["WARLOCK"] = warlock["NAZJATAR"]["LEGGINGS"],
    },
    ["BOOTS"] = {
      ["PRIEST"] = priest["NAZJATAR"]["BOOTS"],
      ["MAGE"] = mage["NAZJATAR"]["BOOTS"],
      ["WARLOCK"] = warlock["NAZJATAR"]["BOOTS"],
    },
  },
}

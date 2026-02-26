local addonName, ns = ...

local gear = ns._Gear.Benthic

local deathknight = gear["DEATHKNIGHT"]
local paladin = gear["PALADIN"]
local warrior = gear["WARRIOR"]

ns._Gear.Benthic["PLATE"] = {
  ["NAZJATAR"] = {
    ["HELM"] = {
      ["DEATHKNIGHT"] = deathknight["NAZJATAR"]["HELM"],
      ["PALADIN"] = paladin["NAZJATAR"]["HELM"],
      ["WARRIOR"] = warrior["NAZJATAR"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["DEATHKNIGHT"] = deathknight["NAZJATAR"]["SHOULDERS"],
      ["PALADIN"] = paladin["NAZJATAR"]["SHOULDERS"],
      ["WARRIOR"] = warrior["NAZJATAR"]["SHOULDERS"],
    },
    ["CLOAK"] = {
      ["DEATHKNIGHT"] = deathknight["NAZJATAR"]["CLOAK"],
      ["PALADIN"] = paladin["NAZJATAR"]["CLOAK"],
      ["WARRIOR"] = warrior["NAZJATAR"]["CLOAK"],
    },
    ["CHEST"] = {
      ["DEATHKNIGHT"] = deathknight["NAZJATAR"]["CHEST"],
      ["PALADIN"] = paladin["NAZJATAR"]["CHEST"],
      ["WARRIOR"] = warrior["NAZJATAR"]["CHEST"],
    },
    ["BELT"] = {
      ["DEATHKNIGHT"] = deathknight["NAZJATAR"]["BELT"],
      ["PALADIN"] = paladin["NAZJATAR"]["BELT"],
      ["WARRIOR"] = warrior["NAZJATAR"]["BELT"],
    },
    ["BRACERS"] = {
      ["DEATHKNIGHT"] = deathknight["NAZJATAR"]["BRACERS"],
      ["PALADIN"] = paladin["NAZJATAR"]["BRACERS"],
      ["WARRIOR"] = warrior["NAZJATAR"]["BRACERS"],
    },
    ["GAUNTLETS"] = {
      ["DEATHKNIGHT"] = deathknight["NAZJATAR"]["GAUNTLETS"],
      ["PALADIN"] = paladin["NAZJATAR"]["GAUNTLETS"],
      ["WARRIOR"] = warrior["NAZJATAR"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["DEATHKNIGHT"] = deathknight["NAZJATAR"]["LEGGINGS"],
      ["PALADIN"] = paladin["NAZJATAR"]["LEGGINGS"],
      ["WARRIOR"] = warrior["NAZJATAR"]["LEGGINGS"],
    },
    ["BOOTS"] = {
      ["DEATHKNIGHT"] = deathknight["NAZJATAR"]["BOOTS"],
      ["PALADIN"] = paladin["NAZJATAR"]["BOOTS"],
      ["WARRIOR"] = warrior["NAZJATAR"]["BOOTS"],
    },
  },
}

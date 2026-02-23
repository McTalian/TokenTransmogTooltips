local addonName, ns = ...

local gear = ns._Gear.ForbiddenReach

local deathknight = gear["DEATHKNIGHT"]
local paladin = gear["PALADIN"]
local warrior = gear["WARRIOR"]

ns._Gear.ForbiddenReach["PLATE"] = {
  ["THE_FORBIDDEN_REACH"] = {
    ["HELM"] = {
      ["DEATHKNIGHT"] = deathknight["THE_FORBIDDEN_REACH"]["HELM"],
      ["PALADIN"] = paladin["THE_FORBIDDEN_REACH"]["HELM"],
      ["WARRIOR"] = warrior["THE_FORBIDDEN_REACH"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["DEATHKNIGHT"] = deathknight["THE_FORBIDDEN_REACH"]["SHOULDERS"],
      ["PALADIN"] = paladin["THE_FORBIDDEN_REACH"]["SHOULDERS"],
      ["WARRIOR"] = warrior["THE_FORBIDDEN_REACH"]["SHOULDERS"],
    },
    ["CLOAK"] = {
      ["DEATHKNIGHT"] = deathknight["THE_FORBIDDEN_REACH"]["CLOAK"],
      ["PALADIN"] = paladin["THE_FORBIDDEN_REACH"]["CLOAK"],
      ["WARRIOR"] = warrior["THE_FORBIDDEN_REACH"]["CLOAK"],
    },
    ["CHEST"] = {
      ["DEATHKNIGHT"] = deathknight["THE_FORBIDDEN_REACH"]["CHEST"],
      ["PALADIN"] = paladin["THE_FORBIDDEN_REACH"]["CHEST"],
      ["WARRIOR"] = warrior["THE_FORBIDDEN_REACH"]["CHEST"],
    },
    ["BELT"] = {
      ["DEATHKNIGHT"] = deathknight["THE_FORBIDDEN_REACH"]["BELT"],
      ["PALADIN"] = paladin["THE_FORBIDDEN_REACH"]["BELT"],
      ["WARRIOR"] = warrior["THE_FORBIDDEN_REACH"]["BELT"],
    },
    ["LEGGINGS"] = {
      ["DEATHKNIGHT"] = deathknight["THE_FORBIDDEN_REACH"]["LEGGINGS"],
      ["PALADIN"] = paladin["THE_FORBIDDEN_REACH"]["LEGGINGS"],
      ["WARRIOR"] = warrior["THE_FORBIDDEN_REACH"]["LEGGINGS"],
    },
    ["BOOTS"] = {
      ["DEATHKNIGHT"] = deathknight["THE_FORBIDDEN_REACH"]["BOOTS"],
      ["PALADIN"] = paladin["THE_FORBIDDEN_REACH"]["BOOTS"],
      ["WARRIOR"] = warrior["THE_FORBIDDEN_REACH"]["BOOTS"],
    },
    ["BRACERS"] = {
      ["DEATHKNIGHT"] = deathknight["THE_FORBIDDEN_REACH"]["BRACERS"],
      ["PALADIN"] = paladin["THE_FORBIDDEN_REACH"]["BRACERS"],
      ["WARRIOR"] = warrior["THE_FORBIDDEN_REACH"]["BRACERS"],
    },
    ["GAUNTLETS"] = {
      ["DEATHKNIGHT"] = deathknight["THE_FORBIDDEN_REACH"]["GAUNTLETS"],
      ["PALADIN"] = paladin["THE_FORBIDDEN_REACH"]["GAUNTLETS"],
      ["WARRIOR"] = warrior["THE_FORBIDDEN_REACH"]["GAUNTLETS"],
    },
  },
}

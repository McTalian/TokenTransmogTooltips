local addonName, ns = ...

local gear = ns._Gear.BlackEmpire

local deathknight = gear["DEATHKNIGHT"]
local paladin = gear["PALADIN"]
local warrior = gear["WARRIOR"]

ns._Gear.BlackEmpire["PLATE"] = {
  ["NZOTH_ASSAULTS"] = {
    ["HELM"] = {
      ["DEATHKNIGHT"] = deathknight["NZOTH_ASSAULTS"]["HELM"],
      ["PALADIN"] = paladin["NZOTH_ASSAULTS"]["HELM"],
      ["WARRIOR"] = warrior["NZOTH_ASSAULTS"]["HELM"],
    },
    ["SHOULDERS"] = {
      ["DEATHKNIGHT"] = deathknight["NZOTH_ASSAULTS"]["SHOULDERS"],
      ["PALADIN"] = paladin["NZOTH_ASSAULTS"]["SHOULDERS"],
      ["WARRIOR"] = warrior["NZOTH_ASSAULTS"]["SHOULDERS"],
    },
    ["CHEST"] = {
      ["DEATHKNIGHT"] = deathknight["NZOTH_ASSAULTS"]["CHEST"],
      ["PALADIN"] = paladin["NZOTH_ASSAULTS"]["CHEST"],
      ["WARRIOR"] = warrior["NZOTH_ASSAULTS"]["CHEST"],
    },
    ["BELT"] = {
      ["DEATHKNIGHT"] = deathknight["NZOTH_ASSAULTS"]["BELT"],
      ["PALADIN"] = paladin["NZOTH_ASSAULTS"]["BELT"],
      ["WARRIOR"] = warrior["NZOTH_ASSAULTS"]["BELT"],
    },
    ["BRACERS"] = {
      ["DEATHKNIGHT"] = deathknight["NZOTH_ASSAULTS"]["BRACERS"],
      ["PALADIN"] = paladin["NZOTH_ASSAULTS"]["BRACERS"],
      ["WARRIOR"] = warrior["NZOTH_ASSAULTS"]["BRACERS"],
    },
    ["GAUNTLETS"] = {
      ["DEATHKNIGHT"] = deathknight["NZOTH_ASSAULTS"]["GAUNTLETS"],
      ["PALADIN"] = paladin["NZOTH_ASSAULTS"]["GAUNTLETS"],
      ["WARRIOR"] = warrior["NZOTH_ASSAULTS"]["GAUNTLETS"],
    },
    ["LEGGINGS"] = {
      ["DEATHKNIGHT"] = deathknight["NZOTH_ASSAULTS"]["LEGGINGS"],
      ["PALADIN"] = paladin["NZOTH_ASSAULTS"]["LEGGINGS"],
      ["WARRIOR"] = warrior["NZOTH_ASSAULTS"]["LEGGINGS"],
    },
    ["BOOTS"] = {
      ["DEATHKNIGHT"] = deathknight["NZOTH_ASSAULTS"]["BOOTS"],
      ["PALADIN"] = paladin["NZOTH_ASSAULTS"]["BOOTS"],
      ["WARRIOR"] = warrior["NZOTH_ASSAULTS"]["BOOTS"],
    },
  },
}

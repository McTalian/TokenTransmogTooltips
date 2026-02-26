local addonName, ns = ...

local mergeTable = ns.mergeTable

local clothGear = ns._Gear.Benthic["CLOTH"]["NAZJATAR"]
local leatherGear = ns._Gear.Benthic["LEATHER"]["NAZJATAR"]
local mailGear = ns._Gear.Benthic["MAIL"]["NAZJATAR"]
local plateGear = ns._Gear.Benthic["PLATE"]["NAZJATAR"]

-- Each Benthic token is universal (usable by all classes), so we merge
-- all 4 armor types' class data per slot into a single table.
local SLOTS = { "HELM", "SHOULDERS", "CLOAK", "CHEST", "BELT", "BRACERS", "GAUNTLETS", "LEGGINGS", "BOOTS" }
local allClassGear = {}
for _, slot in ipairs(SLOTS) do
  allClassGear[slot] = {}
  mergeTable(allClassGear[slot], clothGear[slot])
  mergeTable(allClassGear[slot], leatherGear[slot])
  mergeTable(allClassGear[slot], mailGear[slot])
  mergeTable(allClassGear[slot], plateGear[slot])
end

ns.Raids.Benthic = {
  -- No difficulties or item creation contexts for Benthic tokens (itemContext = 0).
  -- Each token maps directly to class -> appearance data for all classes.
  [169479] = allClassGear["HELM"],
  [169484] = allClassGear["SHOULDERS"],
  [169481] = allClassGear["CLOAK"],
  [169480] = allClassGear["CHEST"],
  [169477] = allClassGear["BELT"],
  [169478] = allClassGear["BRACERS"],
  [169485] = allClassGear["GAUNTLETS"],
  [169482] = allClassGear["LEGGINGS"],
  [169483] = allClassGear["BOOTS"],
}

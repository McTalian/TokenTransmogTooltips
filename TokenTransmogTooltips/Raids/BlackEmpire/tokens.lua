local addonName, ns = ...

local clothGear = ns._Gear.BlackEmpire["CLOTH"]["NZOTH_ASSAULTS"]
local leatherGear = ns._Gear.BlackEmpire["LEATHER"]["NZOTH_ASSAULTS"]
local mailGear = ns._Gear.BlackEmpire["MAIL"]["NZOTH_ASSAULTS"]
local plateGear = ns._Gear.BlackEmpire["PLATE"]["NZOTH_ASSAULTS"]

-- Black Empire tokens are armor-type-specific (separate token per armor type per slot).
-- No difficulties or item creation contexts (itemContext = 0).
ns.Raids.BlackEmpire = {
  -- Plate tokens
  [173396] = plateGear["HELM"],
  [173398] = plateGear["SHOULDERS"],
  [173393] = plateGear["CHEST"],
  [173399] = plateGear["BELT"],
  [173397] = plateGear["LEGGINGS"],
  [173422] = plateGear["BRACERS"],
  [173395] = plateGear["GAUNTLETS"],
  [173394] = plateGear["BOOTS"],
  -- Mail tokens
  [173403] = mailGear["HELM"],
  [173405] = mailGear["SHOULDERS"],
  [173400] = mailGear["CHEST"],
  [173406] = mailGear["BELT"],
  [173404] = mailGear["LEGGINGS"],
  [173425] = mailGear["BRACERS"],
  [173402] = mailGear["GAUNTLETS"],
  [173401] = mailGear["BOOTS"],
  -- Leather tokens
  [173410] = leatherGear["HELM"],
  [173412] = leatherGear["SHOULDERS"],
  [173407] = leatherGear["CHEST"],
  [173413] = leatherGear["BELT"],
  [173411] = leatherGear["LEGGINGS"],
  [173424] = leatherGear["BRACERS"],
  [173409] = leatherGear["GAUNTLETS"],
  [173408] = leatherGear["BOOTS"],
  -- Cloth tokens
  [173417] = clothGear["HELM"],
  [173419] = clothGear["SHOULDERS"],
  [173414] = clothGear["CHEST"],
  [173420] = clothGear["BELT"],
  [173418] = clothGear["LEGGINGS"],
  [173423] = clothGear["BRACERS"],
  [173416] = clothGear["GAUNTLETS"],
  [173415] = clothGear["BOOTS"],
}

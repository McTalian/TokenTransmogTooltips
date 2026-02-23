local addonName, ns = ...

local mergeTable = ns.mergeTable

local clothGear = ns._Gear.ForbiddenReach["CLOTH"]["THE_FORBIDDEN_REACH"]
local leatherGear = ns._Gear.ForbiddenReach["LEATHER"]["THE_FORBIDDEN_REACH"]
local mailGear = ns._Gear.ForbiddenReach["MAIL"]["THE_FORBIDDEN_REACH"]
local plateGear = ns._Gear.ForbiddenReach["PLATE"]["THE_FORBIDDEN_REACH"]

local allClassCloakGear = {}
mergeTable(allClassCloakGear, clothGear["CLOAK"])
mergeTable(allClassCloakGear, leatherGear["CLOAK"])
mergeTable(allClassCloakGear, mailGear["CLOAK"])
mergeTable(allClassCloakGear, plateGear["CLOAK"])

ns.Raids.ForbiddenReach = {
  [203611] = plateGear["HELM"],
  [203612] = clothGear["HELM"],
  [203613] = mailGear["HELM"],
  [203614] = leatherGear["HELM"],
  [203615] = plateGear["CHEST"],
  [203616] = clothGear["CHEST"],
  [203617] = mailGear["CHEST"],
  [203618] = leatherGear["CHEST"],
  [203619] = leatherGear["LEGGINGS"],
  [203620] = mailGear["LEGGINGS"],
  [203622] = clothGear["LEGGINGS"],
  [203623] = plateGear["LEGGINGS"],
  [203626] = plateGear["SHOULDERS"],
  [203627] = clothGear["SHOULDERS"],
  [203628] = mailGear["SHOULDERS"],
  [203629] = leatherGear["SHOULDERS"],
  [203630] = leatherGear["BRACERS"],
  [203631] = mailGear["BRACERS"],
  [203632] = clothGear["BRACERS"],
  [203633] = plateGear["BRACERS"],
  [203634] = plateGear["BELT"],
  [203635] = clothGear["BELT"],
  [203636] = mailGear["BELT"],
  [203637] = leatherGear["BELT"],
  [203638] = leatherGear["BOOTS"],
  [203639] = mailGear["BOOTS"],
  [203640] = plateGear["BOOTS"],
  [203641] = clothGear["BOOTS"],
  [203642] = clothGear["GAUNTLETS"],
  [203643] = plateGear["GAUNTLETS"],
  [203644] = mailGear["GAUNTLETS"],
  [203645] = leatherGear["GAUNTLETS"],
  [203646] = allClassCloakGear,
}

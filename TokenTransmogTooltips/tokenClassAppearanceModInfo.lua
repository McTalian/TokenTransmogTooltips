local addonName, ns = ...

ns.tokenClassAppearanceModInfo = {}

-- All raids in the ns.Raids table are added to the tokenClassAppearanceModInfo table
for raidName, raidData in pairs(ns.Raids) do
  RunNextFrame(function()
    for tokenID, mapData in pairs(raidData) do
      if not ns.tokenClassAppearanceModInfo[tokenID] then
        ns.tokenClassAppearanceModInfo[tokenID] = mapData
      --@alpha@
      -- For alpha builds, we try to catch any duplicate token IDs during smoke testing
      else
        error(
          string.format(
            "Duplicate token ID %d found in %s for %s",
            tokenID,
            addonName,
            raidName
          )
        )
      --@end-alpha@
      end
    end
  end)
end

-- This is specific to Shadowlands, there is no need to update this for other expansions
ns.shadowlandsMultiClassLookup = {
  ["MYSTIC"] = { "DRUID", "HUNTER", "MAGE" },
  ["ZENITH"] = { "EVOKER", "MONK", "ROGUE", "WARRIOR" },
  ["VENERATED"] = { "PALADIN", "PRIEST", "SHAMAN" },
  ["ABOMINABLE"] = { "DEATHKNIGHT", "DEMONHUNTER", "WARLOCK" },
  ["DREADFUL"] = { "DEATHKNIGHT", "DEMONHUNTER", "WARLOCK" },
  ["APOGEE"] = { "WARRIOR", "PALADIN", "PRIEST", "MONK", "EVOKER" },
  ["THAUMATURGIC"] = { "SHAMAN", "MAGE", "WARLOCK", "DRUID" },
}

--@alpha@
TTT_Debug = ns.tokenClassAppearanceModInfo
--@end-alpha@

local addonName, ns = ...

local TTT = CreateFrame("Frame", addonName)

TTT:RegisterEvent("ADDON_LOADED")
TTT:RegisterEvent("PLAYER_ENTERING_WORLD")

TTT:SetScript("OnEvent", function(self, event, ...)
  if event == "ADDON_LOADED" then
    local arg1 = ...
    if arg1 == addonName then
      if TokenTransmogTooltipsDB == nil then
        TokenTransmogTooltipsDB = {}
      end
    end
  elseif event == "PLAYER_ENTERING_WORLD" then
    local isLogin, isReload = ...
    if isLogin or isReload then
      self:Initialize()
    end
  end
end)

function TTT:GetTooltipInfo(tokenLink)
  if not tokenLink then
    return nil, false
  end

  local _, linkOptions, _ = LinkUtil.ExtractLink(tokenLink) -- linkType, linkOptions, displayText
  local itemId = select(1, LinkUtil.SplitLinkOptions(linkOptions))
  itemId = tonumber(itemId) or 0
  local itemContext = select(12, LinkUtil.SplitLinkOptions(linkOptions))
  itemContext = tonumber(itemContext) or 0
  local tooltipInfo = {}
  --@alpha@
  table.insert(tooltipInfo, {
    leftText = "itemId:",
    rightText = itemId or "<NONE>"
  })
  table.insert(tooltipInfo, {
    leftText = "itemContext:",
    rightText = itemContext or "<NONE>"
  })
  --@end-alpha@

  local tokenId = GetItemInfoFromHyperlink(tokenLink)
  local tokenData = ns.tokenClassAppearanceModInfo and ns.tokenClassAppearanceModInfo[tokenId]
  if not tokenData then
    return tooltipInfo, true
  end

  if itemContext > 0 and tokenData.Difficulties then
    if tokenData.Difficulties[itemContext] then
      tokenData = tokenData.Difficulties[itemContext]
    end
  end
  if tokenData["ALLIANCE"] and tokenData["HORDE"] then
    local faction = UnitFactionGroup("player")
    if faction == "Alliance" then
      tokenData = tokenData["ALLIANCE"]
    elseif faction == "Horde" then
      tokenData = tokenData["HORDE"]
    else -- Damn Pandas!
      return tooltipInfo, true
    end
  end

  -- Group classes that share identical appearance data so their icons
  -- can be combined on the same tooltip row (e.g. Benthic armor-type tokens).
  local function getAppearanceFingerprint(appearances)
    local keys = {}
    for appearanceId in pairs(appearances) do
      keys[#keys + 1] = appearanceId
    end
    table.sort(keys)
    return table.concat(keys, ",")
  end

  local groups = {}       -- fingerprint -> { classes = {}, appearances = table }
  local groupOrder = {}   -- ordered fingerprints for stable iteration
  for classFileName, appearances in pairs(tokenData) do
    local fp = getAppearanceFingerprint(appearances)
    if not groups[fp] then
      groups[fp] = { classes = {}, appearances = appearances }
      groupOrder[#groupOrder + 1] = fp
    end
    groups[fp].classes[#groups[fp].classes + 1] = classFileName
  end

  local linksReceived = true
  for _, fp in ipairs(groupOrder) do
    local group = groups[fp]

    -- Build combined class icons for all classes in this group
    local classIcon = ""
    for _, classFileName in ipairs(group.classes) do
      if ns.shadowlandsMultiClassLookup[classFileName] then
        for _, fileName in ipairs(ns.shadowlandsMultiClassLookup[classFileName]) do
          classIcon = classIcon .. CreateAtlasMarkup("ClassIcon-" .. fileName, 16, 16) .. " "
        end
      else
        classIcon = classIcon .. CreateAtlasMarkup("ClassIcon-" .. classFileName, 16, 16) .. " "
      end
    end

    local appearanceCount = 0
    local collectedAppearanceCount = 0
    local missingItems = {}
    for appearanceId, modIds in pairs(group.appearances) do
      appearanceCount = appearanceCount + 1
      local classCollectedAppearance = false
      local sources
      if TokenTransmogTooltipsDB.AllSourcesMode then
        sources = modIds
      else
        sources = C_TransmogCollection.GetAllAppearanceSources(appearanceId)
      end
      if not sources or #sources == 0 then
        linksReceived = false
        break
      end

      for _, modId in ipairs(sources) do
        if C_TransmogCollection.PlayerHasTransmogItemModifiedAppearance(modId) then
          classCollectedAppearance = true
          break
        end
      end
      if classCollectedAppearance then
        collectedAppearanceCount = collectedAppearanceCount + 1
      else
        local appearanceInfo = C_TransmogCollection.GetAppearanceSourceInfo(modIds[1])
        local itemLink = appearanceInfo and appearanceInfo.itemLink
        if itemLink then
          local linkType, linkOptions, displayText = LinkUtil.ExtractLink(itemLink)
          if linkType ~= "item" or displayText == "" or displayText == "[]" then
            linksReceived = false
          else
            -- Track the item link and how many additional source items exist
            table.insert(missingItems, {
              itemLink = itemLink,
              extraSources = #modIds - 1,
            })
          end
        else
          linksReceived = false
        end
      end
    end

    if not linksReceived then
      break
    end

    local leftText = classIcon
    if appearanceCount > collectedAppearanceCount then
      for _, missing in ipairs(missingItems) do
        local rightText = missing.itemLink
        if missing.extraSources > 0 then
          rightText = rightText .. " and " .. missing.extraSources .. " more"
        end
        table.insert(tooltipInfo, {
          leftText = leftText,
          rightText = rightText,
        })
      end
    else
      local rightText = COLLECTED
      table.insert(tooltipInfo, {
        leftText = leftText,
        rightText = GREEN_FONT_COLOR:WrapTextInColorCode(rightText),
      })
    end
  end
  return tooltipInfo, linksReceived
end

function TTT.OnTooltipSetItem(tooltip)
  if not tooltip or not tooltip.GetItem then
    return
  end

  local _, itemLink = tooltip:GetItem()
  if not itemLink then
    return
  end

  local tooltipInfo, linkReceived = TTT:GetTooltipInfo(itemLink)
  if tooltipInfo then
    for _, info in ipairs(tooltipInfo) do
      tooltip:AddDoubleLine(info.leftText, info.rightText)
    end

    if not linkReceived then
      if tooltip.RefreshDataNextUpdate then
        tooltip:RefreshDataNextUpdate()
      end
    end

    tooltip:Show()
  end
end

function TTT:UpdateAppearanceTooltip(...)
  local tooltip, sources, primarySourceID, selectedIndex, showUseError, inLegionArtifactCategory, subheaderString = ...
  local sourceId
  if not selectedIndex then
    sourceId = primarySourceID
  else
    local validIndex = CollectionWardrobeUtil.GetValidIndexForNumSources(selectedIndex, #sources)
    local source = sources[validIndex]
    sourceId = source.sourceID
  end
  if sourceId and sourceId ~= 0 then
    local appearanceInfo = C_TransmogCollection.GetAppearanceSourceInfo(sourceId)
    local appearanceID = "NONE"
    if appearanceInfo and appearanceInfo.itemAppearanceID then
      appearanceID = tostring(appearanceInfo.itemAppearanceID)
    end
    GameTooltip_AddColoredLine(tooltip, "appearanceID: " .. appearanceID, LIGHTBLUE_FONT_COLOR)
    GameTooltip_AddColoredLine(tooltip, "modID: " .. tostring(sourceId), LIGHTBLUE_FONT_COLOR)
    GameTooltip:Show()
  end
end

function TTT:Initialize()
  EventRegistry:RegisterCallback("CollectionWardrobe.SetAppearanceTooltip", TTT.UpdateAppearanceTooltip, TTT)

  TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, self.OnTooltipSetItem)
  
  --@alpha@
  if ns.DungeonJournalExtractor then
    ns.DungeonJournalExtractor:Initialize()
  end
  --@end-alpha@
end

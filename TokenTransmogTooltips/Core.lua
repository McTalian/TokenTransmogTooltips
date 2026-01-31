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

  local linksReceived = true
  for classFileName, appearances in pairs(tokenData) do
    local classIcon = ""
    if ns.shadowlandsMultiClassLookup[classFileName] then
      for _, fileName in ipairs(ns.shadowlandsMultiClassLookup[classFileName]) do
        classIcon = classIcon .. CreateAtlasMarkup("ClassIcon-" .. fileName, 16, 16) .. " "
      end
    else
      classIcon = CreateAtlasMarkup("ClassIcon-" .. classFileName, 16, 16)
    end
    local appearanceCount = 0
    local collectedAppearanceCount = 0
    local missingItems = {}
    for appearanceId, modIds in pairs(appearances) do
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
            table.insert(missingItems, itemLink)
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
      for _, itemLink in ipairs(missingItems) do
        local rightText = itemLink
        table.insert(tooltipInfo, {
          leftText = leftText,
          rightText = rightText
        })
      end
    else
      local rightText = COLLECTED
      table.insert(tooltipInfo, {
        leftText = leftText,
        rightText = GREEN_FONT_COLOR:WrapTextInColorCode(rightText)
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
  if sourceId then
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
end

--@alpha@
local addonName, ns = ...

local DungeonJournalExtractor = {}

-- Slot keyword mappings for tooltip parsing (using singular forms)
local SLOT_KEYWORDS = {
  {keywords = {"head", "helm", "crown", "cowl", "faceguard"}, slot = "HELM"},
  {keywords = {"shoulder", "mantle", "pauldron", "spaulder"}, slot = "SHOULDERS"},
  {keywords = {"chest", "robe", "tunic", "breastplate", "hauberk", "vest"}, slot = "CHEST"},
  {keywords = {"waist", "belt", "girdle", "cord", "cinch"}, slot = "BELT"},
  {keywords = {"leg", "pant", "breech", "kilt"}, slot = "LEGGINGS"},
  {keywords = {"foot", "boot", "sabaton", "tread"}, slot = "BOOTS"},
  {keywords = {"wrist", "bracer", "armguard", "binding"}, slot = "BRACERS"},
  {keywords = {"hand", "glove", "gauntlet", "grip"}, slot = "GAUNTLETS"},
}

-- ItemContext to difficulty name mapping
local DIFFICULTY_NAMES = {
  [0] = "UNKNOWN",
  [Enum.ItemCreationContext.RaidFinder] = "RAID_FINDER",
  [Enum.ItemCreationContext.RaidNormal] = "NORMAL",
  [Enum.ItemCreationContext.RaidHeroic] = "HEROIC",
  [Enum.ItemCreationContext.RaidMythic] = "MYTHIC",

  -- Weird ones
  [Enum.ItemCreationContext.RaidFinderExtended] = "RAID_FINDER",
  [Enum.ItemCreationContext.RaidFinderExtended_2] = "RAID_FINDER",
  [Enum.ItemCreationContext.RaidFinderExtended_3] = "RAID_FINDER",
  [Enum.ItemCreationContext.RaidNormalExtended] = "NORMAL",
  [Enum.ItemCreationContext.RaidNormalExtended_2] = "NORMAL",
  [Enum.ItemCreationContext.RaidNormalExtended_3] = "NORMAL",
  [Enum.ItemCreationContext.RaidHeroicExtended] = "HEROIC",
  [Enum.ItemCreationContext.RaidHeroicExtended_2] = "HEROIC",
  [Enum.ItemCreationContext.RaidHeroicExtended_3] = "HEROIC",
  [Enum.ItemCreationContext.RaidMythicExtended] = "MYTHIC",
  [Enum.ItemCreationContext.RaidMythicExtended_2] = "MYTHIC",
  [Enum.ItemCreationContext.RaidMythicExtended_3] = "MYTHIC",
}

-- Map EJ difficulty IDs to our friendly names and item creation contexts
local EJ_DIFFICULTY_MAP = {
  [1] = {name = "NORMAL", context = Enum.ItemCreationContext.RaidNormal},
  [2] = {name = "HEROIC", context = Enum.ItemCreationContext.RaidHeroic},
  [14] = {name = "NORMAL", context = Enum.ItemCreationContext.RaidNormal}, -- Flexible Normal
  [15] = {name = "HEROIC", context = Enum.ItemCreationContext.RaidHeroic}, -- Flexible Heroic
  [16] = {name = "MYTHIC", context = Enum.ItemCreationContext.RaidMythic},
  [17] = {name = "RAID_FINDER", context = Enum.ItemCreationContext.RaidFinder},
}

local function GetCurrentEJDifficulty()
  local difficultyID = EJ_GetDifficulty()
  if difficultyID and EJ_DIFFICULTY_MAP[difficultyID] then
    return EJ_DIFFICULTY_MAP[difficultyID]
  end
  return nil
end

local function ParseSlotFromTooltip(itemID)
  local tooltipData = C_TooltipInfo.GetItemByID(itemID)
  if not tooltipData or not tooltipData.lines then
    return nil
  end
  
  -- Concatenate all tooltip text for searching
  local tooltipText = ""
  for _, line in ipairs(tooltipData.lines) do
    if line.leftText then
      tooltipText = tooltipText .. " " .. string.lower(line.leftText)
    end
    if line.rightText then
      tooltipText = tooltipText .. " " .. string.lower(line.rightText)
    end
  end
  
  -- Search for slot keywords
  for _, slotInfo in ipairs(SLOT_KEYWORDS) do
    for _, keyword in ipairs(slotInfo.keywords) do
      if string.find(tooltipText, keyword, 1, true) then
        return slotInfo.slot
      end
    end
  end
  
  return nil
end

local function ExtractClassesFromTooltip(itemID)
  local tooltipData = C_TooltipInfo.GetItemByID(itemID)
  if not tooltipData or not tooltipData.lines then
    return ""
  end
  
  local classes = {}
  for _, line in ipairs(tooltipData.lines) do
    local text = line.leftText or ""
    -- Look for class names in the tooltip
    -- The classes line usually says "Classes: Death Knight, Demon Hunter, Warlock" or similar
    if string.find(string.lower(text), "classes:") then
      return text
    end
  end
  
  return ""
end

function DungeonJournalExtractor:ExtractTokenData()
  local tokens = {}
  local cd = ColorManager.GetColorDataForItemQuality(Enum.ItemQuality.Epic)
  local epicHex = cd.color:GenerateHexColor()
  
  -- Get current difficulty filter from EJ
  local currentDifficulty = GetCurrentEJDifficulty()
  local currentDifficultyName = currentDifficulty and currentDifficulty.name or "UNKNOWN"
  local currentDifficultyContext = currentDifficulty and currentDifficulty.context or 0
  
  for i = 1, EJ_GetNumLoot() do
    local itemInfo = C_EncounterJournal.GetLootInfoByIndex(i)
    
    -- Filter for tokens: Epic quality, "Other" slot, no season ID
    if itemInfo and 
       itemInfo.filterType == Enum.ItemSlotFilterType.Other and 
       itemInfo.itemQuality == epicHex and 
       itemInfo.displaySeasonID == nil then
      
      -- Extract itemContext (difficulty)
      local _, linkOptions, _ = LinkUtil.ExtractLink(itemInfo.link)
      local itemContext = select(12, LinkUtil.SplitLinkOptions(linkOptions))
      itemContext = tonumber(itemContext) or 0
      
      -- Parse slot from tooltip
      local slot = ParseSlotFromTooltip(itemInfo.itemID)
      
      -- Get classes info
      local classesText = ExtractClassesFromTooltip(itemInfo.itemID)
      
      -- Use EJ difficulty if itemContext is 0 or doesn't match known values
      local difficulty = DIFFICULTY_NAMES[itemContext]
      if not difficulty or difficulty == "UNKNOWN" then
        difficulty = currentDifficultyName
        itemContext = currentDifficultyContext
      end
      
      table.insert(tokens, {
        itemID = itemInfo.itemID,
        name = itemInfo.name,
        slot = slot or "UNKNOWN",
        difficulty = difficulty,
        itemContext = itemContext,
        classesText = classesText,
      })
    end
  end
  
  return tokens
end

function DungeonJournalExtractor:FormatTokenData(tokens)
  if not tokens or #tokens == 0 then
    return "No tokens found. Make sure you have the Dungeon Journal open to a raid's loot page."
  end
  
  -- Get current difficulty info for header
  local currentDifficulty = GetCurrentEJDifficulty()
  local difficultyName = currentDifficulty and currentDifficulty.name or "UNKNOWN"
  
  local output = {}
  table.insert(output, string.format("-- Extracted Token Data (Difficulty: %s) --", difficultyName))
  table.insert(output, "-- Format: [ITEMID] - Token Name - SLOT - DIFFICULTY(ItemCreationContext) -- [Classes]")
  table.insert(output, "")
  
  for _, token in ipairs(tokens) do
    local line = string.format(
      "[%d] - %s - %s - %s(%s)",
      token.itemID,
      token.name,
      token.slot,
      token.difficulty,
      token.itemContext
    )
    
    -- Add classes info as a comment if available
    if token.classesText and token.classesText ~= "" then
      line = line .. " -- " .. token.classesText
    end
    table.insert(output, line)
  end
  
  table.insert(output, "")
  table.insert(output, string.format("-- Total tokens found: %d", #tokens))
  
  return table.concat(output, "\n")
end

-- Create the extraction button
function DungeonJournalExtractor:Initialize()
  if self._initialized then
    return
  end

  -- Ensure Encounter Journal UI is loaded
  if not EncounterJournal then
    if C_AddOns and C_AddOns.LoadAddOn then
      C_AddOns.LoadAddOn("Blizzard_EncounterJournal")
    elseif EncounterJournal_LoadUI then
      EncounterJournal_LoadUI()
    end
  end

  if not EncounterJournal then
    -- Defer initialization until Blizzard_EncounterJournal is loaded
    if not self._loadFrame then
      self._loadFrame = CreateFrame("Frame")
      self._loadFrame:RegisterEvent("ADDON_LOADED")
      self._loadFrame:SetScript("OnEvent", function(_, _, addonName)
        if addonName == "Blizzard_EncounterJournal" then
          self._loadFrame:UnregisterEvent("ADDON_LOADED")
          self._loadFrame:SetScript("OnEvent", nil)
          self._loadFrame = nil
          self:Initialize()
        end
      end)
    end
    return
  end

  self._initialized = true

  -- Create the extraction button
  local extractButton = CreateFrame("Button", "TTT_EJExtractButton", EncounterJournal, "UIPanelButtonTemplate")
  extractButton:SetSize(100, 25)
  extractButton:SetPoint("LEFT", EncounterJournalEncounterFrameInfoLootTab, "RIGHT", 5, 0)
  extractButton:SetText("Extract Tokens")
  
  -- Create the modal frame
  local modal = CreateFrame("Frame", "TTT_EJExtractorModal", UIParent, "BasicFrameTemplateWithInset")
  modal:SetSize(600, 500)
  modal:SetPoint("CENTER")
  modal:SetMovable(true)
  modal:EnableMouse(true)
  modal:RegisterForDrag("LeftButton")
  modal:SetScript("OnDragStart", modal.StartMoving)
  modal:SetScript("OnDragStop", modal.StopMovingOrSizing)
  modal:SetFrameStrata("DIALOG")
  modal:Hide()
  
  modal.title = modal:CreateFontString(nil, "OVERLAY")
  modal.title:SetFontObject("GameFontHighlight")
  modal.title:SetPoint("LEFT", modal.TitleBg, "LEFT", 5, 0)
  modal.title:SetText("Token Data Extractor")
  
  -- Info text
  modal.infoText = modal:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  modal.infoText:SetPoint("TOPLEFT", modal.InsetBg or modal, "TOPLEFT", 10, -10)
  modal.infoText:SetText("Extracted token data (current difficulty filter):")
  modal.infoText:SetJustifyH("LEFT")
  
  -- Scrollable output area
  modal.outputScroll = CreateFrame("ScrollFrame", nil, modal, "UIPanelScrollFrameTemplate")
  modal.outputScroll:SetPoint("TOPLEFT", modal.infoText, "BOTTOMLEFT", 5, -10)
  modal.outputScroll:SetPoint("BOTTOMRIGHT", modal, "BOTTOMRIGHT", -30, 10)
  
  modal.outputEditBox = CreateFrame("EditBox", nil, modal.outputScroll)
  modal.outputEditBox:SetMultiLine(true)
  modal.outputEditBox:SetSize(540, 1000)
  modal.outputEditBox:SetFontObject("GameFontWhite")
  modal.outputEditBox:SetAutoFocus(false)
  modal.outputEditBox:SetScript("OnEscapePressed", function(self)
    self:ClearFocus()
  end)
  modal.outputScroll:SetScrollChild(modal.outputEditBox)
  
  -- Extract button handler
  extractButton:SetScript("OnClick", function()
    local tokens = DungeonJournalExtractor:ExtractTokenData()
    local output = DungeonJournalExtractor:FormatTokenData(tokens)
    
    modal.outputEditBox:SetText(output)
    modal.outputEditBox:HighlightText()
    modal.outputEditBox:SetFocus()
    modal:Show()
  end)
  
  -- Only show button when encounter journal is showing loot tab
  local function UpdateButtonVisibility()
    if EncounterJournal:IsShown() and
       EncounterJournal.encounter and
       EncounterJournal.encounter.info and
       EncounterJournal.encounter.info.tab and
       EncounterJournal.encounter.info.lootTab and
       EncounterJournal.encounter.info.tab == EncounterJournal.encounter.info.lootTab:GetID()
    then
      extractButton:Show()
    else
      extractButton:Hide()
    end
  end
  
  EncounterJournal:HookScript("OnShow", UpdateButtonVisibility)
  EncounterJournal:HookScript("OnHide", function()
    extractButton:Hide()
  end)
  
  -- Hook into tab selection to show/hide button
  hooksecurefunc("EncounterJournal_DisplayInstance", UpdateButtonVisibility)
  hooksecurefunc("EncounterJournal_LootUpdate", UpdateButtonVisibility)
  
  extractButton:Hide() -- Hidden by default until EJ is opened
  
  print("|cff00ff00TokenTransmogTooltips|r: Dungeon Journal token extractor loaded (Alpha)")
end

-- Export to namespace
ns.DungeonJournalExtractor = DungeonJournalExtractor
--@end-alpha@

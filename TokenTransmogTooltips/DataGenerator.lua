--@alpha@
local addonName, ns = ...

local DataGenerator = {}

-- Input mode constants
local MODE_SET_LABEL = 1
local MODE_ITEM_LIST = 2

-- Inventory slot constants mapped to display names
local INVENTORY_SLOTS = {
  {id = INVSLOT_HEAD, name = "HELM", constant = "INVSLOT_HEAD"},
  {id = INVSLOT_SHOULDER, name = "SHOULDERS", constant = "INVSLOT_SHOULDER"},
  {id = INVSLOT_BACK, name = "CLOAK", constant = "INVSLOT_BACK"},
  {id = INVSLOT_CHEST, name = "CHEST", constant = "INVSLOT_CHEST"},
  {id = INVSLOT_WAIST, name = "BELT", constant = "INVSLOT_WAIST"},
  {id = INVSLOT_LEGS, name = "LEGGINGS", constant = "INVSLOT_LEGS"},
  {id = INVSLOT_FEET, name = "BOOTS", constant = "INVSLOT_FEET"},
  {id = INVSLOT_WRIST, name = "BRACERS", constant = "INVSLOT_WRIST"},
  {id = INVSLOT_HAND, name = "GAUNTLETS", constant = "INVSLOT_HAND"},
}

local function GetBitPosition(mask)
  local pos = 0
  while mask > 1 do
    mask = bit.rshift(mask, 1)
    pos = pos + 1
  end
  return pos
end

local function TokenizeWords(value)
  if not value then
    return {}
  end

  local normalized = string.lower(value)
  normalized = string.gsub(normalized, "[^%w]+", " ")

  local words = {}
  for word in string.gmatch(normalized, "%S+") do
    if #word >= 3 then
      words[word] = true
    end
  end

  return words
end

local function GetWordOverlapScore(setWords, sourceName)
  if not sourceName then
    return 0
  end

  local sourceWords = TokenizeWords(sourceName)
  local score = 0
  for word, _ in pairs(setWords) do
    if sourceWords[word] then
      score = score + 1
    end
  end

  return score
end

local function GetPreferredSourceIndex(sources, setName)
  if not sources or #sources == 0 then
    return nil
  end

  local setWords = TokenizeWords(setName or "")
  local bestIndex = nil
  local bestScore = 0
  for index, source in ipairs(sources) do
    local score = GetWordOverlapScore(setWords, source.name)
    if score > bestScore then
      bestScore = score
      bestIndex = index
    end
  end

  if bestIndex and bestScore > 0 then
    return bestIndex
  end

  return 1
end

-- Create the main frame
local frame = CreateFrame("Frame", "TTT_DataGeneratorFrame", UIParent, "BasicFrameTemplateWithInset")
frame:SetSize(600, 500)
frame:SetPoint("CENTER")
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
frame:Hide()

frame.title = frame:CreateFontString(nil, "OVERLAY")
frame.title:SetFontObject("GameFontHighlight")
frame.title:SetPoint("LEFT", frame.TitleBg, "LEFT", 5, 0)
frame.title:SetText("Token Data Generator")

-- Mode toggle buttons
frame.setLabelBtn = CreateFrame("Button", nil, frame, "GameMenuButtonTemplate")
frame.setLabelBtn:SetSize(140, 25)
frame.setLabelBtn:SetPoint("TOPLEFT", frame.InsetBg or frame, "TOPLEFT", 10, -10)
frame.setLabelBtn:SetText("Set Label")
frame.setLabelBtn:SetNormalFontObject("GameFontNormal")
frame.setLabelBtn:SetHighlightFontObject("GameFontHighlight")

frame.itemListBtn = CreateFrame("Button", nil, frame, "GameMenuButtonTemplate")
frame.itemListBtn:SetSize(140, 25)
frame.itemListBtn:SetPoint("LEFT", frame.setLabelBtn, "RIGHT", 5, 0)
frame.itemListBtn:SetText("Item List")
frame.itemListBtn:SetNormalFontObject("GameFontNormal")
frame.itemListBtn:SetHighlightFontObject("GameFontHighlight")

-- ==========================================
-- Set Label mode elements (existing)
-- ==========================================
frame.labelText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
frame.labelText:SetPoint("TOPLEFT", frame.setLabelBtn, "BOTTOMLEFT", 0, -10)
frame.labelText:SetText("Raid Label (e.g., 'The Voidspire'):")

frame.labelInput = CreateFrame("EditBox", nil, frame, "InputBoxTemplate")
frame.labelInput:SetSize(400, 30)
frame.labelInput:SetPoint("TOPLEFT", frame.labelText, "BOTTOMLEFT", 5, -5)
frame.labelInput:SetAutoFocus(false)

-- Slot selection label
frame.slotsText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
frame.slotsText:SetPoint("TOPLEFT", frame.labelInput, "BOTTOMLEFT", -5, -15)
frame.slotsText:SetText("Select Inventory Slots:")

-- Create checkboxes for each slot
frame.slotCheckboxes = {}
local lastCheckbox = nil
for i, slotInfo in ipairs(INVENTORY_SLOTS) do
  local checkbox = CreateFrame("CheckButton", nil, frame, "UICheckButtonTemplate")
  checkbox:SetSize(24, 24)
  
  if i == 1 then
    checkbox:SetPoint("TOPLEFT", frame.slotsText, "BOTTOMLEFT", 0, -5)
  elseif i % 2 == 0 then
    checkbox:SetPoint("LEFT", lastCheckbox, "RIGHT", 150, 0)
  else
    checkbox:SetPoint("TOPLEFT", frame.slotCheckboxes[i - 2], "BOTTOMLEFT", 0, -5)
  end
  
  checkbox.text = checkbox:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  checkbox.text:SetPoint("LEFT", checkbox, "RIGHT", 5, 0)
  checkbox.text:SetText(slotInfo.name)
  
  checkbox.slotInfo = slotInfo
  checkbox:SetChecked(true) -- Default to checked
  
  frame.slotCheckboxes[i] = checkbox
  lastCheckbox = checkbox
end

-- Collect all Set Label mode elements for show/hide
frame.setLabelElements = { frame.labelText, frame.labelInput, frame.slotsText }
for _, cb in ipairs(frame.slotCheckboxes) do
  table.insert(frame.setLabelElements, cb)
  table.insert(frame.setLabelElements, cb.text)
end

-- ==========================================
-- Item List mode elements (new)
-- ==========================================
frame.itemListText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
frame.itemListText:SetPoint("TOPLEFT", frame.setLabelBtn, "BOTTOMLEFT", 0, -10)
frame.itemListText:SetText("Paste item list (one per line):")

frame.itemListFormatHint = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
frame.itemListFormatHint:SetPoint("TOPLEFT", frame.itemListText, "BOTTOMLEFT", 0, -3)
frame.itemListFormatHint:SetText("|cff888888Format: itemId, ARMOR_TYPE, SLOT  or  { itemId, \"ARMOR_TYPE\", \"SLOT\" },|r")

frame.itemListScroll = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
frame.itemListScroll:SetPoint("TOPLEFT", frame.itemListFormatHint, "BOTTOMLEFT", 5, -5)
frame.itemListScroll:SetPoint("RIGHT", frame, "RIGHT", -30, 0)
frame.itemListScroll:SetHeight(160)

frame.itemListInput = CreateFrame("EditBox", nil, frame.itemListScroll)
frame.itemListInput:SetMultiLine(true)
frame.itemListInput:SetSize(530, 400)
frame.itemListInput:SetFontObject("ChatFontNormal")
frame.itemListInput:SetAutoFocus(false)
frame.itemListInput:SetScript("OnEscapePressed", function(self)
  self:ClearFocus()
end)
frame.itemListScroll:SetScrollChild(frame.itemListInput)

frame.itemListElements = { frame.itemListText, frame.itemListFormatHint, frame.itemListScroll }

-- Generate button (positioning is set dynamically in SetMode)
frame.generateButton = CreateFrame("Button", nil, frame, "GameMenuButtonTemplate")
frame.generateButton:SetSize(120, 30)
frame.generateButton:SetText("Generate")
frame.generateButton:SetNormalFontObject("GameFontNormal")
frame.generateButton:SetHighlightFontObject("GameFontHighlight")

-- Output label
frame.outputText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
frame.outputText:SetPoint("TOPLEFT", frame.generateButton, "BOTTOMLEFT", 0, -10)
frame.outputText:SetText("Generated Data:")

-- Scrollable output area
frame.outputScroll = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
frame.outputScroll:SetPoint("TOPLEFT", frame.outputText, "BOTTOMLEFT", 5, -5)
frame.outputScroll:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -30, 10)

frame.outputEditBox = CreateFrame("EditBox", nil, frame.outputScroll)
frame.outputEditBox:SetMultiLine(true)
frame.outputEditBox:SetSize(540, 1000)
frame.outputEditBox:SetFontObject("GameFontWhite")
frame.outputEditBox:SetAutoFocus(false)
frame.outputEditBox:SetScript("OnEscapePressed", function(self)
  self:ClearFocus()
end)
frame.outputScroll:SetScrollChild(frame.outputEditBox)

-- Generate button handler
frame.generateButton:SetScript("OnClick", function()
  if frame.currentMode == MODE_ITEM_LIST then
    -- Item List mode
    local text = frame.itemListInput:GetText()
    if not text or text == "" then
      frame.outputEditBox:SetText("Error: Please paste an item list")
      return
    end

    local items = DataGenerator:ParseItemList(text)
    if #items == 0 then
      frame.outputEditBox:SetText("Error: Could not parse any items from the input.\n\nExpected format (one per line):\n  itemId, ARMOR_TYPE, SLOT\n  { itemId, \"ARMOR_TYPE\", \"SLOT\" },")
      return
    end

    local output = DataGenerator:GenerateItemListData(items)
    frame.outputEditBox:SetText(output)
    frame.outputEditBox:HighlightText()
    frame.outputEditBox:SetFocus()
  else
    -- Set Label mode (original behavior)
    local label = frame.labelInput:GetText()
    if not label or label == "" then
      frame.outputEditBox:SetText("Error: Please enter a raid label")
      return
    end

    local selectedSlots = {}
    for _, checkbox in ipairs(frame.slotCheckboxes) do
      if checkbox:GetChecked() then
        table.insert(selectedSlots, checkbox.slotInfo)
      end
    end

    if #selectedSlots == 0 then
      frame.outputEditBox:SetText("Error: Please select at least one inventory slot")
      return
    end

    local output = DataGenerator:GenerateData(label, selectedSlots)
    frame.outputEditBox:SetText(output)
    frame.outputEditBox:HighlightText()
    frame.outputEditBox:SetFocus()
  end
end)

function DataGenerator:GenerateData(label, selectedSlots)
  local templateOutput = {}
  local auditOutput = {}
  local allSets = C_TransmogSets.GetAllSets()
  
  table.insert(templateOutput, string.format("=== Data for '%s' ===", label))
  table.insert(templateOutput, "")
  table.insert(templateOutput, "## TEMPLATE")
  
  for _, setInfo in ipairs(allSets) do
    if setInfo.label == label then
      local _, classFile = GetClassInfo(GetBitPosition(setInfo.classMask) + 1)
      local setName = setInfo.name or "Unknown Set"
      local setDescription = setInfo.description or "Unknown Difficulty"
      
      table.insert(templateOutput, string.format("### %s - %s - %s", classFile, setName, setDescription))
      
      for _, slotInfo in ipairs(selectedSlots) do
        local sources = C_TransmogSets.GetSourcesForSlot(setInfo.setID, slotInfo.id)
        if sources and #sources > 0 then
          local preferredIndex = GetPreferredSourceIndex(sources, setName)
          local source = sources[preferredIndex] or sources[1]
          table.insert(templateOutput, string.format(
            "%s, %d, %d",
            slotInfo.name,
            source.visualID,
            source.sourceID
          ))

          if #sources > 1 then
            table.insert(auditOutput, string.format("### %s - %s - %s - %s", classFile, setName, setDescription, slotInfo.name))
            for sourceIndex, sourceInfo in ipairs(sources) do
              local marker = "[ ]"
              if preferredIndex and sourceIndex == preferredIndex then
                marker = "[X]"
              end
              table.insert(auditOutput, string.format(
                "%s sourceIndex=%d, setID=%d, appearanceID=%d, modID=%d, name=%s",
                marker,
                sourceIndex,
                setInfo.setID,
                sourceInfo.visualID,
                sourceInfo.sourceID,
                sourceInfo.name or "Unknown"
              ))
            end
            table.insert(auditOutput, "")
          end
        else
          table.insert(auditOutput, string.format("### %s - %s - %s - %s", classFile, setName, setDescription, slotInfo.name))
          table.insert(auditOutput, "No sources found")
          table.insert(auditOutput, "")
        end
      end

      table.insert(templateOutput, "")
    end
  end
  
  if #templateOutput == 3 then
    return "No matching sets found for label: " .. label
  end

  local output = {}
  for _, line in ipairs(templateOutput) do
    table.insert(output, line)
  end

  table.insert(output, "")
  table.insert(output, "## AUDIT")
  if #auditOutput == 0 then
    table.insert(output, "No multi-source slots detected.")
  else
    for _, line in ipairs(auditOutput) do
      table.insert(output, line)
    end
  end

  return table.concat(output, "\n")
end

-- ==========================================
-- Item List parsing and data generation
-- ==========================================

--- Parse a multi-line item list into structured entries.
-- Accepts two formats per line:
--   itemId, ARMOR_TYPE, SLOT
--   { itemId, "ARMOR_TYPE", "SLOT" },
-- Lines starting with -- or # are treated as comments and skipped.
function DataGenerator:ParseItemList(text)
  local items = {}
  for line in text:gmatch("[^\r\n]+") do
    -- Strip leading/trailing whitespace
    line = line:match("^%s*(.-)%s*$")
    -- Skip empty lines and comments
    if line ~= "" and not line:match("^%-%-") and not line:match("^#") then
      local itemId, armorType, slot
      -- Try Lua table format: { itemId, "ARMOR_TYPE", "SLOT" },
      itemId, armorType, slot = line:match("{%s*(%d+)%s*,%s*\"(%w+)\"%s*,%s*\"(%w+)\"%s*}")
      if not itemId then
        -- Try simple CSV format: itemId, ARMOR_TYPE, SLOT
        itemId, armorType, slot = line:match("(%d+)%s*,%s*(%w+)%s*,%s*(%w+)")
      end
      if itemId and armorType and slot then
        table.insert(items, {
          itemID = tonumber(itemId),
          armorType = armorType:upper(),
          slot = slot:upper(),
        })
      end
    end
  end
  return items
end

--- Generate appearance data from a list of item entries.
-- Calls C_TransmogCollection.GetItemInfo for each item and builds
-- an ARMOR_TYPE > SLOT > AppearanceID > { modIDs } map.
function DataGenerator:GenerateItemListData(items)
  local map = {}
  local missingItems = {}

  for _, entry in ipairs(items) do
    local appearanceID, modID = C_TransmogCollection.GetItemInfo(entry.itemID)
    if appearanceID then
      if not map[entry.armorType] then map[entry.armorType] = {} end
      if not map[entry.armorType][entry.slot] then map[entry.armorType][entry.slot] = {} end
      if not map[entry.armorType][entry.slot][appearanceID] then
        map[entry.armorType][entry.slot][appearanceID] = {}
      end
      -- Deduplicate modIDs
      local alreadyPresent = false
      for _, existing in ipairs(map[entry.armorType][entry.slot][appearanceID]) do
        if existing == modID then alreadyPresent = true break end
      end
      if not alreadyPresent then
        table.insert(map[entry.armorType][entry.slot][appearanceID], modID)
      end
    else
      table.insert(missingItems, entry.itemID)
    end
  end

  -- Build output in the same format as the one-off DataGen scripts
  local lines = {}
  local ARMOR_ORDER = { "CLOTH", "LEATHER", "MAIL", "PLATE" }
  local SLOT_ORDER = {
    "HELM", "SHOULDERS", "CLOAK", "CHEST", "BELT",
    "BRACERS", "GAUNTLETS", "LEGGINGS", "BOOTS",
  }

  table.insert(lines, "=== Item List Data ===")
  table.insert(lines, "")
  table.insert(lines, "## TEMPLATE")

  local foundAny = false
  for _, armorType in ipairs(ARMOR_ORDER) do
    if map[armorType] then
      foundAny = true
      table.insert(lines, string.format("### %s", armorType))
      for _, slot in ipairs(SLOT_ORDER) do
        if map[armorType][slot] then
          for appearanceID, modIDs in pairs(map[armorType][slot]) do
            table.sort(modIDs)
            local modIDStr = table.concat(modIDs, ", ")
            table.insert(lines, string.format(
              "  %s, %d, { %s }",
              slot, appearanceID, modIDStr
            ))
          end
        end
      end
      table.insert(lines, "")
    end
  end

  if not foundAny then
    table.insert(lines, "No appearance data resolved from the provided items.")
    table.insert(lines, "")
  end

  -- Audit section for items that returned nil from GetItemInfo
  table.insert(lines, "## AUDIT")
  if #missingItems > 0 then
    table.insert(lines, "The following item IDs returned no appearance data:")
    for _, itemID in ipairs(missingItems) do
      table.insert(lines, string.format("  %d", itemID))
    end
  else
    table.insert(lines, "All items resolved successfully.")
  end

  return table.concat(lines, "\n")
end

-- ==========================================
-- Mode switching
-- ==========================================

--- Toggle visibility of UI elements based on the selected mode.
function DataGenerator:SetMode(mode)
  frame.currentMode = mode

  -- Toggle Set Label elements
  for _, element in ipairs(frame.setLabelElements) do
    if mode == MODE_SET_LABEL then
      element:Show()
    else
      element:Hide()
    end
  end

  -- Toggle Item List elements
  for _, element in ipairs(frame.itemListElements) do
    if mode == MODE_ITEM_LIST then
      element:Show()
    else
      element:Hide()
    end
  end

  -- Update button highlighting to indicate active mode
  if mode == MODE_SET_LABEL then
    frame.setLabelBtn:Disable()
    frame.itemListBtn:Enable()
  else
    frame.setLabelBtn:Enable()
    frame.itemListBtn:Disable()
  end

  -- Reanchor generate button based on mode
  frame.generateButton:ClearAllPoints()
  if mode == MODE_SET_LABEL then
    local lastSlotLeftSide = #frame.slotCheckboxes % 2 == 0
      and frame.slotCheckboxes[#frame.slotCheckboxes - 1]
      or frame.slotCheckboxes[#frame.slotCheckboxes]
    frame.generateButton:SetPoint("TOPLEFT", lastSlotLeftSide, "BOTTOMLEFT", 0, -15)
  else
    frame.generateButton:SetPoint("TOPLEFT", frame.itemListScroll, "BOTTOMLEFT", -5, -10)
  end

  -- Clear output when switching modes
  frame.outputEditBox:SetText("")
end

-- Mode button click handlers
frame.setLabelBtn:SetScript("OnClick", function()
  DataGenerator:SetMode(MODE_SET_LABEL)
end)

frame.itemListBtn:SetScript("OnClick", function()
  DataGenerator:SetMode(MODE_ITEM_LIST)
end)

-- Set initial mode
DataGenerator:SetMode(MODE_SET_LABEL)

function DataGenerator:Show()
  frame:Show()
end

-- Slash command
SLASH_TTTGEN1 = "/tttgen"
SlashCmdList["TTTGEN"] = function(msg)
  DataGenerator:Show()
end

print("|cff00ff00TokenTransmogTooltips|r: /tttgen command registered (Alpha)")
--@end-alpha@

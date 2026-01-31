--@alpha@
local addonName, ns = ...

local DataGenerator = {}

-- Inventory slot constants mapped to display names
local INVENTORY_SLOTS = {
  {id = INVSLOT_HEAD, name = "HELM", constant = "INVSLOT_HEAD"},
  {id = INVSLOT_SHOULDER, name = "SHOULDERS", constant = "INVSLOT_SHOULDER"},
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

-- Label input
frame.labelText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
frame.labelText:SetPoint("TOPLEFT", frame.InsetBg or frame, "TOPLEFT", 10, -10)
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

-- Generate button
frame.generateButton = CreateFrame("Button", nil, frame, "GameMenuButtonTemplate")
frame.generateButton:SetSize(120, 30)
frame.generateButton:SetPoint("TOPLEFT", frame.slotCheckboxes[#frame.slotCheckboxes - 1], "BOTTOMLEFT", 0, -15)
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
  local label = frame.labelInput:GetText()
  if not label or label == "" then
    frame.outputEditBox:SetText("Error: Please enter a raid label")
    return
  end
  
  -- Get selected slots
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
  
  -- Generate the data
  local output = DataGenerator:GenerateData(label, selectedSlots)
  frame.outputEditBox:SetText(output)
  frame.outputEditBox:HighlightText()
  frame.outputEditBox:SetFocus()
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

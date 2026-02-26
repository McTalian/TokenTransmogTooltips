-- BenthicDataGen.lua
-- Paste into a Lua executor in-game (e.g. /run or an addon like Wowlua)
-- Calls C_TransmogCollection.GetItemInfo for each Benthic result item and
-- builds an ARMOR_TYPE > SLOT > AppearanceID > { modID, ... } map, then
-- displays the result in a copyable window.

local ITEMS = {
  -- { itemId, armorType, slot }
  -- HELM
  { 167778, "PLATE",   "HELM" },
  { 167754, "CLOTH",   "HELM" },
  { 167762, "LEATHER", "HELM" },
  { 167770, "MAIL",    "HELM" },
  -- SHOULDERS
  { 167781, "PLATE",   "SHOULDERS" },
  { 167764, "LEATHER", "SHOULDERS" },
  { 167756, "CLOTH",   "SHOULDERS" },
  { 167772, "MAIL",    "SHOULDERS" },
  -- CLOAK (categorized by armor set family)
  { 169487, "LEATHER", "CLOAK" },  -- Fathomstalker Cloak
  { 169488, "PLATE",   "CLOAK" },  -- Zanj'ir Scaleguard Greatcloak
  { 169486, "CLOTH",   "CLOAK" },  -- Shirakess Drape
  { 169489, "MAIL",    "CLOAK" },  -- Azsh'ari Stormsurger Cape
  -- CHEST
  { 167775, "PLATE",   "CHEST" },
  { 167767, "MAIL",    "CHEST" },
  { 167759, "LEATHER", "CHEST" },
  { 167779, "CLOTH",   "CHEST" },
  -- BELT
  { 170367, "CLOTH",   "BELT" },
  { 170368, "LEATHER", "BELT" },
  { 167782, "PLATE",   "BELT" },
  { 167765, "LEATHER", "BELT" },
  { 170369, "MAIL",    "BELT" },
  { 170370, "PLATE",   "BELT" },
  { 167757, "CLOTH",   "BELT" },
  { 167773, "MAIL",    "BELT" },
  -- GAUNTLETS
  { 167761, "LEATHER", "GAUNTLETS" },
  { 169791, "LEATHER", "GAUNTLETS" },
  { 170333, "CLOTH",   "GAUNTLETS" },
  { 170135, "MAIL",    "GAUNTLETS" },
  { 170134, "LEATHER", "GAUNTLETS" },
  { 170376, "LEATHER", "GAUNTLETS" },
  { 167753, "CLOTH",   "GAUNTLETS" },
  { 170378, "PLATE",   "GAUNTLETS" },
  { 170377, "MAIL",    "GAUNTLETS" },
  { 170334, "LEATHER", "GAUNTLETS" },
  { 170136, "PLATE",   "GAUNTLETS" },
  { 170133, "CLOTH",   "GAUNTLETS" },
  { 170335, "MAIL",    "GAUNTLETS" },
  { 170336, "PLATE",   "GAUNTLETS" },
  { 167777, "PLATE",   "GAUNTLETS" },
  { 169793, "PLATE",   "GAUNTLETS" },
  { 169792, "MAIL",    "GAUNTLETS" },
  { 170375, "CLOTH",   "GAUNTLETS" },
  { 167769, "MAIL",    "GAUNTLETS" },
  { 169790, "CLOTH",   "GAUNTLETS" },
  -- BRACERS
  { 167758, "CLOTH",   "BRACERS" },
  { 170123, "CLOTH",   "BRACERS" },
  { 170103, "CLOTH",   "BRACERS" },
  { 170306, "CLOTH",   "BRACERS" },
  { 169812, "CLOTH",   "BRACERS" },
  { 170331, "CLOTH",   "BRACERS" },
  { 170122, "LEATHER", "BRACERS" },
  { 170104, "LEATHER", "BRACERS" },
  { 167766, "LEATHER", "BRACERS" },
  { 169815, "PLATE",   "BRACERS" },
  { 170106, "PLATE",   "BRACERS" },
  { 170328, "PLATE",   "BRACERS" },
  { 170330, "LEATHER", "BRACERS" },
  { 170304, "MAIL",    "BRACERS" },
  { 167774, "MAIL",    "BRACERS" },
  { 170111, "PLATE",   "BRACERS" },
  { 170303, "PLATE",   "BRACERS" },
  { 169813, "LEATHER", "BRACERS" },
  { 170105, "MAIL",    "BRACERS" },
  { 170121, "MAIL",    "BRACERS" },
  { 170305, "LEATHER", "BRACERS" },
  { 169814, "MAIL",    "BRACERS" },
  { 167783, "PLATE",   "BRACERS" },
  { 170329, "MAIL",    "BRACERS" },
  -- LEGGINGS
  { 170110, "PLATE",   "LEGGINGS" },
  { 169811, "PLATE",   "LEGGINGS" },
  { 169810, "MAIL",    "LEGGINGS" },
  { 167780, "PLATE",   "LEGGINGS" },
  { 169809, "LEATHER", "LEGGINGS" },
  { 170108, "LEATHER", "LEGGINGS" },
  { 169808, "CLOTH",   "LEGGINGS" },
  { 167763, "LEATHER", "LEGGINGS" },
  { 167771, "MAIL",    "LEGGINGS" },
  { 170107, "CLOTH",   "LEGGINGS" },
  { 170109, "MAIL",    "LEGGINGS" },
  { 167755, "CLOTH",   "LEGGINGS" },
  -- BOOTS
  { 170371, "CLOTH",   "BOOTS" },
  { 170140, "CLOTH",   "BOOTS" },
  { 167752, "CLOTH",   "BOOTS" },
  { 170374, "PLATE",   "BOOTS" },
  { 167760, "LEATHER", "BOOTS" },
  { 169893, "LEATHER", "BOOTS" },
  { 169894, "CLOTH",   "BOOTS" },
  { 167776, "PLATE",   "BOOTS" },
  { 170143, "PLATE",   "BOOTS" },
  { 170141, "LEATHER", "BOOTS" },
  { 170142, "MAIL",    "BOOTS" },
  { 170372, "LEATHER", "BOOTS" },
  { 169891, "PLATE",   "BOOTS" },
  { 169892, "MAIL",    "BOOTS" },
  { 167768, "MAIL",    "BOOTS" },
  { 170373, "MAIL",    "BOOTS" },
}

-- map[armorType][slot][appearanceID] = { modID, ... }
local map = {}

for _, entry in ipairs(ITEMS) do
  local itemID, armorType, slot = entry[1], entry[2], entry[3]
  local appearanceID, modID = C_TransmogCollection.GetItemInfo(itemID)
  if appearanceID then
    if not map[armorType] then map[armorType] = {} end
    if not map[armorType][slot] then map[armorType][slot] = {} end
    if not map[armorType][slot][appearanceID] then map[armorType][slot][appearanceID] = {} end
    -- Only add modID if not already present
    local alreadyPresent = false
    for _, existing in ipairs(map[armorType][slot][appearanceID]) do
      if existing == modID then alreadyPresent = true; break end
    end
    if not alreadyPresent then
      table.insert(map[armorType][slot][appearanceID], modID)
    end
  end
end

-- Build output text
local lines = {}
local ARMOR_ORDER = { "CLOTH", "LEATHER", "MAIL", "PLATE" }
local SLOT_ORDER  = { "HELM", "SHOULDERS", "CLOAK", "CHEST", "BELT", "BRACERS", "GAUNTLETS", "LEGGINGS", "BOOTS" }

for _, armorType in ipairs(ARMOR_ORDER) do
  if map[armorType] then
    table.insert(lines, "### " .. armorType)
    for _, slot in ipairs(SLOT_ORDER) do
      if map[armorType][slot] then
        for appearanceID, modIDs in pairs(map[armorType][slot]) do
          -- Sort modIDs for deterministic output
          table.sort(modIDs)
          local modIDStr = table.concat(modIDs, ", ")
          table.insert(lines, string.format("  %s, %d, { %s }", slot, appearanceID, modIDStr))
        end
      end
    end
    table.insert(lines, "")
  end
end

local output = table.concat(lines, "\n")

-- Display in a copyable window
local f = CreateFrame("Frame", "BenthicDataGenFrame", UIParent, "BasicFrameTemplateWithInset")
f:SetSize(620, 520)
f:SetPoint("CENTER")
f:SetMovable(true)
f:EnableMouse(true)
f:RegisterForDrag("LeftButton")
f:SetScript("OnDragStart", f.StartMoving)
f:SetScript("OnDragStop", f.StopMovingOrSizing)
f:SetFrameStrata("DIALOG")

f.title = f:CreateFontString(nil, "OVERLAY")
f.title:SetFontObject("GameFontHighlight")
f.title:SetPoint("LEFT", f.TitleBg, "LEFT", 5, 0)
f.title:SetText("Benthic Appearance Data")

local scroll = CreateFrame("ScrollFrame", nil, f, "UIPanelScrollFrameTemplate")
scroll:SetPoint("TOPLEFT", f.InsetBg or f, "TOPLEFT", 5, -5)
scroll:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -28, 8)

local editBox = CreateFrame("EditBox", nil, scroll)
editBox:SetMultiLine(true)
editBox:SetSize(570, 1200)
editBox:SetFontObject("GameFontWhite")
editBox:SetAutoFocus(true)
editBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
scroll:SetScrollChild(editBox)

editBox:SetText(output)
editBox:HighlightText()

f:Show()

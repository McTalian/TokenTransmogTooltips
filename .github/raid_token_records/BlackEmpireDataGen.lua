-- BlackEmpireDataGen.lua
-- Paste into a Lua executor in-game (e.g. /run or an addon like Wowlua)
-- Calls C_TransmogCollection.GetItemInfo for each Black Empire result item and
-- builds an ARMOR_TYPE > SLOT > AppearanceID > { modID, ... } map, then
-- displays the result in a copyable window.

local ITEMS = {
  -- { itemId, armorType, slot }
  -- HELM
  { 173433, "CLOTH",    "HELM" },  -- Vile Manipulator's Cowl
  { 173845, "CLOTH",    "HELM" },  -- Vile Manipulator's Hood
  { 173441, "LEATHER",  "HELM" },  -- Guise of the Insatiable Maw
  { 173842, "LEATHER",  "HELM" },  -- Visage of the Insatiable Maw
  { 173449, "MAIL",     "HELM" },  -- Nefarious Tormentor's Mask
  { 173839, "MAIL",     "HELM" },  -- Nefarious Tormentor's Cover
  { 173457, "PLATE",    "HELM" },  -- Malignant Leviathan's Headguard
  { 173836, "PLATE",    "HELM" },  -- Malignant Leviathan's Helm
  -- SHOULDERS
  { 173435, "CLOTH",    "SHOULDERS" },  -- Vile Manipulator's Mantle
  { 173844, "CLOTH",    "SHOULDERS" },  -- Vile Manipulator's Amice
  { 173443, "LEATHER",  "SHOULDERS" },  -- Shoulderpads of the Insatiable Maw
  { 173841, "LEATHER",  "SHOULDERS" },  -- Mantle of the Insatiable Maw
  { 173451, "MAIL",     "SHOULDERS" },  -- Nefarious Tormentor's Spaulders
  { 173838, "MAIL",     "SHOULDERS" },  -- Nefarious Tormentor's Epaulets
  { 173460, "PLATE",    "SHOULDERS" },  -- Malignant Leviathan's Spaulders
  { 173835, "PLATE",    "SHOULDERS" },  -- Malignant Leviathan's Pauldrons
  -- CHEST
  { 173458, "CLOTH",    "CHEST" },  -- Vile Manipulator's Robe
  { 173846, "CLOTH",    "CHEST" },  -- Vile Manipulator's Vestment
  { 173438, "LEATHER",  "CHEST" },  -- Chestguard of the Insatiable Maw
  { 173843, "LEATHER",  "CHEST" },  -- Vest of the Insatiable Maw
  { 173446, "MAIL",     "CHEST" },  -- Nefarious Tormentor's Breastplate
  { 173840, "MAIL",     "CHEST" },  -- Nefarious Tormentor's Chestpiece
  { 173454, "PLATE",    "CHEST" },  -- Malignant Leviathan's Chestplate
  { 173837, "PLATE",    "CHEST" },  -- Malignant Leviathan's Hauberk
  -- BELT
  { 173436, "CLOTH",    "BELT" },  -- Vile Manipulator's Cinch
  { 173511, "CLOTH",    "BELT" },  -- Vile Manipulator's Belt
  { 173812, "CLOTH",    "BELT" },  -- Vile Manipulator's Cord
  { 173813, "CLOTH",    "BELT" },  -- Vile Manipulator's Girdle
  { 173444, "LEATHER",  "BELT" },  -- Waistguard of the Insatiable Maw
  { 173512, "LEATHER",  "BELT" },  -- Grasp of the Insatiable Maw
  { 173815, "LEATHER",  "BELT" },  -- Girdle of the Insatiable Maw
  { 173816, "LEATHER",  "BELT" },  -- Belt of the Insatiable Maw
  { 173452, "MAIL",     "BELT" },  -- Nefarious Tormentor's Belt
  { 173513, "MAIL",     "BELT" },  -- Nefarious Tormentor's Chain
  { 173818, "MAIL",     "BELT" },  -- Nefarious Tormentor's Girdle
  { 173819, "MAIL",     "BELT" },  -- Nefarious Tormentor's Waistguard
  { 173461, "PLATE",    "BELT" },  -- Malignant Leviathan's Greatbelt
  { 173514, "PLATE",    "BELT" },  -- Malignant Leviathan's Girdle
  { 173821, "PLATE",    "BELT" },  -- Malignant Leviathan's Clasp
  { 173822, "PLATE",    "BELT" },  -- Malignant Leviathan's Waistguard
  -- BRACERS
  { 173437, "CLOTH",    "BRACERS" },  -- Vile Manipulator's Wristwraps
  { 173471, "CLOTH",    "BRACERS" },  -- Vile Manipulator's Cuffs
  { 173479, "CLOTH",    "BRACERS" },  -- Vile Manipulator's Armwraps
  { 173490, "CLOTH",    "BRACERS" },  -- Vile Manipulator's Bracelets
  { 173445, "LEATHER",  "BRACERS" },  -- Wristwraps of the Insatiable Maw
  { 173472, "LEATHER",  "BRACERS" },  -- Armguards of the Insatiable Maw
  { 173480, "LEATHER",  "BRACERS" },  -- Bindings of the Insatiable Maw
  { 173489, "LEATHER",  "BRACERS" },  -- Coils of the Insatiable Maw
  { 173453, "MAIL",     "BRACERS" },  -- Nefarious Tormentor's Vambraces
  { 173473, "MAIL",     "BRACERS" },  -- Nefarious Tormentor's Bracers
  { 173481, "MAIL",     "BRACERS" },  -- Nefarious Tormentor's Bindings
  { 173488, "MAIL",     "BRACERS" },  -- Nefarious Tormentor's Armwraps
  { 173462, "PLATE",    "BRACERS" },  -- Malignant Leviathan's Armguards
  { 173474, "PLATE",    "BRACERS" },  -- Malignant Leviathan's Vambraces
  { 173482, "PLATE",    "BRACERS" },  -- Malignant Leviathan's Wristguards
  { 173487, "PLATE",    "BRACERS" },  -- Malignant Leviathan's Coils
  -- GAUNTLETS
  { 173432, "CLOTH",    "GAUNTLETS" },  -- Vile Manipulator's Handwraps
  { 173463, "CLOTH",    "GAUNTLETS" },  -- Vile Manipulator's Gloves
  { 173491, "CLOTH",    "GAUNTLETS" },  -- Vile Manipulator's Grips
  { 173507, "CLOTH",    "GAUNTLETS" },  -- Vile Manipulator's Handguards
  { 173440, "LEATHER",  "GAUNTLETS" },  -- Grips of the Insatiable Maw
  { 173464, "LEATHER",  "GAUNTLETS" },  -- Gloves of the Insatiable Maw
  { 173492, "LEATHER",  "GAUNTLETS" },  -- Handwraps of the Insatiable Maw
  { 173508, "LEATHER",  "GAUNTLETS" },  -- Handguards of the Insatiable Maw
  { 173448, "MAIL",     "GAUNTLETS" },  -- Nefarious Tormentor's Handguards
  { 173465, "MAIL",     "GAUNTLETS" },  -- Nefarious Tormentor's Gloves
  { 173493, "MAIL",     "GAUNTLETS" },  -- Nefarious Tormentor's Handwraps
  { 173509, "MAIL",     "GAUNTLETS" },  -- Nefarious Tormentor's Handgrips
  { 173456, "PLATE",    "GAUNTLETS" },  -- Malignant Leviathan's Crushers
  { 173466, "PLATE",    "GAUNTLETS" },  -- Malignant Leviathan's Gauntlets
  { 173494, "PLATE",    "GAUNTLETS" },  -- Malignant Leviathan's Fists
  { 173510, "PLATE",    "GAUNTLETS" },  -- Malignant Leviathan's Handguards
  -- LEGGINGS
  { 173434, "CLOTH",    "LEGGINGS" },  -- Vile Manipulator's Leggings
  { 173467, "CLOTH",    "LEGGINGS" },  -- Vile Manipulator's Legwraps
  { 173483, "CLOTH",    "LEGGINGS" },  -- Vile Manipulator's Pants
  { 173811, "CLOTH",    "LEGGINGS" },  -- Vile Manipulator's Trousers
  { 173442, "LEATHER",  "LEGGINGS" },  -- Legwraps of the Insatiable Maw
  { 173468, "LEATHER",  "LEGGINGS" },  -- Leggings of the Insatiable Maw
  { 173484, "LEATHER",  "LEGGINGS" },  -- Breeches of the Insatiable Maw
  { 173814, "LEATHER",  "LEGGINGS" },  -- Trousers of the Insatiable Maw
  { 173450, "MAIL",     "LEGGINGS" },  -- Nefarious Tormentor's Legguards
  { 173469, "MAIL",     "LEGGINGS" },  -- Nefarious Tormentor's Greaves
  { 173485, "MAIL",     "LEGGINGS" },  -- Nefarious Tormentor's Leggings
  { 173817, "MAIL",     "LEGGINGS" },  -- Nefarious Tormentor's Trousers
  { 173459, "PLATE",    "LEGGINGS" },  -- Malignant Leviathan's Wargreaves
  { 173470, "PLATE",    "LEGGINGS" },  -- Malignant Leviathan's Legguards
  { 173486, "PLATE",    "LEGGINGS" },  -- Malignant Leviathan's Legplates
  { 173820, "PLATE",    "LEGGINGS" },  -- Malignant Leviathan's Greaves
  -- BOOTS
  { 173431, "CLOTH",    "BOOTS" },  -- Vile Manipulator's Footwraps
  { 173478, "CLOTH",    "BOOTS" },  -- Vile Manipulator's Treads
  { 173495, "CLOTH",    "BOOTS" },  -- Vile Manipulator's Soles
  { 173515, "CLOTH",    "BOOTS" },  -- Vile Manipulator's Slippers
  { 173439, "LEATHER",  "BOOTS" },  -- Footpads of the Insatiable Maw
  { 173477, "LEATHER",  "BOOTS" },  -- Boots of the Insatiable Maw
  { 173496, "LEATHER",  "BOOTS" },  -- Footwraps of the Insatiable Maw
  { 173516, "LEATHER",  "BOOTS" },  -- Footguards of the Insatiable Maw
  { 173447, "MAIL",     "BOOTS" },  -- Nefarious Tormentor's Footguards
  { 173476, "MAIL",     "BOOTS" },  -- Nefarious Tormentor's Boots
  { 173497, "MAIL",     "BOOTS" },  -- Nefarious Tormentor's Treads
  { 173517, "MAIL",     "BOOTS" },  -- Nefarious Tormentor's Striders
  { 173455, "PLATE",    "BOOTS" },  -- Malignant Leviathan's Stompers
  { 173475, "PLATE",    "BOOTS" },  -- Malignant Leviathan's Warboots
  { 173498, "PLATE",    "BOOTS" },  -- Malignant Leviathan's Boots
  { 173518, "PLATE",    "BOOTS" },  -- Malignant Leviathan's Sabatons
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
local SLOT_ORDER  = { "HELM", "SHOULDERS", "CHEST", "BELT", "BRACERS", "GAUNTLETS", "LEGGINGS", "BOOTS" }

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
local f = CreateFrame("Frame", "BlackEmpireDataGenFrame", UIParent, "BasicFrameTemplateWithInset")
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
f.title:SetText("Black Empire Appearance Data")

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

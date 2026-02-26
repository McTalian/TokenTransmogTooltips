--- Core.lua unit tests.
---
--- Tests the tooltip logic: GetTooltipInfo, class grouping, "and X more",
--- faction branching, difficulty resolution, and edge cases.
--- WoW APIs are stubbed so tests run without the game client.

-- =========================================================================
-- WoW API stubs
-- =========================================================================

-- Frame stub returned by CreateFrame
local frameStub = {
  RegisterEvent = function() end,
  SetScript = function() end,
}

-- The TTT frame reference, captured when Core.lua calls CreateFrame
local TTT

_G.CreateFrame = function(frameType, name)
  -- Core.lua assigns methods to the frame, so we return a real table
  TTT = setmetatable({}, { __index = frameStub })
  return TTT
end

_G.CreateAtlasMarkup = function(atlas, w, h)
  return "[" .. atlas .. "]"
end

-- LinkUtil stubs
_G.LinkUtil = {
  ExtractLink = function(link)
    -- Return linkType, linkOptions, displayText
    -- Parse our test links: "|Hitem:ID:...|h[Name]|h"
    local linkType = link:match("|H(%w+):")
    local linkOptions = link:match("|H%w+:([^|]+)|h")
    local displayText = link:match("|h%[([^%]]+)%]|h") or ""
    return linkType or "item", linkOptions or "", displayText
  end,
  SplitLinkOptions = function(linkOptions)
    -- Split colon-delimited options; return varargs
    local parts = {}
    for part in (linkOptions .. ":"):gmatch("([^:]*):") do
      table.insert(parts, part)
    end
    return unpack(parts)
  end,
}

_G.GetItemInfoFromHyperlink = function(link)
  local id = link:match("|Hitem:(%d+)")
  return tonumber(id)
end

_G.UnitFactionGroup = function()
  return "Alliance"
end

-- Transmog API stubs — overridden per-test via spy/stub
_G.C_TransmogCollection = {
  GetAllAppearanceSources = function(appearanceId)
    return { appearanceId * 10 } -- default: return one source
  end,
  PlayerHasTransmogItemModifiedAppearance = function(modId)
    return false -- default: not collected
  end,
  GetAppearanceSourceInfo = function(modId)
    return {
      itemLink = "|Hitem:" .. modId .. "::::::::::::|h[Test Item " .. modId .. "]|h",
      itemAppearanceID = math.floor(modId / 10),
    }
  end,
}

-- Color / constant stubs
_G.GREEN_FONT_COLOR = {
  WrapTextInColorCode = function(self, text)
    return "|cff00ff00" .. text .. "|r"
  end,
}
_G.COLLECTED = "Collected"
_G.TokenTransmogTooltipsDB = {}

-- =========================================================================
-- Load Core.lua
-- =========================================================================

local ns = {
  shadowlandsMultiClassLookup = {},
  tokenClassAppearanceModInfo = {},
}

local fn, err = loadfile("TokenTransmogTooltips/Core.lua")
assert(fn, "Failed to load Core.lua: " .. tostring(err))
fn("TokenTransmogTooltips", ns)

-- =========================================================================
-- Helpers
-- =========================================================================

--- Build a minimal item link for testing.
--- @param itemId number
--- @param itemContext number|nil (defaults to 0)
--- @return string
local function makeLink(itemId, itemContext)
  -- 12th colon-delimited field is itemContext
  local parts = {}
  for i = 1, 12 do
    if i == 1 then
      parts[i] = tostring(itemId)
    elseif i == 12 then
      parts[i] = tostring(itemContext or 0)
    else
      parts[i] = ""
    end
  end
  local opts = table.concat(parts, ":")
  return "|Hitem:" .. opts .. "|h[Token " .. itemId .. "]|h"
end

--- Count tooltip lines that are NOT debug lines (itemId/itemContext).
local function contentLines(tooltipInfo)
  local lines = {}
  for _, info in ipairs(tooltipInfo) do
    if info.leftText ~= "itemId:" and info.leftText ~= "itemContext:" then
      table.insert(lines, info)
    end
  end
  return lines
end

-- =========================================================================
-- Tests
-- =========================================================================

describe("Core.lua GetTooltipInfo", function()

  before_each(function()
    -- Reset stubs to defaults
    _G.TokenTransmogTooltipsDB = {}
    _G.C_TransmogCollection.PlayerHasTransmogItemModifiedAppearance = function() return false end
    _G.C_TransmogCollection.GetAllAppearanceSources = function(appId) return { appId * 10 } end
    _G.C_TransmogCollection.GetAppearanceSourceInfo = function(modId)
      if type(modId) ~= "number" then return nil end
      return {
        itemLink = "|Hitem:" .. modId .. "::::::::::::|h[Test Item " .. modId .. "]|h",
        itemAppearanceID = math.floor(modId / 10),
      }
    end
    _G.UnitFactionGroup = function() return "Alliance" end
    ns.tokenClassAppearanceModInfo = {}
  end)

  describe("edge cases", function()
    it("returns nil, false for nil link", function()
      local info, received = TTT:GetTooltipInfo(nil)
      assert.is_nil(info)
      assert.is_false(received)
    end)

    it("returns empty info and true for unknown token", function()
      local link = makeLink(99999)
      local info, received = TTT:GetTooltipInfo(link)
      assert.is_table(info)
      assert.is_true(received)
      assert.are.equal(0, #contentLines(info))
    end)
  end)

  describe("flat token data (no Difficulties)", function()
    it("shows missing items for uncollected appearances", function()
      ns.tokenClassAppearanceModInfo[100] = {
        ["WARRIOR"] = { [500] = { 5001, } },
      }

      local info, received = TTT:GetTooltipInfo(makeLink(100))
      assert.is_true(received)
      local lines = contentLines(info)
      assert.are.equal(1, #lines)
      assert.truthy(lines[1].leftText:find("WARRIOR"))
      assert.truthy(lines[1].rightText:find("Test Item"))
    end)

    it("shows Collected for fully collected appearances", function()
      _G.C_TransmogCollection.PlayerHasTransmogItemModifiedAppearance = function() return true end

      ns.tokenClassAppearanceModInfo[100] = {
        ["MAGE"] = { [600] = { 6001, } },
      }

      local info, received = TTT:GetTooltipInfo(makeLink(100))
      assert.is_true(received)
      local lines = contentLines(info)
      assert.are.equal(1, #lines)
      assert.truthy(lines[1].rightText:find("Collected"))
    end)

    it("shows multiple classes on separate rows when appearances differ", function()
      ns.tokenClassAppearanceModInfo[100] = {
        ["WARRIOR"] = { [500] = { 5001, } },
        ["MAGE"] = { [600] = { 6001, } },
      }

      local info, received = TTT:GetTooltipInfo(makeLink(100))
      assert.is_true(received)
      local lines = contentLines(info)
      assert.are.equal(2, #lines)
    end)
  end)

  describe("class grouping (shared appearances)", function()
    it("groups classes with identical appearance fingerprints into one row", function()
      -- Both MAGE and PRIEST share the same appearanceID
      local sharedAppearance = { [500] = { 5001, } }
      ns.tokenClassAppearanceModInfo[100] = {
        ["MAGE"] = sharedAppearance,
        ["PRIEST"] = sharedAppearance,
      }

      local info, received = TTT:GetTooltipInfo(makeLink(100))
      assert.is_true(received)
      local lines = contentLines(info)
      -- Should be 1 row with both class icons, not 2 rows
      assert.are.equal(1, #lines)
      assert.truthy(lines[1].leftText:find("MAGE"))
      assert.truthy(lines[1].leftText:find("PRIEST"))
    end)

    it("keeps classes with different appearances on separate rows", function()
      ns.tokenClassAppearanceModInfo[100] = {
        ["MAGE"] = { [500] = { 5001, } },
        ["WARRIOR"] = { [600] = { 6001, } },
      }

      local info, received = TTT:GetTooltipInfo(makeLink(100))
      assert.is_true(received)
      local lines = contentLines(info)
      assert.are.equal(2, #lines)
    end)
  end)

  describe("'and X more' display", function()
    it("shows 'and X more' when modIDs has multiple entries", function()
      ns.tokenClassAppearanceModInfo[100] = {
        ["WARRIOR"] = { [500] = { 5001, 5002, 5003, } },
      }

      local info, received = TTT:GetTooltipInfo(makeLink(100))
      assert.is_true(received)
      local lines = contentLines(info)
      assert.are.equal(1, #lines)
      assert.truthy(lines[1].rightText:find("and 2 more"))
    end)

    it("does not show 'and X more' for single modID", function()
      ns.tokenClassAppearanceModInfo[100] = {
        ["WARRIOR"] = { [500] = { 5001, } },
      }

      local info, received = TTT:GetTooltipInfo(makeLink(100))
      assert.is_true(received)
      local lines = contentLines(info)
      assert.are.equal(1, #lines)
      assert.falsy(lines[1].rightText:find("and %d+ more"))
    end)
  end)

  describe("difficulty resolution", function()
    it("selects the correct difficulty via itemContext", function()
      ns.tokenClassAppearanceModInfo[100] = {
        Difficulties = {
          [15] = { -- RaidNormal
            ["WARRIOR"] = { [500] = { 5001, } },
          },
          [16] = { -- RaidHeroic
            ["WARRIOR"] = { [700] = { 7001, } },
          },
        },
      }

      -- itemContext = 16 (Heroic)
      local info, received = TTT:GetTooltipInfo(makeLink(100, 16))
      assert.is_true(received)
      local lines = contentLines(info)
      assert.are.equal(1, #lines)
      -- modId 7001 means the Heroic data was selected
      assert.truthy(lines[1].rightText:find("7001"))
    end)

    it("falls back to full tokenData when itemContext is 0", function()
      -- Token with Difficulties but itemContext = 0: the code does not
      -- resolve a difficulty, so tokenData still has the Difficulties key.
      -- This means no class keys at the top level, so no rows are added.
      -- We just need to verify it doesn't crash.
      ns.tokenClassAppearanceModInfo[100] = {
        Difficulties = {
          [15] = {
            ["WARRIOR"] = { [500] = { 5001, } },
          },
        },
      }

      local info, received = TTT:GetTooltipInfo(makeLink(100, 0))
      assert.is_table(info)
      -- No class keys at top level → no content rows, and the Difficulties
      -- table is iterated but not matched as a class key, so behavior
      -- depends on validateClassData tolerance. Just confirm no crash.
    end)
  end)

  describe("faction branching", function()
    it("selects Alliance data for Alliance players", function()
      _G.UnitFactionGroup = function() return "Alliance" end

      ns.tokenClassAppearanceModInfo[100] = {
        ["ALLIANCE"] = {
          ["WARRIOR"] = { [500] = { 5001, } },
        },
        ["HORDE"] = {
          ["WARRIOR"] = { [600] = { 6001, } },
        },
      }

      local info, received = TTT:GetTooltipInfo(makeLink(100))
      assert.is_true(received)
      local lines = contentLines(info)
      assert.are.equal(1, #lines)
      assert.truthy(lines[1].rightText:find("5001"))
    end)

    it("selects Horde data for Horde players", function()
      _G.UnitFactionGroup = function() return "Horde" end

      ns.tokenClassAppearanceModInfo[100] = {
        ["ALLIANCE"] = {
          ["WARRIOR"] = { [500] = { 5001, } },
        },
        ["HORDE"] = {
          ["WARRIOR"] = { [600] = { 6001, } },
        },
      }

      local info, received = TTT:GetTooltipInfo(makeLink(100))
      assert.is_true(received)
      local lines = contentLines(info)
      assert.are.equal(1, #lines)
      assert.truthy(lines[1].rightText:find("6001"))
    end)

    it("returns early for neutral faction (Pandaren)", function()
      _G.UnitFactionGroup = function() return "Neutral" end

      ns.tokenClassAppearanceModInfo[100] = {
        ["ALLIANCE"] = {
          ["WARRIOR"] = { [500] = { 5001, } },
        },
        ["HORDE"] = {
          ["WARRIOR"] = { [600] = { 6001, } },
        },
      }

      local info, received = TTT:GetTooltipInfo(makeLink(100))
      assert.is_true(received)
      assert.are.equal(0, #contentLines(info))
    end)
  end)

  describe("async link loading", function()
    it("returns linksReceived=false when GetAllAppearanceSources returns empty", function()
      _G.C_TransmogCollection.GetAllAppearanceSources = function() return {} end

      ns.tokenClassAppearanceModInfo[100] = {
        ["WARRIOR"] = { [500] = { 5001, } },
      }

      local info, received = TTT:GetTooltipInfo(makeLink(100))
      assert.is_false(received)
    end)

    it("returns linksReceived=false when GetAppearanceSourceInfo returns nil", function()
      _G.C_TransmogCollection.GetAppearanceSourceInfo = function() return nil end

      ns.tokenClassAppearanceModInfo[100] = {
        ["WARRIOR"] = { [500] = { 5001, } },
      }

      local info, received = TTT:GetTooltipInfo(makeLink(100))
      assert.is_false(received)
    end)

    it("returns linksReceived=false when item link has empty displayText", function()
      _G.C_TransmogCollection.GetAppearanceSourceInfo = function(modId)
        return { itemLink = "|Hitem:" .. modId .. "::::::::::::|h[]|h" }
      end

      ns.tokenClassAppearanceModInfo[100] = {
        ["WARRIOR"] = { [500] = { 5001, } },
      }

      local info, received = TTT:GetTooltipInfo(makeLink(100))
      assert.is_false(received)
    end)
  end)

  describe("mixed collected and missing", function()
    it("shows only missing appearances when some are collected", function()
      -- In AllSourcesMode, the modIds from the data are used directly as sources
      _G.TokenTransmogTooltipsDB = { AllSourcesMode = true }
      local collected = { [5001] = true }
      _G.C_TransmogCollection.PlayerHasTransmogItemModifiedAppearance = function(modId)
        return collected[modId] == true
      end

      ns.tokenClassAppearanceModInfo[100] = {
        ["WARRIOR"] = {
          [500] = { 5001, },  -- collected (modId 5001 is in collected set)
          [600] = { 6001, },  -- not collected
        },
      }

      local info, received = TTT:GetTooltipInfo(makeLink(100))
      assert.is_true(received)
      local lines = contentLines(info)
      assert.are.equal(1, #lines)
      -- Should show the missing item (6001), not collected
      assert.truthy(lines[1].rightText:find("6001"))
      assert.falsy(lines[1].rightText:find("Collected"))
    end)
  end)
end)

--- Data model integrity tests.
---
--- Loads ALL raid data via the XML-driven loader and validates that every
--- token, appearance, and modID conforms to the expected structure.
--- These tests catch corruption before it reaches players.

local loader = require("TokenTransmogTooltips_spec._mocks.data_loader")

-- Valid WoW class file names (used as keys in token data)
local VALID_CLASSES = {
  DEATHKNIGHT = true,
  DEMONHUNTER = true,
  DRUID = true,
  EVOKER = true,
  HUNTER = true,
  MAGE = true,
  MONK = true,
  PALADIN = true,
  PRIEST = true,
  ROGUE = true,
  SHAMAN = true,
  WARLOCK = true,
  WARRIOR = true,
}

-- Multi-class group keys from shadowlandsMultiClassLookup and armor-type tokens
local VALID_GROUP_KEYS = {
  -- Shadowlands / Dragonflight era token groups
  MYSTIC = true,
  ZENITH = true,
  VENERATED = true,
  ABOMINABLE = true,
  DREADFUL = true,
  APOGEE = true,
  THAUMATURGIC = true,
  -- Armor type keys (Benthic, ForbiddenReach, etc.)
  CLOTH = true,
  LEATHER = true,
  MAIL = true,
  PLATE = true,
}

-- All valid keys that can appear as "class-level" entries in token data
local VALID_CLASS_OR_GROUP_KEYS = {}
for k in pairs(VALID_CLASSES) do VALID_CLASS_OR_GROUP_KEYS[k] = true end
for k in pairs(VALID_GROUP_KEYS) do VALID_CLASS_OR_GROUP_KEYS[k] = true end

-- Faction keys used in faction-specific tokens
local FACTION_KEYS = { ALLIANCE = true, HORDE = true }

-- Build a reverse lookup of Enum.ItemCreationContext values
local VALID_DIFFICULTY_CONTEXTS = {}
for name, value in pairs(Enum.ItemCreationContext) do
  VALID_DIFFICULTY_CONTEXTS[value] = name
end

--- Validate a class appearance table: { [appearanceID] = { modID, ... }, ... }
--- @param appearances table
--- @param path string Human-readable path for error messages
local function validateAppearances(appearances, path)
  assert.is_table(appearances, path .. " should be a table")
  for appearanceId, modIds in pairs(appearances) do
    local appPath = path .. "[" .. tostring(appearanceId) .. "]"

    -- appearanceID must be a positive number
    assert.is_number(appearanceId, appPath .. " key should be a number")
    assert(appearanceId > 0, appPath .. " key should be > 0, got " .. tostring(appearanceId))

    -- modIds must be a table (not accidentally unpacked to a bare number)
    assert.is_table(modIds, appPath .. " value should be a table (got " .. type(modIds) .. "). Missing trailing comma?")

    -- modIds must not be empty
    assert(#modIds > 0, appPath .. " modID array should not be empty")

    -- Each modID must be a positive number
    for i, modId in ipairs(modIds) do
      local modPath = appPath .. "[" .. i .. "]"
      assert.is_number(modId, modPath .. " should be a number")
      assert(modId > 0, modPath .. " should be > 0, got " .. tostring(modId))
    end
  end
end

--- Validate a class-keyed data table: { ["WARRIOR"] = appearances, ... }
--- @param classData table
--- @param path string
local function validateClassData(classData, path)
  assert.is_table(classData, path .. " should be a table")

  local hasClassKey = false
  for key, appearances in pairs(classData) do
    local keyPath = path .. '["' .. tostring(key) .. '"]'
    assert(VALID_CLASS_OR_GROUP_KEYS[key],
      keyPath .. " is not a valid class or group key")
    hasClassKey = true
    validateAppearances(appearances, keyPath)
  end
  assert(hasClassKey, path .. " should have at least one class entry")
end

--- Validate a token's data at any level of the hierarchy.
--- Handles: direct class data, faction branches, and Difficulties wrappers.
--- @param tokenId number
--- @param tokenData table
--- @param raidName string
local function validateTokenData(tokenId, tokenData, raidName)
  local basePath = raidName .. "[" .. tokenId .. "]"
  assert.is_table(tokenData, basePath .. " should be a table")

  -- Case 1: Has Difficulties wrapper (modern raids)
  if tokenData.Difficulties then
    assert.is_table(tokenData.Difficulties, basePath .. ".Difficulties should be a table")
    local hasDifficulty = false
    for diffKey, diffData in pairs(tokenData.Difficulties) do
      local diffPath = basePath .. ".Difficulties[" .. tostring(diffKey) .. "]"
      assert.is_number(diffKey, diffPath .. " key should be a number (Enum.ItemCreationContext value)")
      assert(VALID_DIFFICULTY_CONTEXTS[diffKey],
        diffPath .. " key " .. tostring(diffKey) .. " is not a valid ItemCreationContext value")
      hasDifficulty = true

      -- Difficulty data can be class data or faction-branched
      if diffData["ALLIANCE"] or diffData["HORDE"] then
        for faction in pairs(FACTION_KEYS) do
          if diffData[faction] then
            validateClassData(diffData[faction], diffPath .. '["' .. faction .. '"]')
          end
        end
      else
        validateClassData(diffData, diffPath)
      end
    end
    assert(hasDifficulty, basePath .. ".Difficulties should have at least one difficulty entry")
    return
  end

  -- Case 2: Faction branches at top level (no Difficulties wrapper)
  if tokenData["ALLIANCE"] or tokenData["HORDE"] then
    for faction in pairs(FACTION_KEYS) do
      if tokenData[faction] then
        validateClassData(tokenData[faction], basePath .. '["' .. faction .. '"]')
      end
    end
    return
  end

  -- Case 3: Direct class -> appearance mapping (flat/legacy tokens)
  validateClassData(tokenData, basePath)
end


-- ==========================================================================
-- Test suite
-- ==========================================================================

describe("Data Model Integrity", function()
  local ns

  -- Load all raid data once for the entire suite
  setup(function()
    ns = loader.loadAllRaidData()
  end)

  describe("namespace structure", function()
    it("should have a Raids table", function()
      assert.is_table(ns.Raids)
    end)

    it("should have a _Gear table", function()
      assert.is_table(ns._Gear)
    end)

    it("should have a mergeTable function", function()
      assert.is_function(ns.mergeTable)
    end)

    it("should have loaded at least one raid", function()
      local count = 0
      for _ in pairs(ns.Raids) do count = count + 1 end
      assert(count > 0, "ns.Raids should not be empty")
    end)
  end)

  describe("per-raid token data", function()
    -- Dynamically generate tests for each raid after data is loaded
    local raidNames = {}

    setup(function()
      for raidName in pairs(ns.Raids) do
        table.insert(raidNames, raidName)
      end
      table.sort(raidNames)
    end)

    it("should have no duplicate token IDs across raids", function()
      local seenTokens = {} -- tokenId -> raidName
      for raidName, raidData in pairs(ns.Raids) do
        for tokenId in pairs(raidData) do
          local existing = seenTokens[tokenId]
          assert(not existing,
            "Duplicate token ID " .. tostring(tokenId) ..
            " found in both " .. tostring(existing) .. " and " .. raidName)
          seenTokens[tokenId] = raidName
        end
      end
    end)

    it("should have only numeric token IDs as keys", function()
      for raidName, raidData in pairs(ns.Raids) do
        for tokenId in pairs(raidData) do
          assert.is_number(tokenId,
            raidName .. " has non-numeric token key: " .. tostring(tokenId))
          assert(tokenId > 0,
            raidName .. " has token ID <= 0: " .. tostring(tokenId))
        end
      end
    end)

    it("should have valid data for every token in every raid", function()
      for raidName, raidData in pairs(ns.Raids) do
        for tokenId, tokenData in pairs(raidData) do
          validateTokenData(tokenId, tokenData, raidName)
        end
      end
    end)
  end)

  describe("modID array integrity", function()
    it("should never have a bare number where a table is expected (trailing comma check)", function()
      -- This catches the most common data entry error: {[12345] = 67890} instead of {[12345] = {67890,}}
      -- If the trailing comma is missing on a single-element table, Lua may unpack it
      for raidName, raidData in pairs(ns.Raids) do
        for tokenId, tokenData in pairs(raidData) do
          -- Walk the full tree to find all appearance tables
          local function checkLeaves(data, path)
            for key, value in pairs(data) do
              local currentPath = path .. "[" .. tostring(key) .. "]"
              if type(key) == "number" and key > 1000 then
                -- Likely an appearanceID key — value should be a table
                assert.is_table(value,
                  currentPath .. " should be a {modID,} table, got " .. type(value) ..
                  ". Likely missing trailing comma.")
              elseif type(value) == "table" then
                checkLeaves(value, currentPath)
              end
            end
          end
          checkLeaves(tokenData, raidName .. "[" .. tokenId .. "]")
        end
      end
    end)
  end)
end)

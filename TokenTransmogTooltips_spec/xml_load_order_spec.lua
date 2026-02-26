--- XML load order tests.
---
--- Validates that the XML files defining load order follow the required
--- conventions so that data is always defined before it is referenced.
---
--- Key rules:
--- 1. _raids.xml: _index.lua is first; every raid directory has an entry
--- 2. Raid _index.xml: _index.lua (if present) is first; tokens.lua is last
--- 3. Token group _index.xml: aggregator (directory-named .lua) is last

local loader = require("TokenTransmogTooltips_spec._mocks.data_loader")
local parseXml = loader.parseXml
local RAIDS_DIR = loader.RAIDS_DIR

--- Get just the filename from a path (no directory component).
local function basename(path)
  return path:match("([^/]+)$") or path
end

--- Get the directory name from a path.
local function dirname(path)
  return path:match("^(.*)/[^/]+$")
end

--- List subdirectories that contain an _index.xml (i.e. token group dirs).
--- @param raidDir string Path to a raid directory
--- @return table Array of {name=string, xmlPath=string} for each token group
local function getTokenGroupDirs(raidDir)
  local groups = {}
  -- Use the raid _index.xml to find included subdirectories
  local raidXmlPath = raidDir .. "/_index.xml"
  local ok = io.open(raidXmlPath, "r")
  if not ok then return groups end
  ok:close()

  local entries = parseXml(raidXmlPath)
  for _, entry in ipairs(entries) do
    if entry.type == "include" and entry.file:match("%.xml$") then
      local subXmlPath = raidDir .. "/" .. entry.file
      local subDir = dirname(subXmlPath)
      if subDir then
        table.insert(groups, {
          name = basename(subDir),
          xmlPath = subXmlPath,
          dir = subDir,
        })
      end
    end
  end
  return groups
end

--- Get all raid directories referenced in _raids.xml.
--- @return table Array of {name=string, xmlPath=string, dir=string}
local function getRaidDirs()
  local raids = {}
  local entries = parseXml(RAIDS_DIR .. "/_raids.xml")
  for _, entry in ipairs(entries) do
    if entry.type == "include" and entry.file:match("%.xml$") then
      local xmlPath = RAIDS_DIR .. "/" .. entry.file
      local dir = dirname(xmlPath)
      if dir then
        table.insert(raids, {
          name = basename(dir),
          xmlPath = xmlPath,
          dir = dir,
        })
      end
    end
  end
  return raids
end


-- ==========================================================================
-- Test suite
-- ==========================================================================

describe("XML Load Order", function()

  describe("_raids.xml", function()
    local entries

    setup(function()
      entries = parseXml(RAIDS_DIR .. "/_raids.xml")
    end)

    it("should load _index.lua first", function()
      assert(#entries > 0, "_raids.xml should not be empty")
      local first = entries[1]
      assert.are.equal("_index.lua", first.file,
        "_raids.xml first entry should be _index.lua, got " .. tostring(first.file))
    end)

    it("should have an entry for every raid directory on disk", function()
      -- Collect raid names referenced in _raids.xml
      local referencedRaids = {}
      for _, entry in ipairs(entries) do
        if entry.type == "include" and entry.file:match("%.xml$") then
          local raidName = entry.file:match("^([^/]+)/")
          if raidName then
            referencedRaids[raidName] = true
          end
        end
      end

      -- Scan the Raids directory for subdirectories that have _index.xml
      local handle = io.popen('find ' .. RAIDS_DIR .. ' -maxdepth 1 -mindepth 1 -type d | sort')
      if handle then
        for dirPath in handle:lines() do
          local raidName = basename(dirPath)
          -- Only check directories that have an _index.xml (actual raids)
          local xmlCheck = io.open(dirPath .. "/_index.xml", "r")
          if xmlCheck then
            xmlCheck:close()
            assert(referencedRaids[raidName],
              raidName .. " has _index.xml on disk but is not referenced in _raids.xml")
          end
        end
        handle:close()
      end
    end)

    it("should only use forward slashes in file paths", function()
      local raw = io.open(RAIDS_DIR .. "/_raids.xml", "r")
      assert(raw, "Could not open _raids.xml")
      local lineNum = 0
      for line in raw:lines() do
        lineNum = lineNum + 1
        local filePath = line:match('file="([^"]+)"')
        if filePath then
          assert(not filePath:find("\\"),
            "_raids.xml line " .. lineNum .. ": path contains backslash: " .. filePath)
        end
      end
      raw:close()
    end)
  end)

  describe("raid _index.xml files", function()
    local raids

    setup(function()
      raids = getRaidDirs()
    end)

    it("should load _index.lua before any token group or class data (when present)", function()
      for _, raid in ipairs(raids) do
        local entries = parseXml(raid.xmlPath)
        if #entries == 0 then goto continue end

        -- Find if _index.lua exists in entries
        local hasIndexLua = false
        for _, entry in ipairs(entries) do
          if basename(entry.file) == "_index.lua" then
            hasIndexLua = true
            break
          end
        end

        -- If _index.lua is present, it must be first
        if hasIndexLua then
          local first = entries[1]
          assert.are.equal("_index.lua", basename(first.file),
            raid.name .. "/_index.xml: _index.lua must be first entry, got " .. tostring(first.file))
        end

        ::continue::
      end
    end)

    it("should load tokens.lua last", function()
      for _, raid in ipairs(raids) do
        local entries = parseXml(raid.xmlPath)
        if #entries == 0 then goto continue end

        -- Find if tokens.lua exists in entries
        local hasTokensLua = false
        for _, entry in ipairs(entries) do
          if basename(entry.file) == "tokens.lua" then
            hasTokensLua = true
            break
          end
        end

        -- If tokens.lua is present, it must be last
        if hasTokensLua then
          local last = entries[#entries]
          assert.are.equal("tokens.lua", basename(last.file),
            raid.name .. "/_index.xml: tokens.lua must be last entry, got " .. tostring(last.file))
        end

        ::continue::
      end
    end)

    it("should only use forward slashes in file paths", function()
      for _, raid in ipairs(raids) do
        local raw = io.open(raid.xmlPath, "r")
        if not raw then goto continue end
        local lineNum = 0
        for line in raw:lines() do
          lineNum = lineNum + 1
          local filePath = line:match('file="([^"]+)"')
          if filePath then
            assert(not filePath:find("\\"),
              raid.name .. "/_index.xml line " .. lineNum .. ": path contains backslash: " .. filePath)
          end
        end
        raw:close()
        ::continue::
      end
    end)
  end)

  describe("token group _index.xml files", function()
    local allGroups = {} -- {raidName, groupName, xmlPath}

    setup(function()
      local raids = getRaidDirs()
      for _, raid in ipairs(raids) do
        local groups = getTokenGroupDirs(raid.dir)
        for _, group in ipairs(groups) do
          table.insert(allGroups, {
            raidName = raid.name,
            groupName = group.name,
            xmlPath = group.xmlPath,
            dir = group.dir,
          })
        end
      end
    end)

    it("should load the aggregator file last (defined after all class files)", function()
      for _, group in ipairs(allGroups) do
        local entries = parseXml(group.xmlPath)
        if #entries == 0 then goto continue end

        -- The aggregator should be the last entry and match the directory name
        local last = entries[#entries]
        local lastBasename = basename(last.file):gsub("%.lua$", "")
        assert.are.equal(group.groupName, lastBasename,
          group.raidName .. "/" .. group.groupName .. "/_index.xml: " ..
          "last entry should be aggregator " .. group.groupName .. ".lua, got " .. tostring(last.file))

        ::continue::
      end
    end)

    it("should only contain .lua file references", function()
      for _, group in ipairs(allGroups) do
        local entries = parseXml(group.xmlPath)
        for _, entry in ipairs(entries) do
          assert(entry.file:match("%.lua$"),
            group.raidName .. "/" .. group.groupName .. "/_index.xml: " ..
            "unexpected non-.lua entry: " .. tostring(entry.file))
        end
      end
    end)

    it("should only use forward slashes in file paths", function()
      for _, group in ipairs(allGroups) do
        local raw = io.open(group.xmlPath, "r")
        if not raw then goto continue end
        local lineNum = 0
        for line in raw:lines() do
          lineNum = lineNum + 1
          local filePath = line:match('file="([^"]+)"')
          if filePath then
            assert(not filePath:find("\\"),
              group.raidName .. "/" .. group.groupName .. "/_index.xml line " .. lineNum ..
              ": path contains backslash: " .. filePath)
          end
        end
        raw:close()
        ::continue::
      end
    end)
  end)
end)

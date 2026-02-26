--- Utility that loads the entire TokenTransmogTooltips raid data tree
--- into a namespace table, simulating the WoW addon load process.
---
--- Parses _index.xml files to determine correct load order, then uses
--- loadfile() to execute each .lua file with the addon varargs pattern.

local M = {}

local ADDON_NAME = "TokenTransmogTooltips"
local ADDON_ROOT = "TokenTransmogTooltips"
local RAIDS_DIR = ADDON_ROOT .. "/Raids"

--- Parse a simple XML file for <Script file="..."/> and <Include file="..."/> entries.
--- Returns an ordered list of {type="script"|"include", file="relative/path"} entries.
local function parseXml(xmlPath)
  local entries = {}
  local f = io.open(xmlPath, "r")
  if not f then
    error("Could not open XML file: " .. xmlPath)
  end
  for line in f:lines() do
    -- Match <Script file="..."/> entries
    local scriptFile = line:match('<Script%s+file="([^"]+)"')
    if scriptFile then
      -- Normalize path separators (some files use backslash)
      scriptFile = scriptFile:gsub("\\", "/")
      table.insert(entries, { type = "script", file = scriptFile })
    end
    -- Match <Include file="..."/> entries
    local includeFile = line:match('<Include%s+file="([^"]+)"')
    if includeFile then
      includeFile = includeFile:gsub("\\", "/")
      table.insert(entries, { type = "include", file = includeFile })
    end
  end
  f:close()
  return entries
end

--- Recursively resolve an XML file into an ordered list of .lua file paths.
--- All paths are relative to the workspace root.
local function resolveLoadOrder(xmlPath, basePath)
  local entries = parseXml(xmlPath)
  local luaFiles = {}
  for _, entry in ipairs(entries) do
    local fullPath = basePath .. "/" .. entry.file
    if entry.file:match("%.lua$") then
      -- Both <Script> and <Include> can reference .lua files
      table.insert(luaFiles, fullPath)
    elseif entry.type == "include" and entry.file:match("%.xml$") then
      -- Recurse into included XML files
      local includeDir = fullPath:match("^(.*)/[^/]+$") or basePath
      local nested = resolveLoadOrder(fullPath, includeDir)
      for _, nestedFile in ipairs(nested) do
        table.insert(luaFiles, nestedFile)
      end
    end
  end
  return luaFiles
end

--- Load the entire raid data tree and return the populated namespace table.
--- @return table ns The addon namespace with ns.Raids, ns._Gear, etc.
--- @return table loadedFiles List of file paths that were loaded (for debugging)
function M.loadAllRaidData()
  local ns = {}

  -- Resolve the full load order from _raids.xml
  local luaFiles = resolveLoadOrder(RAIDS_DIR .. "/_raids.xml", RAIDS_DIR)

  local loadedFiles = {}
  for _, luaPath in ipairs(luaFiles) do
    local fn, err = loadfile(luaPath)
    if not fn then
      error("Failed to load " .. luaPath .. ": " .. tostring(err))
    end
    -- Simulate WoW's varargs: local addonName, ns = ...
    fn(ADDON_NAME, ns)
    table.insert(loadedFiles, luaPath)
  end

  return ns, loadedFiles
end

--- Get the load order without actually loading files.
--- Useful for verifying XML structure.
--- @return table luaFiles Ordered list of .lua file paths
function M.getLoadOrder()
  return resolveLoadOrder(RAIDS_DIR .. "/_raids.xml", RAIDS_DIR)
end

--- Expose the XML parser for use in load-order tests.
--- @param xmlPath string Path to the XML file
--- @return table entries Ordered list of {type, file} entries
M.parseXml = parseXml

--- Expose path constants for use in tests.
M.RAIDS_DIR = RAIDS_DIR

return M

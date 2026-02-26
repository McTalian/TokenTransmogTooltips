--- Busted suite-wide helper — loaded once before any spec runs.
---
--- Establishes global polyfills and WoW API stubs that every spec needs,
--- so individual spec files don't have to repeat these requires.

-- Lua 5.2+ moved `unpack` into the `table` namespace.
_G.unpack = _G.unpack or table.unpack

-- WoW exposes `format` as a global alias for `string.format`.
_G.format = _G.format or string.format

-- Stub the WoW addon namespace vararg pattern: local addonName, ns = ...
-- Each spec that loads addon files will provide its own ns table,
-- but we need the Enum globals available everywhere.
_G.Enum = _G.Enum or {}
_G.Enum.ItemCreationContext = _G.Enum.ItemCreationContext or {
  -- Standard raid difficulties
  RaidFinder = 14,
  RaidNormal = 15,
  RaidHeroic = 16,
  RaidMythic = 17,
  -- Extended variants (used by some seasonal/cross-tier tokens)
  RaidFinderExtended = 18,
  RaidNormalExtended = 19,
  RaidHeroicExtended = 20,
  RaidMythicExtended = 21,
  RaidFinderExtended_2 = 22,
  RaidNormalExtended_2 = 23,
  RaidHeroicExtended_2 = 24,
  RaidMythicExtended_2 = 25,
  RaidFinderExtended_3 = 26,
  RaidNormalExtended_3 = 27,
  RaidHeroicExtended_3 = 28,
  RaidMythicExtended_3 = 29,
}

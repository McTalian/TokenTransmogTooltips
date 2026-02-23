# TokenTransmogTooltips

This is a World of Warcraft addon that adds transmog data to tooltips of gear tokens that are typically found in raids and exchanged for gear. When running legacy content, you find yourself with a lot of these tokens. This addon will tell you what transmog appearances you are missing for a given token.

It supports tokens that can be exchanged for multiple items (like tokens from Tempest Keep which allows for PvP or PvE gear), tokens that have a "Trade Up" program (like the tokens in Icecrown Citadel), and quest items that start a quest where you can choose any of the gear tokens (like the tokens from Blackrock Foundry).

It _should_ work with tokens from the following sources:

- **Midnight** _12.x.x_
  - Season 1 Raids: The Voidspire, The Dreamrift, March on Quel'Danas (including the Chiming Void Curio)
- **The War Within** _11.x.x_
  - Season 3 Raid: Manaforge Omega (including the Hungering Void Curio)
  - Season 2 Raid: Liberation of Undermine (including the Excessively Bejeweled Curio)
  - Season 1 Raid: Nerub'ar Palace (including the Web-Wrapped Curio)
- **Dragonflight** _10.x.x_
  - Season 3 Raid: Amirdrassil, the Dream's Hope (including the Flame-Warped Curio)
  - Season 2 Raid: Aberrus, the Shadowed Crucible (including the Void-Touched Curio)
  - Season 1 Raid: Vault of the Incarnates
  - The Forbidden Reach (Primalist Armor Tokens only for now)
- **Shadowlands** _9.x.x_
  - Season 3 Raid: Sepulcher of the First Ones
  - Season 1 Raid: Castle Nathria (Anima weapon tokens)
- **Warlords of Draenor** _6.x.x_
  - Tier 17 Raid: Blackrock Foundry (including the Quest items)
- **Mists of Pandaria** _5.x.x_
  - Tier 16 Raid: Siege of Orgrimmar
  - Tier 15 Raid: Throne of Thunder
  - Tier 14 Raids: Terrace of Endless Spring, Heart of Fear
- **Cataclysm** _4.x.x_
  - Tier 13 Raid: Dragon Soul
  - Tier 12 Raid: Firelands
  - Tier 11 Raids: Blackwing Descent, Throne of the Four Winds
- **Wrath of the Lich King** _3.x.x_
  - Tier 10 Raid: Icecrown Citadel (including the Trade Up program for Heroic gear)
  - Tier 9 Raid: Trial of the Crusader
  - Tier 8 Raid: Ulduar
  - Tier 7 Raids: Naxxramas, Obsidian Sanctum
- **The Burning Crusade** _2.x.x_
  - Tier 6 Raids: Battle for Mount Hyjal, Black Temple, Sunwell Plateau
  - Tier 5 Raids: Serpent Shrine Cavern, The Eye/Tempest Keep
  - Tier 4 Raids: Karazhan, Gruul's Lair, Magtheridon's Lair

**This data is manually maintained**, so it may not be complete or accurate. If you find a token that is not supported, please open an issue on the [GitHub repository](https://github.com/mctalian/TokenTransmogTooltips/issues).

## Recommended addon(s)

* `Vendor` to set up auto sell/destroy rules
* Any addon that shows item IDs if you're looking to contribute token data. Alpha builds of TokenTransmogTooltips offer itemIds as well as itemContexts for items. If you would find that useful in a release build, please let me know and I can add a few configuration options to this addon.

## This doesn't work for this token I just looted!

There isn't a Blizzard API for this type of data, so I have manually added lookup tables for all the tokens I could find. If you find a token that is not supported (or is incorrect), please open an issue on the [GitHub repository](https://github.com/mctalian/TokenTransmogTooltips/issues), or let me know somehow. Include the token's itemID, the itemContext (should be on the tooltip for now), and which raid it comes from. You can also open the Appearance Journal in-game and find the items that should be associated with that token and provide the appearanceID and modID for those items (this addon adds that data to the tooltips in the Appearance Journal as well).

The addon should be up to date with the latest raids. I will try to look into adding non-raid tokens as well. Please let me know if there are raid tokens missing, or if there are particular tokens you would like to see added 🙏

## Notes

There are other addons that do this, or something similar. I noticed missing data in those addons so I decided to restructure the data to support the various Blizzard implementations of tokens throughout the years. I also wrote scripts and helpers to scrape data from Wowhead, generate code from the game itself, and then manually adjust the data to fill in the gaps.

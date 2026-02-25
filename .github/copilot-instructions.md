# TokenTransmogTooltips - GitHub Copilot Instructions

## Project Overview

World of Warcraft addon that enhances tooltips for raid gear tokens by showing which transmog appearances the player is missing. **All transmog data is manually maintained** - there is no Blizzard API for token-to-gear mappings. This is an extremely data-heavy addon covering many raids, tiers, and seasons. The actual logic for augmenting tooltips is relatively simple; the complexity lies in the data model and collection workflows.

## Architecture & Data Flow

### Core Components
1. [Core.lua](../TokenTransmogTooltips/Core.lua): Tooltip hook system using WoW's `TooltipDataProcessor` API
2. [tokenClassAppearanceModInfo.lua](../TokenTransmogTooltips/tokenClassAppearanceModInfo.lua): Central registry that aggregates all raid data into token lookups
3. **Raids/**: Hierarchical data structure organized by raid → token group → class → difficulty → slot

### Token Resolution Flow
1. User hovers over token → `GetTooltipInfo()` extracts item data
2. Extract `itemContext` from item link (difficulty indicator)
3. Lookup in `ns.tokenClassAppearanceModInfo[tokenId]`
4. Navigate: `tokenData.Difficulties[itemContext]` → faction branch → class appearances
5. Query `C_TransmogCollection` API to check player collection status
6. Display missing items with class icons in tooltip

## Addon User Experience

When users hover over raid gear tokens (inventory, chat links, Dungeon Journal, etc.), the addon enhances tooltips to show missing transmog appearances obtainable from that token. Missing appearances display with class icons and item names; collected appearances show green "Collected" text. If multiple appearances exist for a class, all are listed. If all appearances for a class are collected, a single "Collected" line appears.

## Collaboration Guidelines

When working on this project:

- **Share technical insights proactively**: If you identify opportunities for improvement or solutions the user may not be aware of, share them
- **Explain the "why"**: When suggesting alternatives, briefly explain the underlying mechanism or benefit
- **Ask clarifying questions**: If requirements are ambiguous or you see multiple valid approaches, present options and ask for direction
- **Note future considerations**: When you identify enhancements that are out of scope, document them for later

## Common Development Patterns

### Single-Element Arrays
Must use `{value,}` with trailing comma to prevent Lua from unpacking the table.

### itemContext 0
Some old tokens lack difficulty data. Handle gracefully with fallbacks.

### Async Link Loading
Tooltips may refresh multiple times as `GetAppearanceSourceInfo()` loads data asynchronously.

### XML Load Order
Critical loading sequence:
1. Raid `_index.lua` (creates namespace, **must be first**)
2. Token group `_index.xml` files (include classes and aggregators)
3. `tokens.lua` (references token groups, **must be last**)

Classes must load before aggregators within token groups.

## File Path Convention

Always use forward slashes (`/`) for file paths regardless of OS. The WoW client correctly interprets them on all platforms.

## Available Customizations

This project uses several Copilot customization types:

- **Instructions** (this file + supporting docs): Coding standards, data model rules
- **Prompt files**: Reusable workflows for raid data generation (`/new-token`, `/plan-token`, `/generate-token`)
- **Reference docs** (`.github/docs/`): Environment setup, debugging tools, testing guides - reference as needed but not behavioral instructions

## Reference Documentation

- **Data Model**: [.github/instructions/data-model.instructions.md](instructions/data-model.instructions.md) - Data architecture and directory organization
- **Standards**: [.github/instructions/standards.instructions.md](instructions/standards.instructions.md) - Coding conventions and style guide
- **Environment**: [.github/docs/environment-setup.md](docs/environment-setup.md) - Dependencies, build tools, WoW API documentation
- **Debugging**: [.github/docs/debugging-tools.md](docs/debugging-tools.md) - Alpha build tools for data collection
- **Testing**: [.github/docs/testing-guide.md](docs/testing-guide.md) - Validation strategies and in-game verification
- **Template**: [.github/docs/NEW_RAID_TEMPLATE.md](docs/NEW_RAID_TEMPLATE.md) - Raid token data collection format

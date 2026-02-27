# Testing Guide

This document covers testing approaches for the TokenTransmogTooltips addon, including automated data validation and manual in-game verification.

## Testing Philosophy

The addon's complexity lies primarily in its data structure rather than its runtime logic. Most bugs will stem from:
- Malformed or inconsistent data structures
- Missing or incorrect token/appearance/modID mappings
- XML load order issues
- Difficulty context mismatches

Testing should focus on validating data integrity and verifying correct in-game behavior.

## Automated Testing

Automated tests live in `TokenTransmogTooltips_spec/` and run via `make test` (uses [busted](https://lunarmodules.github.io/busted/) test framework).

### Existing Test Suites

**1. Smoke Tests** (`smoke_spec.lua`)
- Verifies the test framework itself is functional
- Checks that WoW API shims (`Enum.ItemCreationContext`, Lua 5.1 compat) load correctly

**2. Data Integrity Tests** (`data_integrity_spec.lua`)
- Loads ALL raid data via the XML-driven loader
- Validates every token, appearance, and modID conforms to the expected structure
- Checks class names are valid WoW class identifiers
- Verifies numeric types for appearanceID and modID
- Catches data corruption before it reaches players

**3. XML Load Order Tests** (`xml_load_order_spec.lua`)
- Validates `_raids.xml`: `_index.lua` is first, every raid directory has an entry
- Validates raid `_index.xml`: `_index.lua` (if present) is first, `tokens.lua` is last
- Validates token group `_index.xml`: aggregator (directory-named `.lua`) is last
- Prevents nil reference errors from incorrect load ordering

**4. Core Logic Tests** (`Core_spec.lua`)
- Tests the tooltip hook system and token resolution logic

### Potential Future Tests

- **Completeness checks**: Detect missing difficulties, incomplete class coverage across token groups
- **Duplicate detection**: Pre-build check for duplicate token IDs across raids (addon warns at runtime, but pre-build would be earlier)
- **Reference integrity**: Verify all token group references in `tokens.lua` have corresponding `_Gear` data

## Manual Testing

Manual in-game testing is currently the primary verification method. This ensures the addon behaves correctly with actual game data and tooltip rendering.

### Testing Checklist

After generating code for a new raid or making changes to existing data, verify the following:

#### Visual & Functional Tests

- [ ] **Class icons display correctly** - Tooltips show proper class icons using `CreateAtlasMarkup`
- [ ] **Missing items formatted correctly** - Uncollected appearances show the formatted item name
- [ ] **Collected appearances marked** - Collected appearances display green "Collected" text
- [ ] **Multiple appearances per class** - When a class has multiple items from one token, all are listed
- [ ] **All collected handling** - When all appearances for a class are collected, shows single "Collected" line

#### Data Accuracy Tests

- [ ] **All difficulties work** - Test tokens in LFR, Normal, Heroic, and Mythic contexts
- [ ] **Faction-specific tokens** - If applicable, verify Alliance/Horde variants resolve correctly
- [ ] **Correct appearance mapping** - Hover over actual gear in Collections UI and verify the appearanceID matches what the token tooltip shows
- [ ] **Wildcard/Curio tokens** - If raid has curio tokens, verify they show appearances for all slots

#### Error Detection Tests

- [ ] **No Lua errors** - Check for errors in `/console scriptErrors 1` or BugSack/BugGrabber (highly recommended!)
- [ ] **No duplicate token warnings** - Alpha builds warn on init if duplicate token IDs detected
- [ ] **TTT_Debug validation** - Use `/dump TTT_Debug` to inspect the full data structure (alpha builds only); though it's probably better to inspect specific tokens through WoWLua addon or similar.

### Testing Workflow

**Step-by-step process for testing new raid data:**

1. **Build the addon**
   ```bash
   make build
   ```

2. **Load into WoW** (alpha build recommended for debug features)
   - Reload UI (`/reload`)
   - Check chat for any duplicate token warnings

3. **Acquire test tokens** (or use item links)
   - Option A: Use Dungeon Journal to get item links
   - Option B: Create item links manually: `/run print(select(2, GetItemInfo(TOKENID)))` - item creation context may not be present in these links, so the other options are preferred
   - Option C: If you have actual tokens in inventory/bank, use those

4. **Test each difficulty**
   - For each token type in the raid:
     - Get/create links for LFR, Normal, Heroic, Mythic versions
     - Hover over each and verify tooltip content
     - Check that item context detection is correct (debug builds show context value)

5. **Verify appearance accuracy**
   - Open Collections → Appearances
   - Navigate to the raid's transmog sets
   - Hover over individual pieces to see appearanceID (alpha builds show this)
   - Cross-reference with what the token tooltip displays

6. **Test faction variants** (if applicable)
   - Log into Alliance character and test
   - Log into Horde character and test
   - Verify different faction-specific appearances show correctly

7. **Test edge cases**
   - Tokens with no difficulty context (itemContext = 0) for legacy content
   - Curio/wildcard tokens that grant any slot
   - Classes with multiple appearance options for a single token

### Common Issues & Debugging

**Issue**: Tooltip shows no missing appearances when you know you're missing some
- **Check**: TTT_Debug global - is the token ID registered?
- **Check**: Item context value - does it match expected difficulty enum?
- **Check**: Are you on the correct character class?

**Issue**: Wrong appearances show for a token
- **Check**: Verify appearanceID in Collections UI matches data
- **Check**: Token group class mappings - is class in correct token group?
- **Check**: Difficulty mappings in tokens.lua - correct enum values used?

**Issue**: Lua errors when hovering over tokens
- **Check**: XML load order in `_index.xml` files
- **Check**: Namespace initialization - is `_index.lua` loading first?
- **Check**: Trailing commas in single-element arrays: `{value,}`
- **Check**: Data structure integrity - use TTT_Debug to inspect

**Issue**: Duplicate token ID warning on load
- **Check**: Search codebase for the duplicate token ID
- **Check**: Might be a legitimate case where two raids use the same token (verify intended behavior)

### Testing with Debug Tools

Alpha builds include tools that assist with testing. See [debugging-tools.md](debugging-tools.md) for full details:

- **Item Context Display** - Verify difficulty detection by seeing numeric context value
- **Appearance/Mod IDs** - Cross-check appearance IDs in Collections UI
- **TTT_Debug Global** - Inspect full data structure with `/dump TTT_Debug`
- **Extract Tokens** - Generate token lists from Dungeon Journal for verification

## CI/Automation Opportunities

Future enhancements could include:

1. **Pre-commit hooks** - Run data validation before allowing commits
2. **CI validation step** - Automated data structure checks in GitHub Actions
3. **Screenshot comparison** - Automated tooltip screenshot tests (challenging in WoW environment)
4. **Data coverage reports** - Generate reports showing which raids/difficulties have been tested

## Documentation References

- **[debugging-tools.md](debugging-tools.md)** - Debug tools and data collection aids
- **[data-model.instructions.md](../instructions/data-model.instructions.md)** - Data structure and organization patterns
- **[standards.instructions.md](../instructions/standards.instructions.md)** - Code conventions that affect data structure

---
name: 'plan-token'
description: 'Generate an implementation plan from a completed token source record'
agent: agent
argument-hint: 'ID (3-digit record number, e.g. 001)'
---
# Plan Token Data Generation

Generate a detailed implementation plan for adding new token data based on a completed data collection document. Supports both raid and non-raid token sources.

## Parameters

- `ID`: The 3-digit identifier corresponding to the token record markdown file (e.g., "001")

## Prerequisites

The token record file must contain:
- Source metadata (name, abbreviation, patch, source type, token group style)
- Curio/wildcard token information
- Faction-specific token notes
- Token data (from DungeonJournal Extract Tokens or manual entry)
- Appearance data (from `/tttgen` Set Label or Item List mode)
- Class/Difficulty/Slot → AppearanceID/ModID mappings
- Completed AUDIT section (all multi-modID choices marked with `[X]`)

## Process

### 1. Validate ID

1. Check that `ID` matches the prefix of an existing file in `/.github/raid_token_records/`
2. If invalid or omitted, prompt the user for a valid ID
3. Load the file contents

### 2. Verify Required Sections

Check that the file contains all required sections:
- **Metadata**: Source name, abbreviation, patch (optional), source type, token group style
- **Token Configuration**: Curio tokens, faction-specific handling, difficulty tiers
- **Raw Data**: Token data output, appearance data output
- **Mappings**: Complete Class/Difficulty/Slot combinations (or ArmorType/Slot for non-raid sources)
- **Audit Resolution**: All multi-modID entries must have exactly one `[X]` selection

### 3. Determine Source Pattern

Based on the Source Type and Token Group Style metadata, determine the code generation pattern:

1. **Standard Raid** (Source Type: Raid, Token Group Style: Class-based):
   - Class-based token groups (e.g., VOIDWOVEN, MYSTIC)
   - Multiple difficulties with `Enum.ItemCreationContext` wrappers
   - `tokens.lua` uses `Difficulties = { ... }` structure

2. **Armor-Type Specific** (Token Group Style: Armor-type):
   - Token groups organized by armor type (CLOTH/LEATHER/MAIL/PLATE)
   - Typically no difficulties (itemContext = 0)
   - `tokens.lua` maps token IDs directly to armor type gear tables
   - Examples: ForbiddenReach, BlackEmpire

3. **Universal Token** (Token Group Style: Universal):
   - One token per slot, all classes share it
   - No difficulties (itemContext = 0)
   - `tokens.lua` merges all armor types into a single table per slot
   - Example: Benthic

### 4. Audit Validation

For each AUDIT section (denoted by `## Audit`):
1. Parse each Class/Difficulty/Slot combination (denoted by `### CLASSNAME -`)
2. Count the number of `[X]` selections
3. If any combination has 0 or >1 selections:
   - **HALT IMMEDIATELY**
   - List all unresolved audit entries
   - Prompt user to review and mark exactly one choice per entry
   - Instruct user to re-run `@#file:plan-token` after fixing

### 5. Parse Token Groups

From the Token Data output:

**For Class-based (Raid) sources**:
1. Identify token group naming patterns (token names + class sets)
2. Group tokens by class composition
3. Derive token group names (e.g., VOIDWOVEN, MYSTIC, CONQUEROR)

**For Armor-type sources**:
1. Use CLOTH, LEATHER, MAIL, PLATE as token group names
2. Map classes to their armor type

**For Universal sources**:
1. Use CLOTH, LEATHER, MAIL, PLATE as organizational groups
2. Note that all groups will be merged per-slot in `tokens.lua`

Create a Token Groups & Class Mappings table.

### 6. Generate Token ID Mappings

For each unique token ID from the Token Data output:
1. Map to applicable difficulties (from itemContext, or a single source-specific key like "NAZJATAR" for non-raid)
2. Map to token group (from class composition or armor type)
3. Map to slot (HELM, SHOULDERS, etc.)
4. Create: `TokenID → Difficulties → TokenGroup → Slot` structure

### 7. Transform Class Data

For each class in the mappings section:

**For Class-based (Raid) sources**:
1. Read headers: `### CLASS - Set Name - Difficulty`
2. Transform to: `### TOKENGROUP - CLASS - DIFFICULTY`
3. For each slot under the class:
   - Extract: `SLOT, appearanceID, modID`
   - Apply AUDIT selections (use marked `[X]` modID)
   - Generate: `SLOT, appearanceID, modID` lines

**For Armor-type and Universal sources**:
1. Read headers: `### ARMOR_TYPE` (e.g., `### CLOTH`)
2. Map to all classes in that armor type
3. Transform to: `### ARMOR_TYPE - CLASS - DIFFICULTY_KEY`
4. For each slot under the armor type:
   - Extract: `SLOT, appearanceID, { modID1, modID2, ... }`
   - Apply AUDIT selections if applicable
   - Generate: `SLOT, appearanceID, { modID1, modID2, ... }` lines
   - Replicate for each class in the armor type (all share same appearance data)

### 8. Generate PLAN OUTPUT

Create or update the `## PLAN OUTPUT` section in the record with:

**Source Pattern**: (Standard Raid | Armor-Type Specific | Universal Token)

**Token Groups & Class Mappings**:
```
- TOKENGROUP1: Class1, Class2, Class3
- TOKENGROUP2: Class4, Class5
...
```

**Token ID Mappings**:
```
TokenID: 12345
  - Difficulties: LFR, Normal, Heroic, Mythic  (or single key like NAZJATAR for non-raid)
  - Token Group: TOKENGROUP1
  - Slot: HELM

TokenID: 12346
  - Difficulties: LFR, Normal, Heroic, Mythic
  - Token Group: TOKENGROUP1
  - Slot: SHOULDERS
...
```

**Class/Difficulty/Slot Data**:
```
### TOKENGROUP1 - CLASS1 - LFR
HELM, appearanceID, modID
SHOULDERS, appearanceID, modID
...

### TOKENGROUP1 - CLASS1 - NORMAL
HELM, appearanceID, modID
SHOULDERS, appearanceID, modID
...
```

### 9. Verification

1. Confirm PLAN OUTPUT was added/updated successfully
2. Verify each class has the same set of difficulties and slots (or single difficulty key for non-raid)
3. Highlight any discrepancies for user review
4. Check that every token ID has corresponding data
5. Verify the identified Source Pattern matches the metadata

### 10. Provide Next Steps

If validation passes:
- Instruct user to review PLAN OUTPUT section
- Provide command to proceed: `/generate-token ID="{ID}"`

If validation fails:
- List all blocking issues
- Provide specific guidance for resolution
- Instruct user to fix and re-run `/plan-token ID="{ID}"`

## Example Usage

```
/plan-token ID="002"
```

## Output

- Updates: `/.github/raid_token_records/{ID}_{sourceName}.md` with PLAN OUTPUT section
- User receives: Validation results and next steps

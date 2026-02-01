# Plan Raid Data Generation

Generate a detailed implementation plan for adding new raid token data based on a completed data collection document.

## Parameters

- `ID`: The 3-digit identifier corresponding to the raid token record markdown file (e.g., "001")

## Prerequisites

The raid record file must contain:
- Raid metadata (name, abbreviation, patch)
- Curio/wildcard token information
- Faction-specific token notes
- DungeonJournal Extract Tokens output
- `/tttgen` transmog set appearance data
- Class/Difficulty/Slot → AppearanceID/ModID mappings
- Completed AUDIT section (all multi-modID choices marked with `[X]`)

## Process

### 1. Validate ID

1. Check that `ID` matches the prefix of an existing file in `/.collab/raid_token_records/`
2. If invalid or omitted, prompt the user for a valid ID
3. Load the file contents

### 2. Verify Required Sections

Check that the file contains all required sections:
- **Metadata**: Raid name, abbreviation, patch (optional)
- **Token Configuration**: Curio tokens, faction-specific handling
- **Raw Data**: Extract Tokens output, `/tttgen` output
- **Mappings**: Complete Class/Difficulty/Slot combinations
- **Audit Resolution**: All multi-modID entries must have exactly one `[X]` selection

### 3. Audit Validation

For each AUDIT section (denoted by `## Audit`):
1. Parse each Class/Difficulty/Slot combination (denoted by `### CLASSNAME -`)
2. Count the number of `[X]` selections
3. If any combination has 0 or >1 selections:
   - **HALT IMMEDIATELY**
   - List all unresolved audit entries
   - Prompt user to review and mark exactly one choice per entry
   - Instruct user to re-run `@#file:plan-raid` after fixing

### 4. Parse Token Groups

From the Extract Tokens output:
1. Identify token group naming patterns (token names + class sets)
2. Group tokens by class composition
3. Derive token group names (e.g., VOIDWOVEN, MYSTIC, CONQUEROR)
4. Create a Token Groups & Class Mappings table

### 5. Generate Token ID Mappings

For each unique token ID from Extract Tokens:
1. Map to applicable difficulties (from itemContext)
2. Map to token group (from class composition)
3. Map to slot (HELM, SHOULDERS, etc.)
4. Create: `TokenID → Difficulties → TokenGroup → Slot` structure

### 6. Transform Class Data

For each class in the mappings section:
1. Read headers: `### CLASS - Set Name - Difficulty`
2. Transform to: `### TOKENGROUP - CLASS - DIFFICULTY`
3. For each slot under the class:
   - Extract: `SLOT, appearanceID, modID`
   - Apply AUDIT selections (use marked `[X]` modID)
   - Generate: `SLOT, appearanceID, modID` lines

### 7. Generate PLAN OUTPUT

Create or update the `## PLAN OUTPUT` section in the raid record with:

**Token Groups & Class Mappings**:
```
- TOKENGROUP1: Class1, Class2, Class3
- TOKENGROUP2: Class4, Class5
...
```

**Token ID Mappings**:
```
TokenID: 12345
  - Difficulties: LFR, Normal, Heroic, Mythic
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

### 8. Verification

1. Confirm PLAN OUTPUT was added/updated successfully
2. Verify each class has the same set of difficulties and slots
3. Highlight any discrepancies for user review
4. Check that every token ID has corresponding data

### 9. Provide Next Steps

If validation passes:
- Instruct user to review PLAN OUTPUT section
- Provide command to proceed: `@#file:generate-raid-code ID="{ID}"`

If validation fails:
- List all blocking issues
- Provide specific guidance for resolution
- Instruct user to fix and re-run `@#file:plan-raid ID="{ID}"`

## Example Usage

```
@#file:plan-raid ID="002"
```

## Output

- Updates: `/.collab/raid_token_records/{ID}_{raidName}.md` with PLAN OUTPUT section
- User receives: Validation results and next steps

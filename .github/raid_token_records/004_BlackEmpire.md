# New Raid Data Template

> **Incremental Workflow**: Fill sections progressively, then use `/tttgen` output to populate Appearance/ModID data. Focus your time on gathering IDs from in-game sources.

## 👤 USER: Raid Information

**Raid Name**: BlackEmpire
**Raid Abbreviation**: BEmp
**Release Patch**: 8.3
**Has Curio/Wildcard Token**: No
**Faction-Specific Tokens**:  No
**Other Special Considerations**: 
* This is not a raid, these tokens drop from enemies during N'Zoth Assaults in Battle for Azeroth.
* We cannot use Dungeon Journal Extract Tokens for this content, so token IDs must be gathered manually from in-game sources (e.g. Wowhead, or datamining the game files directly).
* These tokens do not have difficulties or creation contexts.
* The token groupings are by armor type (Cloth, Leather, Mail, Plate).
* Helm, Shoulders, Chest, Belt, Legs, Bracers, Gloves, and Boots exist. No weapons.

---

## 👤 USER: DungeonJournal Extract Tokens Output

Open the DungeonJournal in-game with an alpha build of TokenTransmogTooltips. Navigate to the raid, select "All Classes" filter and select a Difficulty in the dropdown. Click the "Extract Tokens" button to copy the token data to your clipboard. Paste the output below. Repeat the process for each difficulty.


**Extract Tokens Output**:
```
-- Manual data entry (sourced from Wowhead)
-- Format: [ITEMID] - Token Name - SLOT - Source
-- Note: No difficulties or item creation contexts. Tokens are armor-type-specific.

-- PLATE
[173396] - Black Empire Plate Helm - HELM - N'Zoth Assaults
[173398] - Black Empire Plate Spaulders - SHOULDERS - N'Zoth Assaults
[173393] - Black Empire Plate Chestpiece - CHEST - N'Zoth Assaults
[173399] - Black Empire Plate Belt - BELT - N'Zoth Assaults
[173397] - Black Empire Plate Leggings - LEGGINGS - N'Zoth Assaults
[173422] - Black Empire Plate Bracers - BRACERS - N'Zoth Assaults
[173395] - Black Empire Plate Gloves - GAUNTLETS - N'Zoth Assaults
[173394] - Black Empire Plate Boots - BOOTS - N'Zoth Assaults

-- MAIL
[173403] - Black Empire Mail Helm - HELM - N'Zoth Assaults
[173405] - Black Empire Mail Spaulders - SHOULDERS - N'Zoth Assaults
[173400] - Black Empire Mail Chestpiece - CHEST - N'Zoth Assaults
[173406] - Black Empire Mail Belt - BELT - N'Zoth Assaults
[173404] - Black Empire Mail Leggings - LEGGINGS - N'Zoth Assaults
[173425] - Black Empire Mail Bracers - BRACERS - N'Zoth Assaults
[173402] - Black Empire Mail Gloves - GAUNTLETS - N'Zoth Assaults
[173401] - Black Empire Mail Boots - BOOTS - N'Zoth Assaults

-- LEATHER
[173410] - Black Empire Leather Helm - HELM - N'Zoth Assaults
[173412] - Black Empire Leather Spaulders - SHOULDERS - N'Zoth Assaults
[173407] - Black Empire Leather Chestpiece - CHEST - N'Zoth Assaults
[173413] - Black Empire Leather Belt - BELT - N'Zoth Assaults
[173411] - Black Empire Leather Leggings - LEGGINGS - N'Zoth Assaults
[173424] - Black Empire Leather Bracers - BRACERS - N'Zoth Assaults
[173409] - Black Empire Leather Gloves - GAUNTLETS - N'Zoth Assaults
[173408] - Black Empire Leather Boots - BOOTS - N'Zoth Assaults

-- CLOTH
[173417] - Black Empire Cloth Helm - HELM - N'Zoth Assaults
[173419] - Black Empire Cloth Spaulders - SHOULDERS - N'Zoth Assaults
[173414] - Black Empire Cloth Robes - CHEST - N'Zoth Assaults
[173420] - Black Empire Cloth Belt - BELT - N'Zoth Assaults
[173418] - Black Empire Cloth Leggings - LEGGINGS - N'Zoth Assaults
[173423] - Black Empire Cloth Bracers - BRACERS - N'Zoth Assaults
[173416] - Black Empire Cloth Gloves - GAUNTLETS - N'Zoth Assaults
[173415] - Black Empire Cloth Boots - BOOTS - N'Zoth Assaults
```

---

## 👤 USER: /tttgen Transmog Set Appearance Data Output

With an alpha build of TokenTransmogTooltips, run `/tttgen` in the chat window. A modal will appear where you provide a "label" (usually corresponds to the raid name, cross-reference with one of the class sets in the Transmog Sets UI). After entering the label, select which gear slots have tokens and click "Generate Data". Copy the output and paste the output below:

```
### CLOTH
  HELM, 41042, { 107462, 107753 }
  SHOULDERS, 41050, { 107464, 107752 }
  CHEST, 41026, { 107487, 107754 }
  BELT, 41054, { 107465, 107540, 107720, 107721 }
  BRACERS, 41058, { 107466, 107500, 107508, 107519 }
  GAUNTLETS, 41038, { 107461, 107492, 107520, 107536 }
  LEGGINGS, 41046, { 107463, 107496, 107512, 107719 }
  BOOTS, 41034, { 107460, 107507, 107524, 107544 }

### LEATHER
  HELM, 40908, { 107470, 107750 }
  SHOULDERS, 40930, { 107472, 107749 }
  CHEST, 40862, { 107467, 107751 }
  BELT, 40941, { 107473, 107541, 107723, 107724 }
  BRACERS, 40952, { 107474, 107501, 107509, 107518 }
  GAUNTLETS, 40897, { 107469, 107493, 107521, 107537 }
  LEGGINGS, 40919, { 107471, 107497, 107513, 107722 }
  BOOTS, 40886, { 107468, 107506, 107525, 107545 }

### MAIL
  HELM, 40795, { 107478, 107747 }
  SHOULDERS, 40807, { 107480, 107746 }
  CHEST, 40783, { 107475, 107748 }
  BELT, 40811, { 107481, 107542, 107726, 107727 }
  BRACERS, 40815, { 107482, 107502, 107510, 107517 }
  GAUNTLETS, 40791, { 107477, 107494, 107522, 107538 }
  LEGGINGS, 40803, { 107479, 107498, 107514, 107725 }
  BOOTS, 40787, { 107476, 107505, 107526, 107546 }

### PLATE
  HELM, 40971, { 107486, 107744 }
  SHOULDERS, 40979, { 107489, 107743 }
  CHEST, 40959, { 107483, 107745 }
  BELT, 40983, { 107490, 107543, 107729, 107730 }
  BRACERS, 40987, { 107491, 107503, 107511, 107516 }
  GAUNTLETS, 40967, { 107485, 107495, 107523, 107539 }
  LEGGINGS, 40975, { 107488, 107499, 107515, 107728 }
  BOOTS, 40963, { 107484, 107504, 107527, 107547 }

```

**NOTE**: If any AppearanceId has multiple ModIds, an AUDIT block will be included in the output above. Review each AUDIT block and mark the correct ModId(s) by changing `[ ]` to `[X]`. If no ModId is marked for an AppearanceId, the `/plan-token` command will halt and prompt you to resolve the audit entries before proceeding.

---

## 📋 PLAN OUTPUT (Generated by `/plan-token` [ID])

> **Do not edit manually.** This section is generated from the data you provided above. Review the token group mappings and slot/difficulty assignments before proceeding to `/generate-token`.

### Token Groups and Class Mappings

Discerned from Extract Tokens raw output:

| Token Group Name | Classes Covered                                |
|------------------|------------------------------------------------|
| CLOTH            | PRIEST, MAGE, WARLOCK                          |
| LEATHER          | DEMONHUNTER, DRUID, MONK, ROGUE                |
| MAIL             | EVOKER, HUNTER, SHAMAN                         |
| PLATE            | DEATHKNIGHT, PALADIN, WARRIOR                  |

**Note**: Unlike Benthic, each token is armor-type-specific (separate token IDs per armor type per slot), similar to ForbiddenReach. Each token ID maps to only one armor group.

### Token ID Mappings

Mapping of token IDs to their difficulties and token groups:

| Token ID | Difficulties | Token Group | Slot |
|----------|--------------|-------------|------|
| 173396 | NZOTH_ASSAULTS | PLATE | HELM |
| 173398 | NZOTH_ASSAULTS | PLATE | SHOULDERS |
| 173393 | NZOTH_ASSAULTS | PLATE | CHEST |
| 173399 | NZOTH_ASSAULTS | PLATE | BELT |
| 173397 | NZOTH_ASSAULTS | PLATE | LEGGINGS |
| 173422 | NZOTH_ASSAULTS | PLATE | BRACERS |
| 173395 | NZOTH_ASSAULTS | PLATE | GAUNTLETS |
| 173394 | NZOTH_ASSAULTS | PLATE | BOOTS |
| 173403 | NZOTH_ASSAULTS | MAIL | HELM |
| 173405 | NZOTH_ASSAULTS | MAIL | SHOULDERS |
| 173400 | NZOTH_ASSAULTS | MAIL | CHEST |
| 173406 | NZOTH_ASSAULTS | MAIL | BELT |
| 173404 | NZOTH_ASSAULTS | MAIL | LEGGINGS |
| 173425 | NZOTH_ASSAULTS | MAIL | BRACERS |
| 173402 | NZOTH_ASSAULTS | MAIL | GAUNTLETS |
| 173401 | NZOTH_ASSAULTS | MAIL | BOOTS |
| 173410 | NZOTH_ASSAULTS | LEATHER | HELM |
| 173412 | NZOTH_ASSAULTS | LEATHER | SHOULDERS |
| 173407 | NZOTH_ASSAULTS | LEATHER | CHEST |
| 173413 | NZOTH_ASSAULTS | LEATHER | BELT |
| 173411 | NZOTH_ASSAULTS | LEATHER | LEGGINGS |
| 173424 | NZOTH_ASSAULTS | LEATHER | BRACERS |
| 173409 | NZOTH_ASSAULTS | LEATHER | GAUNTLETS |
| 173408 | NZOTH_ASSAULTS | LEATHER | BOOTS |
| 173417 | NZOTH_ASSAULTS | CLOTH | HELM |
| 173419 | NZOTH_ASSAULTS | CLOTH | SHOULDERS |
| 173414 | NZOTH_ASSAULTS | CLOTH | CHEST |
| 173420 | NZOTH_ASSAULTS | CLOTH | BELT |
| 173418 | NZOTH_ASSAULTS | CLOTH | LEGGINGS |
| 173423 | NZOTH_ASSAULTS | CLOTH | BRACERS |
| 173416 | NZOTH_ASSAULTS | CLOTH | GAUNTLETS |
| 173415 | NZOTH_ASSAULTS | CLOTH | BOOTS |

### Appearance Data by Token Group, Class, Difficulty, Slot

```
### CLOTH - PRIEST - NZOTH_ASSAULTS
HELM, 41042, { 107462, 107753 }
SHOULDERS, 41050, { 107464, 107752 }
CHEST, 41026, { 107487, 107754 }
BELT, 41054, { 107465, 107540, 107720, 107721 }
BRACERS, 41058, { 107466, 107500, 107508, 107519 }
GAUNTLETS, 41038, { 107461, 107492, 107520, 107536 }
LEGGINGS, 41046, { 107463, 107496, 107512, 107719 }
BOOTS, 41034, { 107460, 107507, 107524, 107544 }

### CLOTH - MAGE - NZOTH_ASSAULTS
HELM, 41042, { 107462, 107753 }
SHOULDERS, 41050, { 107464, 107752 }
CHEST, 41026, { 107487, 107754 }
BELT, 41054, { 107465, 107540, 107720, 107721 }
BRACERS, 41058, { 107466, 107500, 107508, 107519 }
GAUNTLETS, 41038, { 107461, 107492, 107520, 107536 }
LEGGINGS, 41046, { 107463, 107496, 107512, 107719 }
BOOTS, 41034, { 107460, 107507, 107524, 107544 }

### CLOTH - WARLOCK - NZOTH_ASSAULTS
HELM, 41042, { 107462, 107753 }
SHOULDERS, 41050, { 107464, 107752 }
CHEST, 41026, { 107487, 107754 }
BELT, 41054, { 107465, 107540, 107720, 107721 }
BRACERS, 41058, { 107466, 107500, 107508, 107519 }
GAUNTLETS, 41038, { 107461, 107492, 107520, 107536 }
LEGGINGS, 41046, { 107463, 107496, 107512, 107719 }
BOOTS, 41034, { 107460, 107507, 107524, 107544 }

### LEATHER - DEMONHUNTER - NZOTH_ASSAULTS
HELM, 40908, { 107470, 107750 }
SHOULDERS, 40930, { 107472, 107749 }
CHEST, 40862, { 107467, 107751 }
BELT, 40941, { 107473, 107541, 107723, 107724 }
BRACERS, 40952, { 107474, 107501, 107509, 107518 }
GAUNTLETS, 40897, { 107469, 107493, 107521, 107537 }
LEGGINGS, 40919, { 107471, 107497, 107513, 107722 }
BOOTS, 40886, { 107468, 107506, 107525, 107545 }

### LEATHER - DRUID - NZOTH_ASSAULTS
HELM, 40908, { 107470, 107750 }
SHOULDERS, 40930, { 107472, 107749 }
CHEST, 40862, { 107467, 107751 }
BELT, 40941, { 107473, 107541, 107723, 107724 }
BRACERS, 40952, { 107474, 107501, 107509, 107518 }
GAUNTLETS, 40897, { 107469, 107493, 107521, 107537 }
LEGGINGS, 40919, { 107471, 107497, 107513, 107722 }
BOOTS, 40886, { 107468, 107506, 107525, 107545 }

### LEATHER - MONK - NZOTH_ASSAULTS
HELM, 40908, { 107470, 107750 }
SHOULDERS, 40930, { 107472, 107749 }
CHEST, 40862, { 107467, 107751 }
BELT, 40941, { 107473, 107541, 107723, 107724 }
BRACERS, 40952, { 107474, 107501, 107509, 107518 }
GAUNTLETS, 40897, { 107469, 107493, 107521, 107537 }
LEGGINGS, 40919, { 107471, 107497, 107513, 107722 }
BOOTS, 40886, { 107468, 107506, 107525, 107545 }

### LEATHER - ROGUE - NZOTH_ASSAULTS
HELM, 40908, { 107470, 107750 }
SHOULDERS, 40930, { 107472, 107749 }
CHEST, 40862, { 107467, 107751 }
BELT, 40941, { 107473, 107541, 107723, 107724 }
BRACERS, 40952, { 107474, 107501, 107509, 107518 }
GAUNTLETS, 40897, { 107469, 107493, 107521, 107537 }
LEGGINGS, 40919, { 107471, 107497, 107513, 107722 }
BOOTS, 40886, { 107468, 107506, 107525, 107545 }

### MAIL - EVOKER - NZOTH_ASSAULTS
HELM, 40795, { 107478, 107747 }
SHOULDERS, 40807, { 107480, 107746 }
CHEST, 40783, { 107475, 107748 }
BELT, 40811, { 107481, 107542, 107726, 107727 }
BRACERS, 40815, { 107482, 107502, 107510, 107517 }
GAUNTLETS, 40791, { 107477, 107494, 107522, 107538 }
LEGGINGS, 40803, { 107479, 107498, 107514, 107725 }
BOOTS, 40787, { 107476, 107505, 107526, 107546 }

### MAIL - HUNTER - NZOTH_ASSAULTS
HELM, 40795, { 107478, 107747 }
SHOULDERS, 40807, { 107480, 107746 }
CHEST, 40783, { 107475, 107748 }
BELT, 40811, { 107481, 107542, 107726, 107727 }
BRACERS, 40815, { 107482, 107502, 107510, 107517 }
GAUNTLETS, 40791, { 107477, 107494, 107522, 107538 }
LEGGINGS, 40803, { 107479, 107498, 107514, 107725 }
BOOTS, 40787, { 107476, 107505, 107526, 107546 }

### MAIL - SHAMAN - NZOTH_ASSAULTS
HELM, 40795, { 107478, 107747 }
SHOULDERS, 40807, { 107480, 107746 }
CHEST, 40783, { 107475, 107748 }
BELT, 40811, { 107481, 107542, 107726, 107727 }
BRACERS, 40815, { 107482, 107502, 107510, 107517 }
GAUNTLETS, 40791, { 107477, 107494, 107522, 107538 }
LEGGINGS, 40803, { 107479, 107498, 107514, 107725 }
BOOTS, 40787, { 107476, 107505, 107526, 107546 }

### PLATE - DEATHKNIGHT - NZOTH_ASSAULTS
HELM, 40971, { 107486, 107744 }
SHOULDERS, 40979, { 107489, 107743 }
CHEST, 40959, { 107483, 107745 }
BELT, 40983, { 107490, 107543, 107729, 107730 }
BRACERS, 40987, { 107491, 107503, 107511, 107516 }
GAUNTLETS, 40967, { 107485, 107495, 107523, 107539 }
LEGGINGS, 40975, { 107488, 107499, 107515, 107728 }
BOOTS, 40963, { 107484, 107504, 107527, 107547 }

### PLATE - PALADIN - NZOTH_ASSAULTS
HELM, 40971, { 107486, 107744 }
SHOULDERS, 40979, { 107489, 107743 }
CHEST, 40959, { 107483, 107745 }
BELT, 40983, { 107490, 107543, 107729, 107730 }
BRACERS, 40987, { 107491, 107503, 107511, 107516 }
GAUNTLETS, 40967, { 107485, 107495, 107523, 107539 }
LEGGINGS, 40975, { 107488, 107499, 107515, 107728 }
BOOTS, 40963, { 107484, 107504, 107527, 107547 }

### PLATE - WARRIOR - NZOTH_ASSAULTS
HELM, 40971, { 107486, 107744 }
SHOULDERS, 40979, { 107489, 107743 }
CHEST, 40959, { 107483, 107745 }
BELT, 40983, { 107490, 107543, 107729, 107730 }
BRACERS, 40987, { 107491, 107503, 107511, 107516 }
GAUNTLETS, 40967, { 107485, 107495, 107523, 107539 }
LEGGINGS, 40975, { 107488, 107499, 107515, 107728 }
BOOTS, 40963, { 107484, 107504, 107527, 107547 }
```

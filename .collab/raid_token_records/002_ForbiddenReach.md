# New Raid Data Template

> **Incremental Workflow**: Fill sections progressively, then use `/tttgen` output to populate Appearance/ModID data. Focus your time on gathering IDs from in-game sources.

## 👤 USER: Raid Information

**Raid Name**: ForbiddenReach
**Raid Abbreviation**: FbR
**Release Patch**: 10.0.7
**Has Curio/Wildcard Token**: No
**Faction-Specific Tokens**: No
**Other Special Considerations**:
* This is not a raid, these tokens drop from The Forbidden Reach Dragonflight zone.
* The generated data from tttgen will not have difficulties, and the only "tier" that we care about is The Forbidden Reach, any other data in tttgen, including audit records, should be ignored.
* The token groups will be based on armor types.
* DungeonJournal extract will not work for this content, so token IDs will be provided manually.
* There should be no item creation contexts for these tokens.
* There is also a Weapon token that WoWHead says generates spec-appropriate weapons, but the tooltip and anecdotes from comments seem to point to class-appropriate weapons.
* This includes 9 armor slots (Cloak included) and 1 weapon (could be 2 hand or 1 hand, so many possibilities).
* There are jewelry tokens but jewelry does not show on the character and therefore does not have appearance data so we don't care about them.

For documentation purposes here is the Weapon token, it will be handled later as there is a lot of manual work to do.
```
-- Weapon has the same token for all classes, but generates a random class-appropriate weapon
[203650] - Primalist Weapon - WEAPON - The Forbidden Reach
```

---

## 👤 USER: DungeonJournal Extract Tokens Output

Open the DungeonJournal in-game with an alpha build of TokenTransmogTooltips. Navigate to the raid, select "All Classes" filter and select a Difficulty in the dropdown. Click the "Extract Tokens" button to copy the token data to your clipboard. Paste the output below. Repeat the process for each difficulty.


**Extract Tokens Output**:
```
-- Manual data entry
-- Format: [ITEMID] - Token Name - SLOT - "Appearance Tier/Source"

-- Cloak is the same token for all classes
[203646] - Primalist Cloak - CLOAK - The Forbidden Reach

[203612] - Primalist Cloth Helm - HELM - The Forbidden Reach
[203627] - Primalist Cloth Spaulders - SHOULDERS - The Forbidden Reach
[203616] - Primalist Cloth Chestpiece - CHEST - The Forbidden Reach
[203632] - Primalist Cloth Bracers - BRACERS - The Forbidden Reach
[203642] - Primalist Cloth Gloves - GAUNTLETS - The Forbidden Reach
[203635] - Primalist Cloth Belt - BELT - The Forbidden Reach
[203622] - Primalist Cloth Leggings - LEGGINGS - The Forbidden Reach
[203641] - Primalist Cloth Boots - BOOTS - The Forbidden Reach

[203614] - Primalist Leather Helm - HELM - The Forbidden Reach
[203629] - Primalist Leather Spaulders - SHOULDERS - The Forbidden Reach
[203618] - Primalist Leather Chestpiece - CHEST - The Forbidden Reach
[203630] - Primalist Leather Bracers - BRACERS - The Forbidden Reach
[203645] - Primalist Leather Gloves - GAUNTLETS - The Forbidden Reach
[203637] - Primalist Leather Belt - BELT - The Forbidden Reach
[203619] - Primalist Leather Leggings - LEGGINGS - The Forbidden Reach
[203638] - Primalist Leather Boots - BOOTS - The Forbidden Reach

[203613] - Primalist Mail Helm - HELM - The Forbidden Reach
[203628] - Primalist Mail Spaulders - SHOULDERS - The Forbidden Reach
[203617] - Primalist Mail Chestpiece - CHEST - The Forbidden Reach
[203631] - Primalist Mail Bracers - BRACERS - The Forbidden Reach
[203644] - Primalist Mail Gloves - GAUNTLETS - The Forbidden Reach
[203636] - Primalist Mail Belt - BELT - The Forbidden Reach
[203620] - Primalist Mail Leggings - LEGGINGS - The Forbidden Reach
[203639] - Primalist Mail Boots - BOOTS - The Forbidden Reach

[203611] - Primalist Plate Helm - HELM - The Forbidden Reach
[203626] - Primalist Plate Spaulders - SHOULDERS - The Forbidden Reach
[203615] - Primalist Plate Chestpiece - CHEST - The Forbidden Reach
[203633] - Primalist Plate Bracers - BRACERS - The Forbidden Reach
[203643] - Primalist Plate Gloves - GAUNTLETS - The Forbidden Reach
[203634] - Primalist Plate Belt - BELT - The Forbidden Reach
[203623] - Primalist Plate Leggings - LEGGINGS - The Forbidden Reach
[203640] - Primalist Plate Boots - BOOTS - The Forbidden Reach

```

---

## 👤 USER: /tttgen Transmog Set Appearance Data Output

With an alpha build of TokenTransmogTooltips, run `/tttgen` in the chat window. A modal will appear where you provide a "label" (usually corresponds to the raid name, cross-reference with one of the class sets in the Transmog Sets UI). After entering the label, select which gear slots have tokens and click "Generate Data". Copy the output and paste the output below:

```
=== Data for 'Primal Elements' ===

## TEMPLATE
### WARLOCK - Raging Tempest - Primal Storms
HELM, 77252, 182011
SHOULDERS, 77253, 182015
CLOAK, 77260, 182042
CHEST, 77254, 182008
BELT, 77255, 182013
LEGGINGS, 77256, 182012
BOOTS, 77257, 182009
BRACERS, 77258, 182014
GAUNTLETS, 77259, 182010

### WARLOCK - Drakebreaker - War Mode
HELM, 77262, 181730
SHOULDERS, 77263, 181734
CLOAK, 77270, 181838
CHEST, 77264, 181727
BELT, 77265, 181732
LEGGINGS, 77266, 181731
BOOTS, 77267, 181728
BRACERS, 77268, 181733
GAUNTLETS, 77269, 181729

### EVOKER - Raging Tempest - Primal Storms
HELM, 77346, 182035
SHOULDERS, 77347, 182037
CLOAK, 77354, 182040
CHEST, 77348, 182032
BELT, 77349, 182038
LEGGINGS, 77350, 182036
BOOTS, 77351, 182033
BRACERS, 77352, 182039
GAUNTLETS, 77353, 182034

### EVOKER - Drakebreaker - War Mode
HELM, 77355, 181754
SHOULDERS, 77356, 181756
CLOAK, 77363, 181836
CHEST, 77357, 181751
BELT, 77358, 181757
LEGGINGS, 77359, 181755
BOOTS, 77360, 181752
BRACERS, 77361, 181758
GAUNTLETS, 77362, 181753

### DEMONHUNTER - Raging Tempest - Primal Storms
HELM, 77628, 182018
SHOULDERS, 77629, 182023
CLOAK, 77636, 182043
CHEST, 77630, 182022
BELT, 77631, 182020
LEGGINGS, 77632, 182019
BOOTS, 77633, 182016
BRACERS, 77634, 182021
GAUNTLETS, 77635, 182017

### DEMONHUNTER - Drakebreaker - War Mode
HELM, 77637, 181737
SHOULDERS, 77638, 181742
CLOAK, 77645, 181839
CHEST, 77639, 181741
BELT, 77640, 181739
LEGGINGS, 77641, 181738
BOOTS, 77642, 181735
BRACERS, 77643, 181740
GAUNTLETS, 77644, 181736

### DEATHKNIGHT - Raging Tempest - Primal Storms
HELM, 77301, 182024
SHOULDERS, 77302, 182029
CLOAK, 77309, 182041
CHEST, 77303, 182025
BELT, 77304, 182030
LEGGINGS, 77305, 182028
BOOTS, 77306, 182026
BRACERS, 77307, 182031
GAUNTLETS, 77308, 182027

### DEATHKNIGHT - Drakebreaker - War Mode
HELM, 77310, 181743
SHOULDERS, 77311, 181748
CLOAK, 77318, 181837
CHEST, 77312, 181744
BELT, 77313, 181749
LEGGINGS, 77314, 181747
BOOTS, 77315, 181745
BRACERS, 77316, 181750
GAUNTLETS, 77317, 181746

### WARLOCK - Verdant Wing - World Drop

### WARLOCK - Vibrant Wildercloth - Crafted
HELM, 77282, 180689
SHOULDERS, 77283, 180674
CLOAK, 77290, 180677
CHEST, 77284, 180675
BELT, 77285, 180682
LEGGINGS, 77286, 180684
BOOTS, 77287, 180685
BRACERS, 77288, 180676
GAUNTLETS, 77289, 180670

### EVOKER - Emerald Scale - World Drop

### EVOKER - Flame-Touched - Crafted
HELM, 77373, 180611
SHOULDERS, 77374, 180612
CHEST, 77375, 180610
BELT, 77376, 180613
LEGGINGS, 77377, 180614
BOOTS, 77378, 180609
BRACERS, 77379, 180616
GAUNTLETS, 77380, 180615

### DEMONHUNTER - Green Draketracker - World Drop
HELM, 77646, 182924
SHOULDERS, 77647, 182926
CHEST, 77648, 182925

### DEMONHUNTER - Life-Bound - Crafted
HELM, 77655, 180603
SHOULDERS, 77656, 180604
CHEST, 77657, 180602
BELT, 77658, 180605
LEGGINGS, 77659, 180606
BOOTS, 77660, 180601
BRACERS, 77661, 180608
GAUNTLETS, 77662, 180607

### DEATHKNIGHT - Dreamfire - World Drop
HELM, 77319, 183061
CHEST, 77321, 183062
BRACERS, 77325, 183065

### DEATHKNIGHT - Primal Molten - Crafted
HELM, 77328, 168744
SHOULDERS, 77329, 168746
CHEST, 77330, 168741
BELT, 77331, 168747
LEGGINGS, 77332, 168745
BOOTS, 77333, 168742
BRACERS, 77334, 168748
GAUNTLETS, 77335, 168743

### WARLOCK - Raging Tempest - The Forbidden Reach
HELM, 77272, 185704
SHOULDERS, 77273, 185706
CLOAK, 77280, 185713
CHEST, 77274, 185707
BELT, 77275, 185708
LEGGINGS, 77276, 185709
BOOTS, 77277, 185710
BRACERS, 77278, 185711
GAUNTLETS, 77279, 185712

### DEMONHUNTER - Raging Tempest - The Forbidden Reach
HELM, 77646, 185714
SHOULDERS, 77647, 185715
CLOAK, 77654, 185722
CHEST, 77648, 185716
BELT, 77649, 185717
LEGGINGS, 77650, 185718
BOOTS, 77651, 185719
BRACERS, 77652, 185720
GAUNTLETS, 77653, 185721

### EVOKER - Raging Tempest - The Forbidden Reach
HELM, 77364, 185723
SHOULDERS, 77365, 185724
CLOAK, 77372, 185731
CHEST, 77366, 185725
BELT, 77367, 185726
LEGGINGS, 77368, 185727
BOOTS, 77369, 185728
BRACERS, 77370, 185729
GAUNTLETS, 77371, 185730

### DEATHKNIGHT - Raging Tempest - The Forbidden Reach
HELM, 77319, 185732
SHOULDERS, 77320, 185737
CLOAK, 77327, 185740
CHEST, 77321, 185733
BELT, 77322, 185738
LEGGINGS, 77323, 185736
BOOTS, 77324, 185734
BRACERS, 77325, 185739
GAUNTLETS, 77326, 185735


## AUDIT
### WARLOCK - Verdant Wing - World Drop - HELM
No sources found

### WARLOCK - Verdant Wing - World Drop - SHOULDERS
No sources found

### WARLOCK - Verdant Wing - World Drop - CLOAK
No sources found

### WARLOCK - Verdant Wing - World Drop - CHEST
No sources found

### WARLOCK - Verdant Wing - World Drop - BELT
No sources found

### WARLOCK - Verdant Wing - World Drop - LEGGINGS
No sources found

### WARLOCK - Verdant Wing - World Drop - BOOTS
No sources found

### WARLOCK - Verdant Wing - World Drop - BRACERS
No sources found

### WARLOCK - Verdant Wing - World Drop - GAUNTLETS
No sources found

### EVOKER - Emerald Scale - World Drop - HELM
No sources found

### EVOKER - Emerald Scale - World Drop - SHOULDERS
No sources found

### EVOKER - Emerald Scale - World Drop - CLOAK
No sources found

### EVOKER - Emerald Scale - World Drop - CHEST
No sources found

### EVOKER - Emerald Scale - World Drop - BELT
No sources found

### EVOKER - Emerald Scale - World Drop - LEGGINGS
No sources found

### EVOKER - Emerald Scale - World Drop - BOOTS
No sources found

### EVOKER - Emerald Scale - World Drop - BRACERS
No sources found

### EVOKER - Emerald Scale - World Drop - GAUNTLETS
No sources found

### EVOKER - Flame-Touched - Crafted - CLOAK
No sources found

### DEMONHUNTER - Green Draketracker - World Drop - CLOAK
No sources found

### DEMONHUNTER - Green Draketracker - World Drop - BELT
No sources found

### DEMONHUNTER - Green Draketracker - World Drop - LEGGINGS
No sources found

### DEMONHUNTER - Green Draketracker - World Drop - BOOTS
No sources found

### DEMONHUNTER - Green Draketracker - World Drop - BRACERS
No sources found

### DEMONHUNTER - Green Draketracker - World Drop - GAUNTLETS
No sources found

### DEMONHUNTER - Life-Bound - Crafted - CLOAK
No sources found

### DEATHKNIGHT - Dreamfire - World Drop - SHOULDERS
No sources found

### DEATHKNIGHT - Dreamfire - World Drop - CLOAK
No sources found

### DEATHKNIGHT - Dreamfire - World Drop - BELT
No sources found

### DEATHKNIGHT - Dreamfire - World Drop - LEGGINGS
No sources found

### DEATHKNIGHT - Dreamfire - World Drop - BOOTS
No sources found

### DEATHKNIGHT - Dreamfire - World Drop - GAUNTLETS
No sources found

### DEATHKNIGHT - Primal Molten - Crafted - CLOAK
No sources found

```

**NOTE**: If any AppearanceId has multiple ModIds, an AUDIT block will be included in the output above. Review each AUDIT block and mark the correct ModId(s) by changing `[ ]` to `[X]`. If no ModId is marked for an AppearanceId, the `$plan` command will halt and prompt you to resolve the audit entries before proceeding.

---

## 📋 PLAN OUTPUT (Generated by $plan [ID])

> **Do not edit manually.** This section is generated from the data you provided above. Review the token group mappings and slot/difficulty assignments before proceeding to `$generate`.

### Token Groups and Class Mappings

Discerned from Extract Tokens raw output:

| Token Group Name | Classes Covered                                |
|------------------|------------------------------------------------|
| CLOTH            | PRIEST, MAGE, WARLOCK                          |
| LEATHER          | DEMONHUNTER, DRUID, MONK, ROGUE                |
| MAIL             | EVOKER, HUNTER, SHAMAN                         |
| PLATE            | DEATHKNIGHT, PALADIN, WARRIOR                  |
| UNIVERSAL        | ALL CLASSES                                    |

### Token ID Mappings

Mapping of token IDs to their difficulties and token groups:

| Token ID | Difficulties | Token Group | Slot |
|----------|--------------|-------------|------|
| 203611 | THE_FORBIDDEN_REACH | PLATE | HELM |
| 203612 | THE_FORBIDDEN_REACH | CLOTH | HELM |
| 203613 | THE_FORBIDDEN_REACH | MAIL | HELM |
| 203614 | THE_FORBIDDEN_REACH | LEATHER | HELM |
| 203615 | THE_FORBIDDEN_REACH | PLATE | CHEST |
| 203616 | THE_FORBIDDEN_REACH | CLOTH | CHEST |
| 203617 | THE_FORBIDDEN_REACH | MAIL | CHEST |
| 203618 | THE_FORBIDDEN_REACH | LEATHER | CHEST |
| 203619 | THE_FORBIDDEN_REACH | LEATHER | LEGGINGS |
| 203620 | THE_FORBIDDEN_REACH | MAIL | LEGGINGS |
| 203622 | THE_FORBIDDEN_REACH | CLOTH | LEGGINGS |
| 203623 | THE_FORBIDDEN_REACH | PLATE | LEGGINGS |
| 203626 | THE_FORBIDDEN_REACH | PLATE | SHOULDERS |
| 203627 | THE_FORBIDDEN_REACH | CLOTH | SHOULDERS |
| 203628 | THE_FORBIDDEN_REACH | MAIL | SHOULDERS |
| 203629 | THE_FORBIDDEN_REACH | LEATHER | SHOULDERS |
| 203630 | THE_FORBIDDEN_REACH | LEATHER | BRACERS |
| 203631 | THE_FORBIDDEN_REACH | MAIL | BRACERS |
| 203632 | THE_FORBIDDEN_REACH | CLOTH | BRACERS |
| 203633 | THE_FORBIDDEN_REACH | PLATE | BRACERS |
| 203634 | THE_FORBIDDEN_REACH | PLATE | BELT |
| 203635 | THE_FORBIDDEN_REACH | CLOTH | BELT |
| 203636 | THE_FORBIDDEN_REACH | MAIL | BELT |
| 203637 | THE_FORBIDDEN_REACH | LEATHER | BELT |
| 203638 | THE_FORBIDDEN_REACH | LEATHER | BOOTS |
| 203639 | THE_FORBIDDEN_REACH | MAIL | BOOTS |
| 203640 | THE_FORBIDDEN_REACH | PLATE | BOOTS |
| 203641 | THE_FORBIDDEN_REACH | CLOTH | BOOTS |
| 203642 | THE_FORBIDDEN_REACH | CLOTH | GAUNTLETS |
| 203643 | THE_FORBIDDEN_REACH | PLATE | GAUNTLETS |
| 203644 | THE_FORBIDDEN_REACH | MAIL | GAUNTLETS |
| 203645 | THE_FORBIDDEN_REACH | LEATHER | GAUNTLETS |
| 203646 | THE_FORBIDDEN_REACH | CLOTH | CLOAK |
| 203646 | THE_FORBIDDEN_REACH | LEATHER | CLOAK |
| 203646 | THE_FORBIDDEN_REACH | MAIL | CLOAK |
| 203646 | THE_FORBIDDEN_REACH | PLATE | CLOAK |

### Appearance Data by Token Group, Class, Difficulty, Slot

```
### CLOTH - PRIEST - THE_FORBIDDEN_REACH
HELM, 77272, 185704
SHOULDERS, 77273, 185706
CLOAK, 77280, 185713
CHEST, 77274, 185707
BELT, 77275, 185708
LEGGINGS, 77276, 185709
BOOTS, 77277, 185710
BRACERS, 77278, 185711
GAUNTLETS, 77279, 185712

### CLOTH - MAGE - THE_FORBIDDEN_REACH
HELM, 77272, 185704
SHOULDERS, 77273, 185706
CLOAK, 77280, 185713
CHEST, 77274, 185707
BELT, 77275, 185708
LEGGINGS, 77276, 185709
BOOTS, 77277, 185710
BRACERS, 77278, 185711
GAUNTLETS, 77279, 185712

### CLOTH - WARLOCK - THE_FORBIDDEN_REACH
HELM, 77272, 185704
SHOULDERS, 77273, 185706
CLOAK, 77280, 185713
CHEST, 77274, 185707
BELT, 77275, 185708
LEGGINGS, 77276, 185709
BOOTS, 77277, 185710
BRACERS, 77278, 185711
GAUNTLETS, 77279, 185712

### LEATHER - DEMONHUNTER - THE_FORBIDDEN_REACH
HELM, 77646, 185714
SHOULDERS, 77647, 185715
CLOAK, 77654, 185722
CHEST, 77648, 185716
BELT, 77649, 185717
LEGGINGS, 77650, 185718
BOOTS, 77651, 185719
BRACERS, 77652, 185720
GAUNTLETS, 77653, 185721

### LEATHER - DRUID - THE_FORBIDDEN_REACH
HELM, 77646, 185714
SHOULDERS, 77647, 185715
CLOAK, 77654, 185722
CHEST, 77648, 185716
BELT, 77649, 185717
LEGGINGS, 77650, 185718
BOOTS, 77651, 185719
BRACERS, 77652, 185720
GAUNTLETS, 77653, 185721

### LEATHER - MONK - THE_FORBIDDEN_REACH
HELM, 77646, 185714
SHOULDERS, 77647, 185715
CLOAK, 77654, 185722
CHEST, 77648, 185716
BELT, 77649, 185717
LEGGINGS, 77650, 185718
BOOTS, 77651, 185719
BRACERS, 77652, 185720
GAUNTLETS, 77653, 185721

### LEATHER - ROGUE - THE_FORBIDDEN_REACH
HELM, 77646, 185714
SHOULDERS, 77647, 185715
CLOAK, 77654, 185722
CHEST, 77648, 185716
BELT, 77649, 185717
LEGGINGS, 77650, 185718
BOOTS, 77651, 185719
BRACERS, 77652, 185720
GAUNTLETS, 77653, 185721

### MAIL - EVOKER - THE_FORBIDDEN_REACH
HELM, 77364, 185723
SHOULDERS, 77365, 185724
CLOAK, 77372, 185731
CHEST, 77366, 185725
BELT, 77367, 185726
LEGGINGS, 77368, 185727
BOOTS, 77369, 185728
BRACERS, 77370, 185729
GAUNTLETS, 77371, 185730

### MAIL - HUNTER - THE_FORBIDDEN_REACH
HELM, 77364, 185723
SHOULDERS, 77365, 185724
CLOAK, 77372, 185731
CHEST, 77366, 185725
BELT, 77367, 185726
LEGGINGS, 77368, 185727
BOOTS, 77369, 185728
BRACERS, 77370, 185729
GAUNTLETS, 77371, 185730

### MAIL - SHAMAN - THE_FORBIDDEN_REACH
HELM, 77364, 185723
SHOULDERS, 77365, 185724
CLOAK, 77372, 185731
CHEST, 77366, 185725
BELT, 77367, 185726
LEGGINGS, 77368, 185727
BOOTS, 77369, 185728
BRACERS, 77370, 185729
GAUNTLETS, 77371, 185730

### PLATE - DEATHKNIGHT - THE_FORBIDDEN_REACH
HELM, 77319, 185732
SHOULDERS, 77320, 185737
CLOAK, 77327, 185740
CHEST, 77321, 185733
BELT, 77322, 185738
LEGGINGS, 77323, 185736
BOOTS, 77324, 185734
BRACERS, 77325, 185739
GAUNTLETS, 77326, 185735

### PLATE - PALADIN - THE_FORBIDDEN_REACH
HELM, 77319, 185732
SHOULDERS, 77320, 185737
CLOAK, 77327, 185740
CHEST, 77321, 185733
BELT, 77322, 185738
LEGGINGS, 77323, 185736
BOOTS, 77324, 185734
BRACERS, 77325, 185739
GAUNTLETS, 77326, 185735

### PLATE - WARRIOR - THE_FORBIDDEN_REACH
HELM, 77319, 185732
SHOULDERS, 77320, 185737
CLOAK, 77327, 185740
CHEST, 77321, 185733
BELT, 77322, 185738
LEGGINGS, 77323, 185736
BOOTS, 77324, 185734
BRACERS, 77325, 185739
GAUNTLETS, 77326, 185735
```

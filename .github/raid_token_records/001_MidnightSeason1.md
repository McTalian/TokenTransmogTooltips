# New Raid Data Template

> **Incremental Workflow**: Fill sections progressively, then use `/tttgen` output to populate Appearance/ModID data. Focus your time on gathering IDs from in-game sources.

## 👤 USER: Raid Information

**Raid Name**: MidnightSeason1
**Raid Abbreviation**: MS1
**Release Patch**: 12.0.1
**Has Curio/Wildcard Token**: Yes
**Faction-Specific Tokens**: No
**Other Special Considerations**:
- This is spread across 3 raids
- one raid drops the helm, shoulders, gauntlets, leggings tokens
- one raid drops the chest token with slightly different token naming schema (e.g. "Alnwoven" instead of "Voidwoven", but the *woven part is consistent and the same class compositions)
  - I'd recommend something like `_woven`, `_forged`, `_cast`, `_cured` for the folder and token group names so both variations can be represented under the same token group umbrella
- one raid drops the curio/wildcard token

---

## 👤 USER: DungeonJournal Extract Tokens Output

Open the DungeonJournal in-game with an alpha build of TokenTransmogTooltips. Navigate to the raid, select "All Classes" filter and select a Difficulty in the dropdown. Click the "Extract Tokens" button to copy the token data to your clipboard. Paste the output below. Repeat the process for each difficulty.


**Extract Tokens Output**:
```
-- Extracted Token Data (Difficulty: RAID_FINDER) --
-- Format: [ITEMID] - Token Name - SLOT - DIFFICULTY(ItemCreationContext) -- [Classes]

[249361] - Voidcast Corrupted Nullcore - LEGGINGS - RAID_FINDER(4) -- Classes: Hunter, Shaman, Evoker
[249357] - Voidcast Fanatical Nullcore - HELM - RAID_FINDER(4) -- Classes: Hunter, Shaman, Evoker
[249353] - Voidcast Hungering Nullcore - GAUNTLETS - RAID_FINDER(4) -- Classes: Hunter, Shaman, Evoker
[249365] - Voidcast Unraveled Nullcore - SHOULDERS - RAID_FINDER(4) -- Classes: Hunter, Shaman, Evoker
[249360] - Voidcured Corrupted Nullcore - LEGGINGS - RAID_FINDER(4) -- Classes: Rogue, Monk, Druid, Demon Hunter
[249356] - Voidcured Fanatical Nullcore - HELM - RAID_FINDER(4) -- Classes: Rogue, Monk, Druid, Demon Hunter
[249352] - Voidcured Hungering Nullcore - GAUNTLETS - RAID_FINDER(4) -- Classes: Rogue, Monk, Druid, Demon Hunter
[249364] - Voidcured Unraveled Nullcore - SHOULDERS - RAID_FINDER(4) -- Classes: Rogue, Monk, Druid, Demon Hunter
[249362] - Voidforged Corrupted Nullcore - LEGGINGS - RAID_FINDER(4) -- Classes: Warrior, Paladin, Death Knight
[249358] - Voidforged Fanatical Nullcore - HELM - RAID_FINDER(4) -- Classes: Warrior, Paladin, Death Knight
[249354] - Voidforged Hungering Nullcore - GAUNTLETS - RAID_FINDER(4) -- Classes: Warrior, Paladin, Death Knight
[249366] - Voidforged Unraveled Nullcore - SHOULDERS - RAID_FINDER(4) -- Classes: Warrior, Paladin, Death Knight
[249359] - Voidwoven Corrupted Nullcore - LEGGINGS - RAID_FINDER(4) -- Classes: Priest, Mage, Warlock
[249355] - Voidwoven Fanatical Nullcore - HELM - RAID_FINDER(4) -- Classes: Priest, Mage, Warlock
[249351] - Voidwoven Hungering Nullcore - GAUNTLETS - RAID_FINDER(4) -- Classes: Priest, Mage, Warlock
[249363] - Voidwoven Unraveled Nullcore - SHOULDERS - RAID_FINDER(4) -- Classes: Priest, Mage, Warlock

-- Total tokens found: 16

-- Extracted Token Data (Difficulty: NORMAL) --
-- Format: [ITEMID] - Token Name - SLOT - DIFFICULTY(ItemCreationContext) -- [Classes]

[249361] - Voidcast Corrupted Nullcore - LEGGINGS - NORMAL(3) -- Classes: Hunter, Shaman, Evoker
[249357] - Voidcast Fanatical Nullcore - HELM - NORMAL(3) -- Classes: Hunter, Shaman, Evoker
[249353] - Voidcast Hungering Nullcore - GAUNTLETS - NORMAL(3) -- Classes: Hunter, Shaman, Evoker
[249365] - Voidcast Unraveled Nullcore - SHOULDERS - NORMAL(3) -- Classes: Hunter, Shaman, Evoker
[249360] - Voidcured Corrupted Nullcore - LEGGINGS - NORMAL(3) -- Classes: Rogue, Monk, Druid, Demon Hunter
[249356] - Voidcured Fanatical Nullcore - HELM - NORMAL(3) -- Classes: Rogue, Monk, Druid, Demon Hunter
[249352] - Voidcured Hungering Nullcore - GAUNTLETS - NORMAL(3) -- Classes: Rogue, Monk, Druid, Demon Hunter
[249364] - Voidcured Unraveled Nullcore - SHOULDERS - NORMAL(3) -- Classes: Rogue, Monk, Druid, Demon Hunter
[249362] - Voidforged Corrupted Nullcore - LEGGINGS - NORMAL(3) -- Classes: Warrior, Paladin, Death Knight
[249358] - Voidforged Fanatical Nullcore - HELM - NORMAL(3) -- Classes: Warrior, Paladin, Death Knight
[249354] - Voidforged Hungering Nullcore - GAUNTLETS - NORMAL(3) -- Classes: Warrior, Paladin, Death Knight
[249366] - Voidforged Unraveled Nullcore - SHOULDERS - NORMAL(3) -- Classes: Warrior, Paladin, Death Knight
[249359] - Voidwoven Corrupted Nullcore - LEGGINGS - NORMAL(3) -- Classes: Priest, Mage, Warlock
[249355] - Voidwoven Fanatical Nullcore - HELM - NORMAL(3) -- Classes: Priest, Mage, Warlock
[249351] - Voidwoven Hungering Nullcore - GAUNTLETS - NORMAL(3) -- Classes: Priest, Mage, Warlock
[249363] - Voidwoven Unraveled Nullcore - SHOULDERS - NORMAL(3) -- Classes: Priest, Mage, Warlock

-- Total tokens found: 16

-- Extracted Token Data (Difficulty: HEROIC) --
-- Format: [ITEMID] - Token Name - SLOT - DIFFICULTY(ItemCreationContext) -- [Classes]

[249361] - Voidcast Corrupted Nullcore - LEGGINGS - HEROIC(5) -- Classes: Hunter, Shaman, Evoker
[249357] - Voidcast Fanatical Nullcore - HELM - HEROIC(5) -- Classes: Hunter, Shaman, Evoker
[249353] - Voidcast Hungering Nullcore - GAUNTLETS - HEROIC(5) -- Classes: Hunter, Shaman, Evoker
[249365] - Voidcast Unraveled Nullcore - SHOULDERS - HEROIC(5) -- Classes: Hunter, Shaman, Evoker
[249360] - Voidcured Corrupted Nullcore - LEGGINGS - HEROIC(5) -- Classes: Rogue, Monk, Druid, Demon Hunter
[249356] - Voidcured Fanatical Nullcore - HELM - HEROIC(5) -- Classes: Rogue, Monk, Druid, Demon Hunter
[249352] - Voidcured Hungering Nullcore - GAUNTLETS - HEROIC(5) -- Classes: Rogue, Monk, Druid, Demon Hunter
[249364] - Voidcured Unraveled Nullcore - SHOULDERS - HEROIC(5) -- Classes: Rogue, Monk, Druid, Demon Hunter
[249362] - Voidforged Corrupted Nullcore - LEGGINGS - HEROIC(5) -- Classes: Warrior, Paladin, Death Knight
[249358] - Voidforged Fanatical Nullcore - HELM - HEROIC(5) -- Classes: Warrior, Paladin, Death Knight
[249354] - Voidforged Hungering Nullcore - GAUNTLETS - HEROIC(5) -- Classes: Warrior, Paladin, Death Knight
[249366] - Voidforged Unraveled Nullcore - SHOULDERS - HEROIC(5) -- Classes: Warrior, Paladin, Death Knight
[249359] - Voidwoven Corrupted Nullcore - LEGGINGS - HEROIC(5) -- Classes: Priest, Mage, Warlock
[249355] - Voidwoven Fanatical Nullcore - HELM - HEROIC(5) -- Classes: Priest, Mage, Warlock
[249351] - Voidwoven Hungering Nullcore - GAUNTLETS - HEROIC(5) -- Classes: Priest, Mage, Warlock
[249363] - Voidwoven Unraveled Nullcore - SHOULDERS - HEROIC(5) -- Classes: Priest, Mage, Warlock

-- Total tokens found: 16

-- Extracted Token Data (Difficulty: MYTHIC) --
-- Format: [ITEMID] - Token Name - SLOT - DIFFICULTY(ItemCreationContext) -- [Classes]

[249361] - Voidcast Corrupted Nullcore - LEGGINGS - MYTHIC(6) -- Classes: Hunter, Shaman, Evoker
[249357] - Voidcast Fanatical Nullcore - HELM - MYTHIC(6) -- Classes: Hunter, Shaman, Evoker
[249353] - Voidcast Hungering Nullcore - GAUNTLETS - MYTHIC(6) -- Classes: Hunter, Shaman, Evoker
[249365] - Voidcast Unraveled Nullcore - SHOULDERS - MYTHIC(6) -- Classes: Hunter, Shaman, Evoker
[249360] - Voidcured Corrupted Nullcore - LEGGINGS - MYTHIC(6) -- Classes: Rogue, Monk, Druid, Demon Hunter
[249356] - Voidcured Fanatical Nullcore - HELM - MYTHIC(6) -- Classes: Rogue, Monk, Druid, Demon Hunter
[249352] - Voidcured Hungering Nullcore - GAUNTLETS - MYTHIC(6) -- Classes: Rogue, Monk, Druid, Demon Hunter
[249364] - Voidcured Unraveled Nullcore - SHOULDERS - MYTHIC(6) -- Classes: Rogue, Monk, Druid, Demon Hunter
[249362] - Voidforged Corrupted Nullcore - LEGGINGS - MYTHIC(6) -- Classes: Warrior, Paladin, Death Knight
[249358] - Voidforged Fanatical Nullcore - HELM - MYTHIC(6) -- Classes: Warrior, Paladin, Death Knight
[249354] - Voidforged Hungering Nullcore - GAUNTLETS - MYTHIC(6) -- Classes: Warrior, Paladin, Death Knight
[249366] - Voidforged Unraveled Nullcore - SHOULDERS - MYTHIC(6) -- Classes: Warrior, Paladin, Death Knight
[249359] - Voidwoven Corrupted Nullcore - LEGGINGS - MYTHIC(6) -- Classes: Priest, Mage, Warlock
[249355] - Voidwoven Fanatical Nullcore - HELM - MYTHIC(6) -- Classes: Priest, Mage, Warlock
[249351] - Voidwoven Hungering Nullcore - GAUNTLETS - MYTHIC(6) -- Classes: Priest, Mage, Warlock
[249363] - Voidwoven Unraveled Nullcore - SHOULDERS - MYTHIC(6) -- Classes: Priest, Mage, Warlock

-- Total tokens found: 16

-- Extracted Token Data (Difficulty: RAID_FINDER) --
-- Format: [ITEMID] - Token Name - SLOT - DIFFICULTY(ItemCreationContext) -- [Classes]

[249349] - Alncast Riftbloom - CHEST - RAID_FINDER(4) -- Classes: Hunter, Shaman, Evoker
[249348] - Alncured Riftbloom - CHEST - RAID_FINDER(4) -- Classes: Rogue, Monk, Druid, Demon Hunter
[249350] - Alnforged Riftbloom - CHEST - RAID_FINDER(4) -- Classes: Warrior, Paladin, Death Knight
[249347] - Alnwoven Riftbloom - CHEST - RAID_FINDER(4) -- Classes: Priest, Mage, Warlock

-- Total tokens found: 4

-- Extracted Token Data (Difficulty: NORMAL) --
-- Format: [ITEMID] - Token Name - SLOT - DIFFICULTY(ItemCreationContext) -- [Classes]

[249349] - Alncast Riftbloom - CHEST - NORMAL(3) -- Classes: Hunter, Shaman, Evoker
[249348] - Alncured Riftbloom - CHEST - NORMAL(3) -- Classes: Rogue, Monk, Druid, Demon Hunter
[249350] - Alnforged Riftbloom - CHEST - NORMAL(3) -- Classes: Warrior, Paladin, Death Knight
[249347] - Alnwoven Riftbloom - CHEST - NORMAL(3) -- Classes: Priest, Mage, Warlock

-- Total tokens found: 4

-- Extracted Token Data (Difficulty: HEROIC) --
-- Format: [ITEMID] - Token Name - SLOT - DIFFICULTY(ItemCreationContext) -- [Classes]

[249349] - Alncast Riftbloom - CHEST - HEROIC(5) -- Classes: Hunter, Shaman, Evoker
[249348] - Alncured Riftbloom - CHEST - HEROIC(5) -- Classes: Rogue, Monk, Druid, Demon Hunter
[249350] - Alnforged Riftbloom - CHEST - HEROIC(5) -- Classes: Warrior, Paladin, Death Knight
[249347] - Alnwoven Riftbloom - CHEST - HEROIC(5) -- Classes: Priest, Mage, Warlock

-- Total tokens found: 4

-- Extracted Token Data (Difficulty: MYTHIC) --
-- Format: [ITEMID] - Token Name - SLOT - DIFFICULTY(ItemCreationContext) -- [Classes]

[249349] - Alncast Riftbloom - CHEST - MYTHIC(6) -- Classes: Hunter, Shaman, Evoker
[249348] - Alncured Riftbloom - CHEST - MYTHIC(6) -- Classes: Rogue, Monk, Druid, Demon Hunter
[249350] - Alnforged Riftbloom - CHEST - MYTHIC(6) -- Classes: Warrior, Paladin, Death Knight
[249347] - Alnwoven Riftbloom - CHEST - MYTHIC(6) -- Classes: Priest, Mage, Warlock

-- Total tokens found: 4

-- Extracted Token Data (Difficulty: RAID_FINDER) --
-- Format: [ITEMID] - Token Name - SLOT - DIFFICULTY(ItemCreationContext) -- [Classes]

[249367] - Chiming Void Curio - ALL - RAID_FINDER(4)

-- Total tokens found: 1

-- Extracted Token Data (Difficulty: NORMAL) --
-- Format: [ITEMID] - Token Name - SLOT - DIFFICULTY(ItemCreationContext) -- [Classes]

[249367] - Chiming Void Curio - ALL - NORMAL(3)

-- Total tokens found: 1

-- Extracted Token Data (Difficulty: HEROIC) --
-- Format: [ITEMID] - Token Name - SLOT - DIFFICULTY(ItemCreationContext) -- [Classes]

[249367] - Chiming Void Curio - ALL - HEROIC(5)

-- Total tokens found: 1

-- Extracted Token Data (Difficulty: MYTHIC) --
-- Format: [ITEMID] - Token Name - SLOT - DIFFICULTY(ItemCreationContext) -- [Classes]

[249367] - Chiming Void Curio - ALL - MYTHIC(6)

-- Total tokens found: 1

```

---

## 👤 USER: /tttgen Transmog Set Appearance Data Output

With an alpha build of TokenTransmogTooltips, run `/tttgen` in the chat window. A modal will appear where you provide a "label" (usually corresponds to the raid name, cross-reference with one of the class sets in the Transmog Sets UI). After entering the label, select which gear slots have tokens and click "Generate Data". Copy the output and paste the output below:

```
=== Data for 'The Voidspire' ===

## TEMPLATE
### DEATHKNIGHT - Relentless Rider's Lament - Raid Finder
HELM, 125672, 296659
SHOULDERS, 125673, 296635
CHEST, 125674, 296695
LEGGINGS, 125676, 296647
GAUNTLETS, 125679, 296671

### DEATHKNIGHT - Relentless Rider's Lament - Normal
HELM, 125620, 296654
SHOULDERS, 125621, 296630
CHEST, 125622, 296690
LEGGINGS, 125624, 296642
GAUNTLETS, 125627, 296666

### DEATHKNIGHT - Relentless Rider's Lament - Heroic
HELM, 125633, 296660
SHOULDERS, 125634, 296636
CHEST, 125635, 296696
LEGGINGS, 125637, 296648
GAUNTLETS, 125640, 296672

### DEATHKNIGHT - Relentless Rider's Lament - Mythic
HELM, 125669, 296661
SHOULDERS, 125670, 296637
CHEST, 125661, 296697
LEGGINGS, 125663, 296649
GAUNTLETS, 125666, 296673

### DEMONHUNTER - Devouring Reaver's Sheathe - Raid Finder
HELM, 124245, 297415
SHOULDERS, 124246, 297391
CHEST, 124247, 297451
LEGGINGS, 124249, 297403
GAUNTLETS, 124252, 297427

### DEMONHUNTER - Devouring Reaver's Sheathe - Normal
HELM, 124185, 297410
SHOULDERS, 124186, 297386
CHEST, 124187, 297446
LEGGINGS, 124189, 297398
GAUNTLETS, 124192, 297422

### DEMONHUNTER - Devouring Reaver's Sheathe - Heroic
HELM, 124209, 297416
SHOULDERS, 124210, 297392
CHEST, 124211, 297452
LEGGINGS, 124213, 297404
GAUNTLETS, 124216, 297428

### DEMONHUNTER - Devouring Reaver's Sheathe - Mythic
HELM, 124206, 297417
SHOULDERS, 124207, 297393
CHEST, 124199, 297453
LEGGINGS, 124201, 297405
GAUNTLETS, 124204, 297429

### DRUID - Sprouts of the Luminous Bloom - Raid Finder
HELM, 126723, 297307
SHOULDERS, 126724, 297283
CHEST, 126725, 297343
LEGGINGS, 126727, 297295
GAUNTLETS, 126730, 297319

### DRUID - Sprouts of the Luminous Bloom - Normal
HELM, 126759, 297302
SHOULDERS, 126760, 297278
CHEST, 126761, 297338
LEGGINGS, 126763, 297290
GAUNTLETS, 126766, 297314

### DRUID - Sprouts of the Luminous Bloom - Heroic
HELM, 126711, 297308
SHOULDERS, 126712, 297284
CHEST, 126713, 297344
LEGGINGS, 126715, 297296
GAUNTLETS, 126718, 297320

### DRUID - Sprouts of the Luminous Bloom - Mythic
HELM, 126757, 297309
SHOULDERS, 126758, 297285
CHEST, 126749, 297345
LEGGINGS, 126751, 297297
GAUNTLETS, 126754, 297321

### EVOKER - Livery of the Black Talon - Raid Finder
HELM, 126201, 296983
SHOULDERS, 126202, 296959
CHEST, 126203, 297019
LEGGINGS, 126205, 296971
GAUNTLETS, 126208, 296995

### EVOKER - Livery of the Black Talon - Normal
HELM, 126228, 296978
SHOULDERS, 126229, 296954
CHEST, 126211, 297014
LEGGINGS, 126213, 296966
GAUNTLETS, 126216, 296990

### EVOKER - Livery of the Black Talon - Heroic
HELM, 126191, 296984
SHOULDERS, 126192, 296960
CHEST, 126193, 297020
LEGGINGS, 126195, 296972
GAUNTLETS, 126198, 296996

### EVOKER - Livery of the Black Talon - Mythic
HELM, 126218, 296985
SHOULDERS, 126227, 296961
CHEST, 126220, 297021
LEGGINGS, 126222, 296973
GAUNTLETS, 126225, 296997

### HUNTER - Primal Sentry's Camouflage - Raid Finder
HELM, 125960, 296875
SHOULDERS, 125961, 296851
CHEST, 125962, 296911
LEGGINGS, 125964, 296863
GAUNTLETS, 125967, 296887

### HUNTER - Primal Sentry's Camouflage - Normal
HELM, 125996, 296870
SHOULDERS, 125997, 296846
CHEST, 125998, 296906
LEGGINGS, 126000, 296858
GAUNTLETS, 126003, 296882

### HUNTER - Primal Sentry's Camouflage - Heroic
HELM, 125948, 296876
SHOULDERS, 125949, 296852
CHEST, 125950, 296912
LEGGINGS, 125952, 296864
GAUNTLETS, 125955, 296888

### HUNTER - Primal Sentry's Camouflage - Mythic
HELM, 125993, 296877
SHOULDERS, 125994, 296853
CHEST, 125986, 296913
LEGGINGS, 125988, 296865
GAUNTLETS, 126122, 296889

### MAGE - Voidbreaker's Accordance - Raid Finder
HELM, 125444, 297739
SHOULDERS, 125445, 297715
CHEST, 125446, 297775
LEGGINGS, 125448, 297727
GAUNTLETS, 125451, 297751

### MAGE - Voidbreaker's Accordance - Normal
HELM, 125408, 297734
SHOULDERS, 125409, 297710
CHEST, 125410, 297770
LEGGINGS, 125412, 297722
GAUNTLETS, 125415, 297746

### MAGE - Voidbreaker's Accordance - Heroic
HELM, 125456, 297740
SHOULDERS, 125457, 297716
CHEST, 125458, 297776
LEGGINGS, 125460, 297728
GAUNTLETS, 125463, 297752

### MAGE - Voidbreaker's Accordance - Mythic
HELM, 125442, 297741
SHOULDERS, 125443, 297717
CHEST, 125434, 297777
LEGGINGS, 125436, 297729
GAUNTLETS, 125439, 297753

### MONK - Way of Ra-den's Chosen - Raid Finder
HELM, 125595, 297199
SHOULDERS, 125596, 297175
CHEST, 125597, 297235
LEGGINGS, 125599, 297187
GAUNTLETS, 125602, 297211

### MONK - Way of Ra-den's Chosen - Normal
HELM, 125535, 297194
SHOULDERS, 125536, 297170
CHEST, 125537, 297230
LEGGINGS, 125539, 297182
GAUNTLETS, 125542, 297206

### MONK - Way of Ra-den's Chosen - Heroic
HELM, 125559, 297200
SHOULDERS, 125560, 297176
CHEST, 125561, 297236
LEGGINGS, 125563, 297188
GAUNTLETS, 125566, 297212

### MONK - Way of Ra-den's Chosen - Mythic
HELM, 125580, 297201
SHOULDERS, 125581, 297177
CHEST, 125573, 297237
LEGGINGS, 125575, 297189
GAUNTLETS, 125578, 297213

### PALADIN - Luminant Verdict's Vestments - Raid Finder
HELM, 127392, 296551
SHOULDERS, 127393, 296527
CHEST, 127394, 296587
LEGGINGS, 127396, 296539
GAUNTLETS, 127399, 296563

### PALADIN - Luminant Verdict's Vestments - Normal
HELM, 127381, 296546
SHOULDERS, 127382, 296522
CHEST, 127383, 296582
LEGGINGS, 127385, 296534
GAUNTLETS, 127388, 296558

### PALADIN - Luminant Verdict's Vestments - Heroic
HELM, 127348, 296552
SHOULDERS, 127349, 296528
CHEST, 127350, 296588
LEGGINGS, 127352, 296540
GAUNTLETS, 127355, 296564

### PALADIN - Luminant Verdict's Vestments - Mythic
HELM, 127379, 296553
SHOULDERS, 127380, 296529
CHEST, 127372, 296589
LEGGINGS, 127374, 296541
GAUNTLETS, 127377, 296565

### PRIEST - Blind Oath's Burden - Raid Finder
HELM, 126918, 297631
SHOULDERS, 126919, 297607
CHEST, 126920, 297667
LEGGINGS, 126922, 297619
GAUNTLETS, 126925, 297643

### PRIEST - Blind Oath's Burden - Normal
HELM, 126906, 297626
SHOULDERS, 126907, 297602
CHEST, 126908, 297662
LEGGINGS, 126910, 297614
GAUNTLETS, 126913, 297638

### PRIEST - Blind Oath's Burden - Heroic
HELM, 126930, 297632
SHOULDERS, 126931, 297608
CHEST, 126932, 297668
LEGGINGS, 126934, 297620
GAUNTLETS, 126937, 297644

### PRIEST - Blind Oath's Burden - Mythic
HELM, 126964, 297633
SHOULDERS, 126965, 297609
CHEST, 126956, 297669
LEGGINGS, 126958, 297621
GAUNTLETS, 126961, 297645

### ROGUE - Motley of the Grim Jest - Raid Finder
HELM, 123453, 297091
SHOULDERS, 123454, 297067
CHEST, 123455, 297127
LEGGINGS, 123457, 297079
GAUNTLETS, 123460, 297103

### ROGUE - Motley of the Grim Jest - Normal
HELM, 123475, 297086
SHOULDERS, 123476, 297062
CHEST, 123477, 297122
LEGGINGS, 123479, 297074
GAUNTLETS, 123482, 297098

### ROGUE - Motley of the Grim Jest - Heroic
HELM, 123442, 297092
SHOULDERS, 123443, 297068
CHEST, 123444, 297128
LEGGINGS, 123446, 297080
GAUNTLETS, 123449, 297104

### ROGUE - Motley of the Grim Jest - Mythic
HELM, 123440, 297093
SHOULDERS, 123441, 297069
CHEST, 123433, 297129
LEGGINGS, 123435, 297081
GAUNTLETS, 123438, 297105

### SHAMAN - Mantle of the Primal Core - Raid Finder
HELM, 127113, 296767
SHOULDERS, 127114, 296743
CHEST, 127115, 296800
LEGGINGS, 127117, 296752
GAUNTLETS, 127120, 296779

### SHAMAN - Mantle of the Primal Core - Normal
HELM, 127101, 296762
SHOULDERS, 127102, 296738
CHEST, 127103, 296801
LEGGINGS, 127105, 296753
GAUNTLETS, 127108, 296774

### SHAMAN - Mantle of the Primal Core - Heroic
HELM, 127077, 296768
SHOULDERS, 127078, 296744
CHEST, 127079, 296802
LEGGINGS, 127081, 296754
GAUNTLETS, 127084, 296780

### SHAMAN - Mantle of the Primal Core - Mythic
HELM, 127099, 296769
SHOULDERS, 127100, 296745
CHEST, 127091, 296803
LEGGINGS, 127093, 296755
GAUNTLETS, 127096, 296781

### WARLOCK - Reign of the Abyssal Immolator - Raid Finder
HELM, 126544, 297523
SHOULDERS, 126545, 297499
CHEST, 126546, 297559
LEGGINGS, 126548, 297511
GAUNTLETS, 126551, 297535

### WARLOCK - Reign of the Abyssal Immolator - Normal
HELM, 126511, 297518
SHOULDERS, 126512, 297494
CHEST, 126513, 297554
LEGGINGS, 126515, 297506
GAUNTLETS, 126518, 297530

### WARLOCK - Reign of the Abyssal Immolator - Heroic
HELM, 126500, 297524
SHOULDERS, 126501, 297500
CHEST, 126502, 297560
LEGGINGS, 126504, 297512
GAUNTLETS, 126507, 297536

### WARLOCK - Reign of the Abyssal Immolator - Mythic
HELM, 126498, 297525
SHOULDERS, 126499, 297501
CHEST, 126491, 297561
LEGGINGS, 126493, 297513
GAUNTLETS, 126496, 297537

### WARRIOR - Rage of the Night Ender - Raid Finder
HELM, 127337, 296443
SHOULDERS, 127338, 296419
CHEST, 127339, 296479
LEGGINGS, 127341, 296431
GAUNTLETS, 127344, 296455

### WARRIOR - Rage of the Night Ender - Normal
HELM, 127326, 296438
SHOULDERS, 127327, 296414
CHEST, 127328, 296474
LEGGINGS, 127330, 296426
GAUNTLETS, 127333, 296450

### WARRIOR - Rage of the Night Ender - Heroic
HELM, 127293, 296444
SHOULDERS, 127294, 296420
CHEST, 127295, 296480
LEGGINGS, 127297, 296432
GAUNTLETS, 127300, 296456

### WARRIOR - Rage of the Night Ender - Mythic
HELM, 127291, 296445
SHOULDERS, 127292, 296421
CHEST, 127284, 296481
LEGGINGS, 127286, 296433
GAUNTLETS, 127289, 296457


## AUDIT
### DEATHKNIGHT - Relentless Rider's Lament - Raid Finder - HELM
[ ] sourceIndex=1, setID=5417, appearanceID=125672, modID=296101, name=Crown of the Fractured Tyrant
[X] sourceIndex=2, setID=5417, appearanceID=125672, modID=296659, name=Relentless Rider's Crown

### DEATHKNIGHT - Relentless Rider's Lament - Raid Finder - LEGGINGS
[ ] sourceIndex=1, setID=5417, appearanceID=125676, modID=296353, name=Extinction Guards
[X] sourceIndex=2, setID=5417, appearanceID=125676, modID=296647, name=Relentless Rider's Legguards

### DEATHKNIGHT - Relentless Rider's Lament - Normal - HELM
[ ] sourceIndex=1, setID=5418, appearanceID=125620, modID=296100, name=Crown of the Fractured Tyrant
[X] sourceIndex=2, setID=5418, appearanceID=125620, modID=296654, name=Relentless Rider's Crown

### DEATHKNIGHT - Relentless Rider's Lament - Normal - LEGGINGS
[ ] sourceIndex=1, setID=5418, appearanceID=125624, modID=296352, name=Extinction Guards
[X] sourceIndex=2, setID=5418, appearanceID=125624, modID=296642, name=Relentless Rider's Legguards

### DEATHKNIGHT - Relentless Rider's Lament - Heroic - HELM
[ ] sourceIndex=1, setID=5419, appearanceID=125633, modID=296102, name=Crown of the Fractured Tyrant
[X] sourceIndex=2, setID=5419, appearanceID=125633, modID=296660, name=Relentless Rider's Crown

### DEATHKNIGHT - Relentless Rider's Lament - Heroic - LEGGINGS
[ ] sourceIndex=1, setID=5419, appearanceID=125637, modID=296354, name=Extinction Guards
[X] sourceIndex=2, setID=5419, appearanceID=125637, modID=296648, name=Relentless Rider's Legguards

### DEATHKNIGHT - Relentless Rider's Lament - Mythic - HELM
[ ] sourceIndex=1, setID=5420, appearanceID=125669, modID=296103, name=Crown of the Fractured Tyrant
[X] sourceIndex=2, setID=5420, appearanceID=125669, modID=296661, name=Relentless Rider's Crown

### DEATHKNIGHT - Relentless Rider's Lament - Mythic - LEGGINGS
[ ] sourceIndex=1, setID=5420, appearanceID=125663, modID=296355, name=Extinction Guards
[X] sourceIndex=2, setID=5420, appearanceID=125663, modID=296649, name=Relentless Rider's Legguards

### DEMONHUNTER - Devouring Reaver's Sheathe - Raid Finder - HELM
[ ] sourceIndex=1, setID=5421, appearanceID=124245, modID=296061, name=Devouring Night's Visage
[X] sourceIndex=2, setID=5421, appearanceID=124245, modID=297415, name=Devouring Reaver's Intake

### DEMONHUNTER - Devouring Reaver's Sheathe - Normal - HELM
[ ] sourceIndex=1, setID=5422, appearanceID=124185, modID=296060, name=Devouring Night's Visage
[X] sourceIndex=2, setID=5422, appearanceID=124185, modID=297410, name=Devouring Reaver's Intake

### DEMONHUNTER - Devouring Reaver's Sheathe - Heroic - HELM
[ ] sourceIndex=1, setID=5423, appearanceID=124209, modID=296062, name=Devouring Night's Visage
[X] sourceIndex=2, setID=5423, appearanceID=124209, modID=297416, name=Devouring Reaver's Intake

### DEMONHUNTER - Devouring Reaver's Sheathe - Mythic - HELM
[ ] sourceIndex=1, setID=5424, appearanceID=124206, modID=296063, name=Devouring Night's Visage
[X] sourceIndex=2, setID=5424, appearanceID=124206, modID=297417, name=Devouring Reaver's Intake

### DRUID - Sprouts of the Luminous Bloom - Raid Finder - SHOULDERS
[ ] sourceIndex=1, setID=5425, appearanceID=126724, modID=296169, name=Blooming Barklight Spaulders
[X] sourceIndex=2, setID=5425, appearanceID=126724, modID=297283, name=Seedpods of the Luminous Bloom

### DRUID - Sprouts of the Luminous Bloom - Raid Finder - GAUNTLETS
[ ] sourceIndex=1, setID=5425, appearanceID=126730, modID=296121, name=Vaelgor's Fearsome Grasp
[X] sourceIndex=2, setID=5425, appearanceID=126730, modID=297319, name=Arbortenders of the Luminous Bloom

### DRUID - Sprouts of the Luminous Bloom - Normal - SHOULDERS
[ ] sourceIndex=1, setID=5426, appearanceID=126760, modID=296168, name=Blooming Barklight Spaulders
[X] sourceIndex=2, setID=5426, appearanceID=126760, modID=297278, name=Seedpods of the Luminous Bloom

### DRUID - Sprouts of the Luminous Bloom - Normal - GAUNTLETS
[ ] sourceIndex=1, setID=5426, appearanceID=126766, modID=296120, name=Vaelgor's Fearsome Grasp
[X] sourceIndex=2, setID=5426, appearanceID=126766, modID=297314, name=Arbortenders of the Luminous Bloom

### DRUID - Sprouts of the Luminous Bloom - Heroic - SHOULDERS
[ ] sourceIndex=1, setID=5427, appearanceID=126712, modID=296170, name=Blooming Barklight Spaulders
[X] sourceIndex=2, setID=5427, appearanceID=126712, modID=297284, name=Seedpods of the Luminous Bloom

### DRUID - Sprouts of the Luminous Bloom - Heroic - GAUNTLETS
[ ] sourceIndex=1, setID=5427, appearanceID=126718, modID=296122, name=Vaelgor's Fearsome Grasp
[X] sourceIndex=2, setID=5427, appearanceID=126718, modID=297320, name=Arbortenders of the Luminous Bloom

### DRUID - Sprouts of the Luminous Bloom - Mythic - SHOULDERS
[ ] sourceIndex=1, setID=5428, appearanceID=126758, modID=296171, name=Blooming Barklight Spaulders
[X] sourceIndex=2, setID=5428, appearanceID=126758, modID=297285, name=Seedpods of the Luminous Bloom

### DRUID - Sprouts of the Luminous Bloom - Mythic - GAUNTLETS
[ ] sourceIndex=1, setID=5428, appearanceID=126754, modID=296123, name=Vaelgor's Fearsome Grasp
[X] sourceIndex=2, setID=5428, appearanceID=126754, modID=297321, name=Arbortenders of the Luminous Bloom

### EVOKER - Livery of the Black Talon - Raid Finder - HELM
[ ] sourceIndex=1, setID=5429, appearanceID=126201, modID=296105, name=Frenzy's Rebuke
[X] sourceIndex=2, setID=5429, appearanceID=126201, modID=296983, name=Hornhelm of the Black Talon

### EVOKER - Livery of the Black Talon - Raid Finder - SHOULDERS
[ ] sourceIndex=1, setID=5429, appearanceID=126202, modID=296109, name=Nullwalker's Dread Epaulettes
[X] sourceIndex=2, setID=5429, appearanceID=126202, modID=296959, name=Beacons of the Black Talon

### EVOKER - Livery of the Black Talon - Normal - HELM
[ ] sourceIndex=1, setID=5430, appearanceID=126228, modID=296104, name=Frenzy's Rebuke
[X] sourceIndex=2, setID=5430, appearanceID=126228, modID=296978, name=Hornhelm of the Black Talon

### EVOKER - Livery of the Black Talon - Normal - SHOULDERS
[ ] sourceIndex=1, setID=5430, appearanceID=126229, modID=296108, name=Nullwalker's Dread Epaulettes
[X] sourceIndex=2, setID=5430, appearanceID=126229, modID=296954, name=Beacons of the Black Talon

### EVOKER - Livery of the Black Talon - Heroic - HELM
[ ] sourceIndex=1, setID=5431, appearanceID=126191, modID=296106, name=Frenzy's Rebuke
[X] sourceIndex=2, setID=5431, appearanceID=126191, modID=296984, name=Hornhelm of the Black Talon

### EVOKER - Livery of the Black Talon - Heroic - SHOULDERS
[ ] sourceIndex=1, setID=5431, appearanceID=126192, modID=296110, name=Nullwalker's Dread Epaulettes
[X] sourceIndex=2, setID=5431, appearanceID=126192, modID=296960, name=Beacons of the Black Talon

### EVOKER - Livery of the Black Talon - Mythic - HELM
[ ] sourceIndex=1, setID=5432, appearanceID=126218, modID=296107, name=Frenzy's Rebuke
[X] sourceIndex=2, setID=5432, appearanceID=126218, modID=296985, name=Hornhelm of the Black Talon

### EVOKER - Livery of the Black Talon - Mythic - SHOULDERS
[ ] sourceIndex=1, setID=5432, appearanceID=126227, modID=296111, name=Nullwalker's Dread Epaulettes
[X] sourceIndex=2, setID=5432, appearanceID=126227, modID=296961, name=Beacons of the Black Talon

### HUNTER - Primal Sentry's Camouflage - Raid Finder - LEGGINGS
[ ] sourceIndex=1, setID=5433, appearanceID=125964, modID=296133, name=Eternal Flame Scaleguards
[X] sourceIndex=2, setID=5433, appearanceID=125964, modID=296863, name=Primal Sentry's Legguards

### HUNTER - Primal Sentry's Camouflage - Raid Finder - GAUNTLETS
[ ] sourceIndex=1, setID=5433, appearanceID=125967, modID=296137, name=Untethered Berserker's Grips
[X] sourceIndex=2, setID=5433, appearanceID=125967, modID=296887, name=Primal Sentry's Talonguards

### HUNTER - Primal Sentry's Camouflage - Normal - LEGGINGS
[ ] sourceIndex=1, setID=5434, appearanceID=126000, modID=296132, name=Eternal Flame Scaleguards
[X] sourceIndex=2, setID=5434, appearanceID=126000, modID=296858, name=Primal Sentry's Legguards

### HUNTER - Primal Sentry's Camouflage - Normal - GAUNTLETS
[ ] sourceIndex=1, setID=5434, appearanceID=126003, modID=296136, name=Untethered Berserker's Grips
[X] sourceIndex=2, setID=5434, appearanceID=126003, modID=296882, name=Primal Sentry's Talonguards

### HUNTER - Primal Sentry's Camouflage - Heroic - LEGGINGS
[ ] sourceIndex=1, setID=5435, appearanceID=125952, modID=296134, name=Eternal Flame Scaleguards
[X] sourceIndex=2, setID=5435, appearanceID=125952, modID=296864, name=Primal Sentry's Legguards

### HUNTER - Primal Sentry's Camouflage - Heroic - GAUNTLETS
[ ] sourceIndex=1, setID=5435, appearanceID=125955, modID=296138, name=Untethered Berserker's Grips
[X] sourceIndex=2, setID=5435, appearanceID=125955, modID=296888, name=Primal Sentry's Talonguards

### HUNTER - Primal Sentry's Camouflage - Mythic - LEGGINGS
[ ] sourceIndex=1, setID=5436, appearanceID=125988, modID=296135, name=Eternal Flame Scaleguards
[X] sourceIndex=2, setID=5436, appearanceID=125988, modID=296865, name=Primal Sentry's Legguards

### HUNTER - Primal Sentry's Camouflage - Mythic - GAUNTLETS
[ ] sourceIndex=1, setID=5436, appearanceID=126122, modID=296139, name=Untethered Berserker's Grips
[X] sourceIndex=2, setID=5436, appearanceID=126122, modID=296889, name=Primal Sentry's Talonguards

### MAGE - Voidbreaker's Accordance - Raid Finder - SHOULDERS
[ ] sourceIndex=1, setID=5437, appearanceID=125445, modID=296149, name=Echoing Void Mantle
[X] sourceIndex=2, setID=5437, appearanceID=125445, modID=297715, name=Voidbreaker's Leyline Nexi

### MAGE - Voidbreaker's Accordance - Raid Finder - LEGGINGS
[ ] sourceIndex=1, setID=5437, appearanceID=125448, modID=296129, name=Leggings of the Devouring Advance
[X] sourceIndex=2, setID=5437, appearanceID=125448, modID=297727, name=Voidbreaker's Britches

### MAGE - Voidbreaker's Accordance - Normal - SHOULDERS
[ ] sourceIndex=1, setID=5438, appearanceID=125409, modID=296148, name=Echoing Void Mantle
[X] sourceIndex=2, setID=5438, appearanceID=125409, modID=297710, name=Voidbreaker's Leyline Nexi

### MAGE - Voidbreaker's Accordance - Normal - LEGGINGS
[ ] sourceIndex=1, setID=5438, appearanceID=125412, modID=296128, name=Leggings of the Devouring Advance
[X] sourceIndex=2, setID=5438, appearanceID=125412, modID=297722, name=Voidbreaker's Britches

### MAGE - Voidbreaker's Accordance - Heroic - SHOULDERS
[ ] sourceIndex=1, setID=5439, appearanceID=125457, modID=296150, name=Echoing Void Mantle
[X] sourceIndex=2, setID=5439, appearanceID=125457, modID=297716, name=Voidbreaker's Leyline Nexi

### MAGE - Voidbreaker's Accordance - Heroic - LEGGINGS
[ ] sourceIndex=1, setID=5439, appearanceID=125460, modID=296130, name=Leggings of the Devouring Advance
[X] sourceIndex=2, setID=5439, appearanceID=125460, modID=297728, name=Voidbreaker's Britches

### MAGE - Voidbreaker's Accordance - Mythic - SHOULDERS
[ ] sourceIndex=1, setID=5440, appearanceID=125443, modID=296151, name=Echoing Void Mantle
[X] sourceIndex=2, setID=5440, appearanceID=125443, modID=297717, name=Voidbreaker's Leyline Nexi

### MAGE - Voidbreaker's Accordance - Mythic - LEGGINGS
[ ] sourceIndex=1, setID=5440, appearanceID=125436, modID=296131, name=Leggings of the Devouring Advance
[X] sourceIndex=2, setID=5440, appearanceID=125436, modID=297729, name=Voidbreaker's Britches

### MONK - Way of Ra-den's Chosen - Raid Finder - CHEST
[ ] sourceIndex=1, setID=5441, appearanceID=125597, modID=296125, name=Radiant Clutchtender's Jerkin
[X] sourceIndex=2, setID=5441, appearanceID=125597, modID=297235, name=Battle Garb of Ra-den's Chosen

### MONK - Way of Ra-den's Chosen - Raid Finder - LEGGINGS
[X] sourceIndex=1, setID=5441, appearanceID=125599, modID=297187, name=Swiftsweepers of Ra-den's Chosen
[ ] sourceIndex=2, setID=5441, appearanceID=125599, modID=302119, name=Power Stance Breeches

### MONK - Way of Ra-den's Chosen - Normal - CHEST
[ ] sourceIndex=1, setID=5442, appearanceID=125537, modID=296124, name=Radiant Clutchtender's Jerkin
[X] sourceIndex=2, setID=5442, appearanceID=125537, modID=297230, name=Battle Garb of Ra-den's Chosen

### MONK - Way of Ra-den's Chosen - Normal - LEGGINGS
[X] sourceIndex=1, setID=5442, appearanceID=125539, modID=297182, name=Swiftsweepers of Ra-den's Chosen
[ ] sourceIndex=2, setID=5442, appearanceID=125539, modID=302118, name=Power Stance Breeches

### MONK - Way of Ra-den's Chosen - Heroic - CHEST
[ ] sourceIndex=1, setID=5443, appearanceID=125561, modID=296126, name=Radiant Clutchtender's Jerkin
[X] sourceIndex=2, setID=5443, appearanceID=125561, modID=297236, name=Battle Garb of Ra-den's Chosen

### MONK - Way of Ra-den's Chosen - Heroic - LEGGINGS
[X] sourceIndex=1, setID=5443, appearanceID=125563, modID=297188, name=Swiftsweepers of Ra-den's Chosen
[ ] sourceIndex=2, setID=5443, appearanceID=125563, modID=302120, name=Power Stance Breeches

### MONK - Way of Ra-den's Chosen - Mythic - CHEST
[ ] sourceIndex=1, setID=5444, appearanceID=125573, modID=296127, name=Radiant Clutchtender's Jerkin
[X] sourceIndex=2, setID=5444, appearanceID=125573, modID=297237, name=Battle Garb of Ra-den's Chosen

### MONK - Way of Ra-den's Chosen - Mythic - LEGGINGS
[X] sourceIndex=1, setID=5444, appearanceID=125575, modID=297189, name=Swiftsweepers of Ra-den's Chosen
[ ] sourceIndex=2, setID=5444, appearanceID=125575, modID=302121, name=Power Stance Breeches

### PALADIN - Luminant Verdict's Vestments - Raid Finder - SHOULDERS
[ ] sourceIndex=1, setID=5445, appearanceID=127393, modID=296089, name=Light-Judged Spaulders
[X] sourceIndex=2, setID=5445, appearanceID=127393, modID=296527, name=Luminant Verdict's Providence Watch

### PALADIN - Luminant Verdict's Vestments - Raid Finder - CHEST
[ ] sourceIndex=1, setID=5445, appearanceID=127394, modID=296073, name=Sunbound Breastplate
[X] sourceIndex=2, setID=5445, appearanceID=127394, modID=296587, name=Luminant Verdict's Divine Warplate

### PALADIN - Luminant Verdict's Vestments - Raid Finder - LEGGINGS
[ ] sourceIndex=1, setID=5445, appearanceID=127396, modID=296081, name=Lightblood Greaves
[X] sourceIndex=2, setID=5445, appearanceID=127396, modID=296539, name=Luminant Verdict's Greaves

### PALADIN - Luminant Verdict's Vestments - Raid Finder - GAUNTLETS
[ ] sourceIndex=1, setID=5445, appearanceID=127399, modID=296065, name=Emberborn Grasps
[X] sourceIndex=2, setID=5445, appearanceID=127399, modID=296563, name=Luminant Verdict's Gauntlets

### PALADIN - Luminant Verdict's Vestments - Normal - SHOULDERS
[ ] sourceIndex=1, setID=5446, appearanceID=127382, modID=296088, name=Light-Judged Spaulders
[X] sourceIndex=2, setID=5446, appearanceID=127382, modID=296522, name=Luminant Verdict's Providence Watch

### PALADIN - Luminant Verdict's Vestments - Normal - CHEST
[ ] sourceIndex=1, setID=5446, appearanceID=127383, modID=296072, name=Sunbound Breastplate
[X] sourceIndex=2, setID=5446, appearanceID=127383, modID=296582, name=Luminant Verdict's Divine Warplate

### PALADIN - Luminant Verdict's Vestments - Normal - LEGGINGS
[ ] sourceIndex=1, setID=5446, appearanceID=127385, modID=296080, name=Lightblood Greaves
[X] sourceIndex=2, setID=5446, appearanceID=127385, modID=296534, name=Luminant Verdict's Greaves

### PALADIN - Luminant Verdict's Vestments - Normal - GAUNTLETS
[ ] sourceIndex=1, setID=5446, appearanceID=127388, modID=296064, name=Emberborn Grasps
[X] sourceIndex=2, setID=5446, appearanceID=127388, modID=296558, name=Luminant Verdict's Gauntlets

### PALADIN - Luminant Verdict's Vestments - Heroic - SHOULDERS
[ ] sourceIndex=1, setID=5447, appearanceID=127349, modID=296090, name=Light-Judged Spaulders
[X] sourceIndex=2, setID=5447, appearanceID=127349, modID=296528, name=Luminant Verdict's Providence Watch

### PALADIN - Luminant Verdict's Vestments - Heroic - CHEST
[ ] sourceIndex=1, setID=5447, appearanceID=127350, modID=296074, name=Sunbound Breastplate
[X] sourceIndex=2, setID=5447, appearanceID=127350, modID=296588, name=Luminant Verdict's Divine Warplate

### PALADIN - Luminant Verdict's Vestments - Heroic - LEGGINGS
[ ] sourceIndex=1, setID=5447, appearanceID=127352, modID=296082, name=Lightblood Greaves
[X] sourceIndex=2, setID=5447, appearanceID=127352, modID=296540, name=Luminant Verdict's Greaves

### PALADIN - Luminant Verdict's Vestments - Heroic - GAUNTLETS
[ ] sourceIndex=1, setID=5447, appearanceID=127355, modID=296066, name=Emberborn Grasps
[X] sourceIndex=2, setID=5447, appearanceID=127355, modID=296564, name=Luminant Verdict's Gauntlets

### PALADIN - Luminant Verdict's Vestments - Mythic - SHOULDERS
[ ] sourceIndex=1, setID=5448, appearanceID=127380, modID=296091, name=Light-Judged Spaulders
[X] sourceIndex=2, setID=5448, appearanceID=127380, modID=296529, name=Luminant Verdict's Providence Watch

### PALADIN - Luminant Verdict's Vestments - Mythic - CHEST
[ ] sourceIndex=1, setID=5448, appearanceID=127372, modID=296075, name=Sunbound Breastplate
[X] sourceIndex=2, setID=5448, appearanceID=127372, modID=296589, name=Luminant Verdict's Divine Warplate

### PALADIN - Luminant Verdict's Vestments - Mythic - LEGGINGS
[ ] sourceIndex=1, setID=5448, appearanceID=127374, modID=296083, name=Lightblood Greaves
[X] sourceIndex=2, setID=5448, appearanceID=127374, modID=296541, name=Luminant Verdict's Greaves

### PALADIN - Luminant Verdict's Vestments - Mythic - GAUNTLETS
[ ] sourceIndex=1, setID=5448, appearanceID=127377, modID=296067, name=Emberborn Grasps
[X] sourceIndex=2, setID=5448, appearanceID=127377, modID=296565, name=Luminant Verdict's Gauntlets

### PRIEST - Blind Oath's Burden - Raid Finder - HELM
[X] sourceIndex=1, setID=5449, appearanceID=126918, modID=297631, name=Blind Oath's Winged Crest
[ ] sourceIndex=2, setID=5449, appearanceID=126918, modID=302107, name=Visage of Unseen Truths

### PRIEST - Blind Oath's Burden - Raid Finder - CHEST
[ ] sourceIndex=1, setID=5449, appearanceID=126920, modID=296069, name=Despotic Raiment
[X] sourceIndex=2, setID=5449, appearanceID=126920, modID=297667, name=Blind Oath's Raiment

### PRIEST - Blind Oath's Burden - Normal - HELM
[X] sourceIndex=1, setID=5450, appearanceID=126906, modID=297626, name=Blind Oath's Winged Crest
[ ] sourceIndex=2, setID=5450, appearanceID=126906, modID=302106, name=Visage of Unseen Truths

### PRIEST - Blind Oath's Burden - Normal - CHEST
[ ] sourceIndex=1, setID=5450, appearanceID=126908, modID=296068, name=Despotic Raiment
[X] sourceIndex=2, setID=5450, appearanceID=126908, modID=297662, name=Blind Oath's Raiment

### PRIEST - Blind Oath's Burden - Heroic - HELM
[X] sourceIndex=1, setID=5451, appearanceID=126930, modID=297632, name=Blind Oath's Winged Crest
[ ] sourceIndex=2, setID=5451, appearanceID=126930, modID=302108, name=Visage of Unseen Truths

### PRIEST - Blind Oath's Burden - Heroic - CHEST
[ ] sourceIndex=1, setID=5451, appearanceID=126932, modID=296070, name=Despotic Raiment
[X] sourceIndex=2, setID=5451, appearanceID=126932, modID=297668, name=Blind Oath's Raiment

### PRIEST - Blind Oath's Burden - Mythic - HELM
[X] sourceIndex=1, setID=5452, appearanceID=126964, modID=297633, name=Blind Oath's Winged Crest
[ ] sourceIndex=2, setID=5452, appearanceID=126964, modID=302109, name=Visage of Unseen Truths

### PRIEST - Blind Oath's Burden - Mythic - CHEST
[ ] sourceIndex=1, setID=5452, appearanceID=126956, modID=296071, name=Despotic Raiment
[X] sourceIndex=2, setID=5452, appearanceID=126956, modID=297669, name=Blind Oath's Raiment

### ROGUE - Motley of the Grim Jest - Raid Finder - HELM
[ ] sourceIndex=1, setID=5453, appearanceID=123453, modID=296345, name=Mask of Darkest Intent
[X] sourceIndex=2, setID=5453, appearanceID=123453, modID=297091, name=Masquerade of the Grim Jest

### ROGUE - Motley of the Grim Jest - Raid Finder - LEGGINGS
[ ] sourceIndex=1, setID=5453, appearanceID=123457, modID=296085, name=Nightblade's Pantaloons
[X] sourceIndex=2, setID=5453, appearanceID=123457, modID=297079, name=Blade Holsters of the Grim Jest

### ROGUE - Motley of the Grim Jest - Normal - HELM
[ ] sourceIndex=1, setID=5454, appearanceID=123475, modID=296344, name=Mask of Darkest Intent
[X] sourceIndex=2, setID=5454, appearanceID=123475, modID=297086, name=Masquerade of the Grim Jest

### ROGUE - Motley of the Grim Jest - Normal - LEGGINGS
[ ] sourceIndex=1, setID=5454, appearanceID=123479, modID=296084, name=Nightblade's Pantaloons
[X] sourceIndex=2, setID=5454, appearanceID=123479, modID=297074, name=Blade Holsters of the Grim Jest

### ROGUE - Motley of the Grim Jest - Heroic - HELM
[ ] sourceIndex=1, setID=5455, appearanceID=123442, modID=296346, name=Mask of Darkest Intent
[X] sourceIndex=2, setID=5455, appearanceID=123442, modID=297092, name=Masquerade of the Grim Jest

### ROGUE - Motley of the Grim Jest - Heroic - LEGGINGS
[ ] sourceIndex=1, setID=5455, appearanceID=123446, modID=296086, name=Nightblade's Pantaloons
[X] sourceIndex=2, setID=5455, appearanceID=123446, modID=297080, name=Blade Holsters of the Grim Jest

### ROGUE - Motley of the Grim Jest - Mythic - HELM
[ ] sourceIndex=1, setID=5456, appearanceID=123440, modID=296347, name=Mask of Darkest Intent
[X] sourceIndex=2, setID=5456, appearanceID=123440, modID=297093, name=Masquerade of the Grim Jest

### ROGUE - Motley of the Grim Jest - Mythic - LEGGINGS
[ ] sourceIndex=1, setID=5456, appearanceID=123435, modID=296087, name=Nightblade's Pantaloons
[X] sourceIndex=2, setID=5456, appearanceID=123435, modID=297081, name=Blade Holsters of the Grim Jest

### SHAMAN - Mantle of the Primal Core - Raid Finder - HELM
[ ] sourceIndex=1, setID=5457, appearanceID=127113, modID=296349, name=Oblivion Guise
[X] sourceIndex=2, setID=5457, appearanceID=127113, modID=296767, name=Locus of the Primal Core

### SHAMAN - Mantle of the Primal Core - Raid Finder - SHOULDERS
[X] sourceIndex=1, setID=5457, appearanceID=127114, modID=296743, name=Tempests of the Primal Core
[ ] sourceIndex=2, setID=5457, appearanceID=127114, modID=302123, name=Primal Spark Pauldrons

### SHAMAN - Mantle of the Primal Core - Raid Finder - CHEST
[ ] sourceIndex=1, setID=5457, appearanceID=127115, modID=296077, name=Robes of the Voidbound
[X] sourceIndex=2, setID=5457, appearanceID=127115, modID=296800, name=Embrace of the Primal Core

### SHAMAN - Mantle of the Primal Core - Normal - HELM
[ ] sourceIndex=1, setID=5458, appearanceID=127101, modID=296348, name=Oblivion Guise
[X] sourceIndex=2, setID=5458, appearanceID=127101, modID=296762, name=Locus of the Primal Core

### SHAMAN - Mantle of the Primal Core - Normal - SHOULDERS
[X] sourceIndex=1, setID=5458, appearanceID=127102, modID=296738, name=Tempests of the Primal Core
[ ] sourceIndex=2, setID=5458, appearanceID=127102, modID=302122, name=Primal Spark Pauldrons

### SHAMAN - Mantle of the Primal Core - Normal - CHEST
[ ] sourceIndex=1, setID=5458, appearanceID=127103, modID=296076, name=Robes of the Voidbound
[X] sourceIndex=2, setID=5458, appearanceID=127103, modID=296801, name=Embrace of the Primal Core

### SHAMAN - Mantle of the Primal Core - Heroic - HELM
[ ] sourceIndex=1, setID=5459, appearanceID=127077, modID=296350, name=Oblivion Guise
[X] sourceIndex=2, setID=5459, appearanceID=127077, modID=296768, name=Locus of the Primal Core

### SHAMAN - Mantle of the Primal Core - Heroic - SHOULDERS
[X] sourceIndex=1, setID=5459, appearanceID=127078, modID=296744, name=Tempests of the Primal Core
[ ] sourceIndex=2, setID=5459, appearanceID=127078, modID=302124, name=Primal Spark Pauldrons

### SHAMAN - Mantle of the Primal Core - Heroic - CHEST
[ ] sourceIndex=1, setID=5459, appearanceID=127079, modID=296078, name=Robes of the Voidbound
[X] sourceIndex=2, setID=5459, appearanceID=127079, modID=296802, name=Embrace of the Primal Core

### SHAMAN - Mantle of the Primal Core - Mythic - HELM
[ ] sourceIndex=1, setID=5460, appearanceID=127099, modID=296351, name=Oblivion Guise
[X] sourceIndex=2, setID=5460, appearanceID=127099, modID=296769, name=Locus of the Primal Core

### SHAMAN - Mantle of the Primal Core - Mythic - SHOULDERS
[X] sourceIndex=1, setID=5460, appearanceID=127100, modID=296745, name=Tempests of the Primal Core
[ ] sourceIndex=2, setID=5460, appearanceID=127100, modID=302125, name=Primal Spark Pauldrons

### SHAMAN - Mantle of the Primal Core - Mythic - CHEST
[ ] sourceIndex=1, setID=5460, appearanceID=127091, modID=296079, name=Robes of the Voidbound
[X] sourceIndex=2, setID=5460, appearanceID=127091, modID=296803, name=Embrace of the Primal Core

### WARLOCK - Reign of the Abyssal Immolator - Raid Finder - HELM
[ ] sourceIndex=1, setID=5461, appearanceID=126544, modID=296153, name=Gaze of the Unrestrained
[X] sourceIndex=2, setID=5461, appearanceID=126544, modID=297523, name=Abyssal Immolator's Smoldering Flames

### WARLOCK - Reign of the Abyssal Immolator - Raid Finder - CHEST
[ ] sourceIndex=1, setID=5461, appearanceID=126546, modID=296341, name=Robes of Endless Oblivion
[X] sourceIndex=2, setID=5461, appearanceID=126546, modID=297559, name=Abyssal Immolator's Dreadrobe

### WARLOCK - Reign of the Abyssal Immolator - Raid Finder - GAUNTLETS
[ ] sourceIndex=1, setID=5461, appearanceID=126551, modID=296157, name=War Chaplain's Grips
[X] sourceIndex=2, setID=5461, appearanceID=126551, modID=297535, name=Abyssal Immolator's Grasps

### WARLOCK - Reign of the Abyssal Immolator - Normal - HELM
[ ] sourceIndex=1, setID=5462, appearanceID=126511, modID=296152, name=Gaze of the Unrestrained
[X] sourceIndex=2, setID=5462, appearanceID=126511, modID=297518, name=Abyssal Immolator's Smoldering Flames

### WARLOCK - Reign of the Abyssal Immolator - Normal - CHEST
[ ] sourceIndex=1, setID=5462, appearanceID=126513, modID=296340, name=Robes of Endless Oblivion
[X] sourceIndex=2, setID=5462, appearanceID=126513, modID=297554, name=Abyssal Immolator's Dreadrobe

### WARLOCK - Reign of the Abyssal Immolator - Normal - GAUNTLETS
[ ] sourceIndex=1, setID=5462, appearanceID=126518, modID=296156, name=War Chaplain's Grips
[X] sourceIndex=2, setID=5462, appearanceID=126518, modID=297530, name=Abyssal Immolator's Grasps

### WARLOCK - Reign of the Abyssal Immolator - Heroic - HELM
[ ] sourceIndex=1, setID=5463, appearanceID=126500, modID=296154, name=Gaze of the Unrestrained
[X] sourceIndex=2, setID=5463, appearanceID=126500, modID=297524, name=Abyssal Immolator's Smoldering Flames

### WARLOCK - Reign of the Abyssal Immolator - Heroic - CHEST
[ ] sourceIndex=1, setID=5463, appearanceID=126502, modID=296342, name=Robes of Endless Oblivion
[X] sourceIndex=2, setID=5463, appearanceID=126502, modID=297560, name=Abyssal Immolator's Dreadrobe

### WARLOCK - Reign of the Abyssal Immolator - Heroic - GAUNTLETS
[ ] sourceIndex=1, setID=5463, appearanceID=126507, modID=296158, name=War Chaplain's Grips
[X] sourceIndex=2, setID=5463, appearanceID=126507, modID=297536, name=Abyssal Immolator's Grasps

### WARLOCK - Reign of the Abyssal Immolator - Mythic - HELM
[ ] sourceIndex=1, setID=5464, appearanceID=126498, modID=296155, name=Gaze of the Unrestrained
[X] sourceIndex=2, setID=5464, appearanceID=126498, modID=297525, name=Abyssal Immolator's Smoldering Flames

### WARLOCK - Reign of the Abyssal Immolator - Mythic - CHEST
[ ] sourceIndex=1, setID=5464, appearanceID=126491, modID=296343, name=Robes of Endless Oblivion
[X] sourceIndex=2, setID=5464, appearanceID=126491, modID=297561, name=Abyssal Immolator's Dreadrobe

### WARLOCK - Reign of the Abyssal Immolator - Mythic - GAUNTLETS
[ ] sourceIndex=1, setID=5464, appearanceID=126496, modID=296159, name=War Chaplain's Grips
[X] sourceIndex=2, setID=5464, appearanceID=126496, modID=297537, name=Abyssal Immolator's Grasps

### WARRIOR - Rage of the Night Ender - Raid Finder - CHEST
[X] sourceIndex=1, setID=5465, appearanceID=127339, modID=296479, name=Night Ender's Breastplate
[ ] sourceIndex=2, setID=5465, appearanceID=127339, modID=302131, name=Breastplate of the Final Defense

### WARRIOR - Rage of the Night Ender - Normal - CHEST
[X] sourceIndex=1, setID=5466, appearanceID=127328, modID=296474, name=Night Ender's Breastplate
[ ] sourceIndex=2, setID=5466, appearanceID=127328, modID=302130, name=Breastplate of the Final Defense

### WARRIOR - Rage of the Night Ender - Heroic - CHEST
[X] sourceIndex=1, setID=5467, appearanceID=127295, modID=296480, name=Night Ender's Breastplate
[ ] sourceIndex=2, setID=5467, appearanceID=127295, modID=302132, name=Breastplate of the Final Defense

### WARRIOR - Rage of the Night Ender - Mythic - CHEST
[X] sourceIndex=1, setID=5468, appearanceID=127284, modID=296481, name=Night Ender's Breastplate
[ ] sourceIndex=2, setID=5468, appearanceID=127284, modID=302133, name=Breastplate of the Final Defense

```

**NOTE**: If any AppearanceId has multiple ModIds, an AUDIT block will be included in the output above. Review each AUDIT block and mark the correct ModId(s) by changing `[ ]` to `[X]`. If no ModId is marked for an AppearanceId, the `/plan-token` command will halt and prompt you to resolve the audit entries before proceeding.

---

## 📋 PLAN OUTPUT (Generated by `/plan-token` [ID])

> **Do not edit manually.** This section is generated from the data you provided above. Review the token group mappings and slot/difficulty assignments before proceeding to `/generate-token`.

### Token Groups and Class Mappings

Discerned from Extract Tokens raw output:

| Token Group Name | Classes Covered                                |
|------------------|------------------------------------------------|
| _woven           | Priest, Mage, Warlock                          |
| _forged          | Warrior, Paladin, Death Knight                 |
| _cured           | Rogue, Monk, Druid, Demon Hunter               |
| _cast            | Hunter, Shaman, Evoker                         |

### Token ID Mappings

Mapping of token IDs to their difficulties and token groups:

| Token ID | Difficulties                     | Token Group | Slot      |
|----------|----------------------------------|-------------|-----------|
| 249351   | RAID_FINDER, NORMAL, HEROIC, MYTHIC | _woven      | GAUNTLETS |
| 249352   | RAID_FINDER, NORMAL, HEROIC, MYTHIC | _cured      | GAUNTLETS |
| 249353   | RAID_FINDER, NORMAL, HEROIC, MYTHIC | _cast       | GAUNTLETS |
| 249354   | RAID_FINDER, NORMAL, HEROIC, MYTHIC | _forged     | GAUNTLETS |
| 249355   | RAID_FINDER, NORMAL, HEROIC, MYTHIC | _woven      | HELM      |
| 249356   | RAID_FINDER, NORMAL, HEROIC, MYTHIC | _cured      | HELM      |
| 249357   | RAID_FINDER, NORMAL, HEROIC, MYTHIC | _cast       | HELM      |
| 249358   | RAID_FINDER, NORMAL, HEROIC, MYTHIC | _forged     | HELM      |
| 249359   | RAID_FINDER, NORMAL, HEROIC, MYTHIC | _woven      | LEGGINGS  |
| 249360   | RAID_FINDER, NORMAL, HEROIC, MYTHIC | _cured      | LEGGINGS  |
| 249361   | RAID_FINDER, NORMAL, HEROIC, MYTHIC | _cast       | LEGGINGS  |
| 249362   | RAID_FINDER, NORMAL, HEROIC, MYTHIC | _forged     | LEGGINGS  |
| 249363   | RAID_FINDER, NORMAL, HEROIC, MYTHIC | _woven      | SHOULDERS |
| 249364   | RAID_FINDER, NORMAL, HEROIC, MYTHIC | _cured      | SHOULDERS |
| 249365   | RAID_FINDER, NORMAL, HEROIC, MYTHIC | _cast       | SHOULDERS |
| 249366   | RAID_FINDER, NORMAL, HEROIC, MYTHIC | _forged     | SHOULDERS |
| 249347   | RAID_FINDER, NORMAL, HEROIC, MYTHIC | _woven      | CHEST     |
| 249348   | RAID_FINDER, NORMAL, HEROIC, MYTHIC | _cured      | CHEST     |
| 249349   | RAID_FINDER, NORMAL, HEROIC, MYTHIC | _cast       | CHEST     |
| 249350   | RAID_FINDER, NORMAL, HEROIC, MYTHIC | _forged     | CHEST     |
| 249367   | RAID_FINDER, NORMAL, HEROIC, MYTHIC | curio       | ALL       |

### Appearance Data by Token Group, Class, Difficulty, Slot

```
### _woven - PRIEST - RAID_FINDER
HELM, 126918, 297631
SHOULDERS, 126919, 297607
CHEST, 126920, 297667
LEGGINGS, 126922, 297619
GAUNTLETS, 126925, 297643

### _woven - PRIEST - NORMAL
HELM, 126906, 297626
SHOULDERS, 126907, 297602
CHEST, 126908, 297662
LEGGINGS, 126910, 297614
GAUNTLETS, 126913, 297638

### _woven - PRIEST - HEROIC
HELM, 126930, 297632
SHOULDERS, 126931, 297608
CHEST, 126932, 297668
LEGGINGS, 126934, 297620
GAUNTLETS, 126937, 297644

### _woven - PRIEST - MYTHIC
HELM, 126964, 297633
SHOULDERS, 126965, 297609
CHEST, 126956, 297669
LEGGINGS, 126958, 297621
GAUNTLETS, 126961, 297645

### _woven - MAGE - RAID_FINDER
HELM, 125444, 297739
SHOULDERS, 125445, 297715
CHEST, 125446, 297775
LEGGINGS, 125448, 297727
GAUNTLETS, 125451, 297751

### _woven - MAGE - NORMAL
HELM, 125408, 297734
SHOULDERS, 125409, 297710
CHEST, 125410, 297770
LEGGINGS, 125412, 297722
GAUNTLETS, 125415, 297746

### _woven - MAGE - HEROIC
HELM, 125456, 297740
SHOULDERS, 125457, 297716
CHEST, 125458, 297776
LEGGINGS, 125460, 297728
GAUNTLETS, 125463, 297752

### _woven - MAGE - MYTHIC
HELM, 125442, 297741
SHOULDERS, 125443, 297717
CHEST, 125434, 297777
LEGGINGS, 125436, 297729
GAUNTLETS, 125439, 297753

### _woven - WARLOCK - RAID_FINDER
HELM, 126544, 297523
SHOULDERS, 126545, 297499
CHEST, 126546, 297559
LEGGINGS, 126548, 297511
GAUNTLETS, 126551, 297535

### _woven - WARLOCK - NORMAL
HELM, 126511, 297518
SHOULDERS, 126512, 297494
CHEST, 126513, 297554
LEGGINGS, 126515, 297506
GAUNTLETS, 126518, 297530

### _woven - WARLOCK - HEROIC
HELM, 126500, 297524
SHOULDERS, 126501, 297500
CHEST, 126502, 297560
LEGGINGS, 126504, 297512
GAUNTLETS, 126507, 297536

### _woven - WARLOCK - MYTHIC
HELM, 126498, 297525
SHOULDERS, 126499, 297501
CHEST, 126491, 297561
LEGGINGS, 126493, 297513
GAUNTLETS, 126496, 297537

### _forged - WARRIOR - RAID_FINDER
HELM, 127337, 296443
SHOULDERS, 127338, 296419
CHEST, 127339, 296479
LEGGINGS, 127341, 296431
GAUNTLETS, 127344, 296455

### _forged - WARRIOR - NORMAL
HELM, 127326, 296438
SHOULDERS, 127327, 296414
CHEST, 127328, 296474
LEGGINGS, 127330, 296426
GAUNTLETS, 127333, 296450

### _forged - WARRIOR - HEROIC
HELM, 127293, 296444
SHOULDERS, 127294, 296420
CHEST, 127295, 296480
LEGGINGS, 127297, 296432
GAUNTLETS, 127300, 296456

### _forged - WARRIOR - MYTHIC
HELM, 127291, 296445
SHOULDERS, 127292, 296421
CHEST, 127284, 296481
LEGGINGS, 127286, 296433
GAUNTLETS, 127289, 296457

### _forged - PALADIN - RAID_FINDER
HELM, 127392, 296551
SHOULDERS, 127393, 296527
CHEST, 127394, 296587
LEGGINGS, 127396, 296539
GAUNTLETS, 127399, 296563

### _forged - PALADIN - NORMAL
HELM, 127381, 296546
SHOULDERS, 127382, 296522
CHEST, 127383, 296582
LEGGINGS, 127385, 296534
GAUNTLETS, 127388, 296558

### _forged - PALADIN - HEROIC
HELM, 127348, 296552
SHOULDERS, 127349, 296528
CHEST, 127350, 296588
LEGGINGS, 127352, 296540
GAUNTLETS, 127355, 296564

### _forged - PALADIN - MYTHIC
HELM, 127379, 296553
SHOULDERS, 127380, 296529
CHEST, 127372, 296589
LEGGINGS, 127374, 296541
GAUNTLETS, 127377, 296565

### _forged - DEATHKNIGHT - RAID_FINDER
HELM, 125672, 296659
SHOULDERS, 125673, 296635
CHEST, 125674, 296695
LEGGINGS, 125676, 296647
GAUNTLETS, 125679, 296671

### _forged - DEATHKNIGHT - NORMAL
HELM, 125620, 296654
SHOULDERS, 125621, 296630
CHEST, 125622, 296690
LEGGINGS, 125624, 296642
GAUNTLETS, 125627, 296666

### _forged - DEATHKNIGHT - HEROIC
HELM, 125633, 296660
SHOULDERS, 125634, 296636
CHEST, 125635, 296696
LEGGINGS, 125637, 296648
GAUNTLETS, 125640, 296672

### _forged - DEATHKNIGHT - MYTHIC
HELM, 125669, 296661
SHOULDERS, 125670, 296637
CHEST, 125661, 296697
LEGGINGS, 125663, 296649
GAUNTLETS, 125666, 296673

### _cured - ROGUE - RAID_FINDER
HELM, 123453, 297091
SHOULDERS, 123454, 297067
CHEST, 123455, 297127
LEGGINGS, 123457, 297079
GAUNTLETS, 123460, 297103

### _cured - ROGUE - NORMAL
HELM, 123475, 297086
SHOULDERS, 123476, 297062
CHEST, 123477, 297122
LEGGINGS, 123479, 297074
GAUNTLETS, 123482, 297098

### _cured - ROGUE - HEROIC
HELM, 123442, 297092
SHOULDERS, 123443, 297068
CHEST, 123444, 297128
LEGGINGS, 123446, 297080
GAUNTLETS, 123449, 297104

### _cured - ROGUE - MYTHIC
HELM, 123440, 297093
SHOULDERS, 123441, 297069
CHEST, 123433, 297129
LEGGINGS, 123435, 297081
GAUNTLETS, 123438, 297105

### _cured - MONK - RAID_FINDER
HELM, 125595, 297199
SHOULDERS, 125596, 297175
CHEST, 125597, 297235
LEGGINGS, 125599, 297187
GAUNTLETS, 125602, 297211

### _cured - MONK - NORMAL
HELM, 125535, 297194
SHOULDERS, 125536, 297170
CHEST, 125537, 297230
LEGGINGS, 125539, 297182
GAUNTLETS, 125542, 297206

### _cured - MONK - HEROIC
HELM, 125559, 297200
SHOULDERS, 125560, 297176
CHEST, 125561, 297236
LEGGINGS, 125563, 297188
GAUNTLETS, 125566, 297212

### _cured - MONK - MYTHIC
HELM, 125580, 297201
SHOULDERS, 125581, 297177
CHEST, 125573, 297237
LEGGINGS, 125575, 297189
GAUNTLETS, 125578, 297213

### _cured - DRUID - RAID_FINDER
HELM, 126723, 297307
SHOULDERS, 126724, 297283
CHEST, 126725, 297343
LEGGINGS, 126727, 297295
GAUNTLETS, 126730, 297319

### _cured - DRUID - NORMAL
HELM, 126759, 297302
SHOULDERS, 126760, 297278
CHEST, 126761, 297338
LEGGINGS, 126763, 297290
GAUNTLETS, 126766, 297314

### _cured - DRUID - HEROIC
HELM, 126711, 297308
SHOULDERS, 126712, 297284
CHEST, 126713, 297344
LEGGINGS, 126715, 297296
GAUNTLETS, 126718, 297320

### _cured - DRUID - MYTHIC
HELM, 126757, 297309
SHOULDERS, 126758, 297285
CHEST, 126749, 297345
LEGGINGS, 126751, 297297
GAUNTLETS, 126754, 297321

### _cured - DEMONHUNTER - RAID_FINDER
HELM, 124245, 297415
SHOULDERS, 124246, 297391
CHEST, 124247, 297451
LEGGINGS, 124249, 297403
GAUNTLETS, 124252, 297427

### _cured - DEMONHUNTER - NORMAL
HELM, 124185, 297410
SHOULDERS, 124186, 297386
CHEST, 124187, 297446
LEGGINGS, 124189, 297398
GAUNTLETS, 124192, 297422

### _cured - DEMONHUNTER - HEROIC
HELM, 124209, 297416
SHOULDERS, 124210, 297392
CHEST, 124211, 297452
LEGGINGS, 124213, 297404
GAUNTLETS, 124216, 297428

### _cured - DEMONHUNTER - MYTHIC
HELM, 124206, 297417
SHOULDERS, 124207, 297393
CHEST, 124199, 297453
LEGGINGS, 124201, 297405
GAUNTLETS, 124204, 297429

### _cast - HUNTER - RAID_FINDER
HELM, 125960, 296875
SHOULDERS, 125961, 296851
CHEST, 125962, 296911
LEGGINGS, 125964, 296863
GAUNTLETS, 125967, 296887

### _cast - HUNTER - NORMAL
HELM, 125996, 296870
SHOULDERS, 125997, 296846
CHEST, 125998, 296906
LEGGINGS, 126000, 296858
GAUNTLETS, 126003, 296882

### _cast - HUNTER - HEROIC
HELM, 125948, 296876
SHOULDERS, 125949, 296852
CHEST, 125950, 296912
LEGGINGS, 125952, 296864
GAUNTLETS, 125955, 296888

### _cast - HUNTER - MYTHIC
HELM, 125993, 296877
SHOULDERS, 125994, 296853
CHEST, 125986, 296913
LEGGINGS, 125988, 296865
GAUNTLETS, 126122, 296889

### _cast - SHAMAN - RAID_FINDER
HELM, 127113, 296767
SHOULDERS, 127114, 296743
CHEST, 127115, 296800
LEGGINGS, 127117, 296752
GAUNTLETS, 127120, 296779

### _cast - SHAMAN - NORMAL
HELM, 127101, 296762
SHOULDERS, 127102, 296738
CHEST, 127103, 296801
LEGGINGS, 127105, 296753
GAUNTLETS, 127108, 296774

### _cast - SHAMAN - HEROIC
HELM, 127077, 296768
SHOULDERS, 127078, 296744
CHEST, 127079, 296802
LEGGINGS, 127081, 296754
GAUNTLETS, 127084, 296780

### _cast - SHAMAN - MYTHIC
HELM, 127099, 296769
SHOULDERS, 127100, 296745
CHEST, 127091, 296803
LEGGINGS, 127093, 296755
GAUNTLETS, 127096, 296781

### _cast - EVOKER - RAID_FINDER
HELM, 126201, 296983
SHOULDERS, 126202, 296959
CHEST, 126203, 297019
LEGGINGS, 126205, 296971
GAUNTLETS, 126208, 296995

### _cast - EVOKER - NORMAL
HELM, 126228, 296978
SHOULDERS, 126229, 296954
CHEST, 126211, 297014
LEGGINGS, 126213, 296966
GAUNTLETS, 126216, 296990

### _cast - EVOKER - HEROIC
HELM, 126191, 296984
SHOULDERS, 126192, 296960
CHEST, 126193, 297020
LEGGINGS, 126195, 296972
GAUNTLETS, 126198, 296996

### _cast - EVOKER - MYTHIC
HELM, 126218, 296985
SHOULDERS, 126227, 296961
CHEST, 126220, 297021
LEGGINGS, 126222, 296973
GAUNTLETS, 126225, 296997
```

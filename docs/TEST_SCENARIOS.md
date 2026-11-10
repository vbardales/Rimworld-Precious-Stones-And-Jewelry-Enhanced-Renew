# Test scenarios

One scenario per behaviour the description promises. Nothing here has been played: every row is
`unverified` until the in-game pass (`playTests`). Numbers come from the code (`ThoughtWorker_ShinyEquipment.cs`,
`Mod/Defs`) and from the shipped game data, read on 2026-10-28.

## Colonists

Every scenario uses the colonists of Nelim's Sanctuary Backlot (save `Nelims-tribe`, mod SanctuaryBacklot, mod of the owner), not
the colonists of Pickle's `test-colony`, unless the owner grants an express, motivated exception (owner rule, 2026-10-28).
"The colonist" below is a named person of that save (Miel, Soren, Ryu, Ada, Jiro...), reacquired by name after each load. The Greedy,
Jealous or Ascetic trait is given or removed by a step for the scenario, then restored. A colonist with no gender (scenario 20) is not
in that save: the step that makes one acts on an NSB colonist, or the owner decides an exception.

## Rules the scenarios check

- A worn apparel or the primary weapon is scored by the Beauty stat factor of its **stuff**, only when the
  stuff is in the `Metallic` or `Stony` category.
- Beauty factor 2.0 or more is shiny, worth 1 point. 4.0 or more is glistening, worth 3 points.
- Game data for the four stuffs: Silver 2.0 (Metallic), Gold 4.0 (Metallic), Jade 2.5 (Stony), both read in
  Core `Items_Resource_Stuff.xml`; Obsidian 2.0 (Odyssey), recorded in the 2026-09 port audit, not re-read.
- Points add up over everything worn and held. The stage index is `points - 1`, capped by the game at the last
  declared stage, so the plain thought gives +1 to +6 mood.
- The Greedy thought (required trait: Greedy **or** Jealous) is added on top: +3 at one point up to +8 at six.
- The Ascetic thought gives -5 at any score and nullifies the plain thought.
- The mood tab label is `shiny <item>` or `glistening <item>`, with `, etc` when two or more items count.
  The item is the label of the first glistening item, else of the first shiny one.

## Scenarios

| # | Scenario | Precondition | Action | Expected | Status |
|---|---|---|---|---|---|
| 1 | Silver item scores one point | Colonist with no Greedy, Jealous or Ascetic trait, naked | Dress them in a silver necklace | Thought `Shiny things are nice.` at +1, label `shiny silver necklace` | unverified |
| 2 | Gold item is glistening | Same colonist | Dress them in a gold necklace | +3, label `glistening gold necklace` | unverified |
| 3 | Jade scores as shiny | Same colonist | Dress them in a jade pendant necklace | +1, label `shiny jade pendant necklace` | unverified |
| 4 | Obsidian scores as shiny (Odyssey) | Odyssey active, same colonist | Dress them in an obsidian necklace | +1, `shiny` label | unverified |
| 5 | A weapon counts | Same colonist | Give them a silver knife in hand | +1, label names the knife | unverified |
| 6 | Points add up, label carries `, etc` | Same colonist | Gold necklace (3) + silver knife (1) | +4, label `glistening gold necklace, etc` | unverified |
| 7 | Mood is capped at +6 | Same colonist | Gold necklace (3) + gold knife (3) + silver plate armour (1), seven points | Thought stays at +6 | unverified |
| 8 | Non-precious stuff scores nothing | Same colonist | Wear a steel necklace, hold a steel knife, wear a cloth shirt | No `Shiny things are nice.` thought | unverified |
| 9 | Greedy gets a second thought | Colonist with the Greedy trait | Gold necklace (3 points) | Plain +3 and `showing off riches` +5 | unverified |
| 10 | Jealous gets the same | Colonist with the Jealous trait | Same | Same two thoughts | unverified |
| 11 | Ascetic gets the penalty | Colonist with the Ascetic trait | Silver necklace | `ascetic has shiny item` at -5, no plain thought | unverified |
| 12 | Ascetic penalty is flat | Same Ascetic colonist | Gold necklace plus silver knife | Still -5 | unverified |
| 13 | Beads are craftable early | Neolithic start, no research | Open a bill on a crafting spot or tailoring bench for beads | Bill available, stone only (jade, obsidian, granite...) | unverified |
| 14 | Necklace and pendant need Smithing | Colony without Smithing research | Look for the necklace and pendant recipes at a smithy | Absent; present after Smithing, Crafting 3 required | unverified |
| 15 | Precious stuffs are allowed in the default bill | Smithing done | Add a necklace bill and read the ingredient filter | Gold, silver, jade, obsidian allowed; plasteel, uranium, bioferrite (Anomaly) not | unverified |
| 16 | Items carry a small social bonus | Any colonist | Dress them in a necklace, then beads | Social impact +10 % for necklace and pendant, +5 % for beads (stat tab) | unverified |
| 17 | Ideology offsets are guarded | With and without Ideology | Load the game both ways | No error either way; with Ideology, slave suppression -10 % (-5 % beads) | unverified |
| 18 | Mood label in French | Game in French | Scenarios 1, 2 and 6 | `éclat : <objet>`, `scintillement : <objet>`, with `, etc.` on the combined forms | unverified |
| 19 | Trait descriptions carry the added sentence | Game in English, then in French | Open the Greedy, Jealous and Ascetic trait cards | One extra sentence each in the loaded language; after a language change it appears only after a restart | unverified |
| 20 | French pawn sentences agree | Game in French | Show the Ascetic and Greedy (stage 2) thought texts on a male, a female and a no-gender colonist | `couvert`, `couverte`, `couvertx`; the pronoun of the three trait sentences for a no-gender colonist is checked here | unverified |
| 20b | The pawn pronoun of the French trait sentences | Game in French, a colonist with no gender (Gender.None) | Read the resolved Greedy, Jealous and Ascetic trait descriptions for that colonist | The sentence starts with the pronoun the engine resolves for that gender, and reads naturally (this finds out what it is); needs a step that resolves the description for a colonist, asked of NPT | unverified |
| 21 | No error in the log | Any of the above | Read `Player.log` after the run | No exception, no red error from this mod; no raw key shown in the UI | unverified |
| 22 | Items of other jewellery mods count, and those mods coexist | Optional integration pass: D4egon's Jewelry (`D4egon.D4egonsJewlry`, 3757128869) loaded, plus Tribal Jewelry (Continued), Itemization Overhaul - Jewelry & Charms, [OMW] Shiny Math Rocks and Jewelry (kikohi) | Dress a colonist in `D4J_DarkRing` made of Gold (Metallic, right hand: no clash with a neck piece), alone then with a gold necklace; wear items of the other mods that have no stuff | The dark ring made of Gold scores 3 points (alone: +3; with the gold necklace: +6, label with `, etc`); items with no stuff score nothing; no error in the log with all five mods loaded | unverified |
| 23 | Not done | | | Dropped by the owner on 2026-10-28 (a 1.5 save made with the original mod): no scenario, no check. | not applicable |

## Notes

- Incompatibility with the original mod (`DoctorStupid.ShinyMod`, `incompatibleWith` in About.xml): not tested, by the owner's decision of 2026-10-28; the other jewellery mods are (scenario 22). The earlier scenario 22 (the game's flag in the mod list) is gone, and so is scenario 23.
- Only D4egon's Jewelry of the five has apparel made of a Metallic or Stony stuff (`D4J_DarkRing`, `D4J_NazGhoulCrown`, read in its Defs on 2026-10-28); the four others add items with no stuff, which score nothing. Ancient Amulets (Continued) was not looked at.

- The Beauty factors and the stage cap are rules of the game. The scenarios read them as results, not as inputs.

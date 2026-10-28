# Test scenarios

One scenario per behaviour the description promises. Nothing here has been played: every row is
`unverified` until the in-game pass (`playTests`). Numbers come from the code (`ThoughtWorker_ShinyEquipment.cs`,
`Mod/Defs`) and from the shipped game data, read on 2026-10-28.

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
| 21 | No error in the log | Any of the above | Read `Player.log` after the run | No exception, no red error from this mod; no raw key shown in the UI | unverified |
| 22 | Incompatible with the original | Original `DoctorStupid.ShinyMod` also enabled | Open the mod list | The game flags the incompatibility | unverified |
| 23 | A 1.5 save keeps its jewellery | A save made with the original mod | Load it with this mod instead | Jewellery items present, no missing-def error (defNames unchanged) | unverified, needs an old save |

## Notes

- The Beauty factors and the stage cap are rules of the game. The scenarios read them as results, not as inputs.

# Precious Stones and Jewelry Enhanced Renew (unofficial)

A port to the latest RimWorld version of **Precious Stones and Jewelry Enhanced** by **DoctorStupid**
([Steam](https://steamcommunity.com/sharedfiles/filedetails/?id=2903245563)), which declares 1.4
and 1.5 and nothing further.

Colonists get a mood bonus for carrying a weapon or wearing clothes made of a beautiful material.
Not for the item — for the **stuff it is made of**. Plus three neck pieces, so you can put someone
in gold without putting them in plate armour.

## What it does

Every worn apparel and the weapon in hand is scored by the Beauty stat factor of its stuff,
provided that stuff is Metallic or Stony:

| stuff | Beauty factor | reads as | points |
|---|---|---|---|
| Gold | 4.0 | glistening | 3 |
| Jade | 2.5 | shiny | 1 |
| Obsidian | 2.0 | shiny | 1 |
| Silver | 2.0 | shiny | 1 |

That is the complete list across Core and every expansion. Obsidian is new in Odyssey and did not
exist when the mod was written; it qualifies.

Points add up across everything a colonist wears and holds, and the mood bonus climbs with them
from +1 to +6. The mood tab names the piece that earned it. Three traits change the picture, and
their in-game descriptions now say so:

- **Greedy** or **jealous** colonists get a second, larger thought on top, up to +8.
- **Ascetic** colonists get −5 instead, and no bonus at all.

Three neck pieces come with it — beads, a pendant necklace, a metal necklace — from neolithic to
medieval. They sit on the body slot, take the colour of their material, and give a small social
impact bonus.

## Not redundant with the jewellery mods that are alive

The name says jewellery; the mechanic is not about jewellery. Ancient Amulets (Continued),
D4egon's Jewelry, Itemization Overhaul - Jewelry & Charms, Jewelry (kikohi), Tribal Jewelry
(Continued) and [OMW] Shiny Math Rocks are all alive on the latest RimWorld version, and they **add items**. None of them
implements a mood thought driven by the beauty of the material a worn or wielded thing is made of.

That was checked, not assumed: every `.xml` across the 10 358 installed Workshop mods was searched,
and the only two custom situational thoughts about beautiful materials read the pawn's
**surroundings** — metal in the bedroom, furniture standing nearby — not their person. Items from
any of those mods count towards this one, as long as they are made from stuff.
[`ATTRIBUTION.md`](ATTRIBUTION.md) has the table.

## What changed in the port

**Nothing 1.6 removed.** Every field and method the mod uses was verified against the shipped 1.6
assembly before anything was rebuilt, and all of it is still there. The C# is recompiled against
1.6 from the source the original shipped, rather than carried over as a 1.4 binary.

Four things were broken **before** 1.6 and are fixed here:

- **The trait sentences never appeared outside English.** They were attached by comparing a trait's
  degree label against the English word, and degree labels are translated — the French pack ships
  "cupide" for greedy.
- **Gold, silver, jade and obsidian were barred from the default bill** for all three jewellery
  items, inherited from vanilla's clothing ingredient filter. Right for a shirt; it defeats a
  necklace.
- **The mood tab label was assembled in English inside the code**, putting the one string a player
  reads most often out of every translator's reach.
- **A pawn with no apparel tracker would have thrown** rather than scored zero.

Nothing else moved. Item stats, recipes, gates, mood values, thresholds, artwork and defNames are
as DoctorStupid made them, so a save carried over from the 1.5 mod keeps its jewellery. The two
mods cannot run together; the original is declared incompatible.

Two design questions the port had to settle — whether to keep the startup mutation of vanilla
trait descriptions, and how to make the thought label translatable — are argued out in
[`ATTRIBUTION.md`](ATTRIBUTION.md).

## Languages

English and French. The French avoids adjectives in the thought label, because an adjective would
have to agree with an item label the game supplies at runtime; a noun and a colon agree with
nothing.

## Repository layout

```
Mod/       published to the Workshop; the junction into RimWorld/Mods points here
Source/    C#, never published; OutputPath = ..\Mod\Assemblies\
Art/       Preview and ModIcon sources and outputs, never published
build/     build intermediates, ignored by git
```

Build with `dotnet build -c Release` from `Source/`. References come from NuGet
(`Krafs.Rimworld.Ref`), so no RimWorld installation is needed to compile. There is no Harmony
dependency.

## Credit and removal

DoctorStupid declared no licence — no file in the mod, nothing in its `About.xml`, no linked
repository, and nothing in the body of the description on its Steam page. It is republished here
under the usual convention for abandoned mods: full credit, a link to the original, and removal on
request, without argument.

## Licence

MIT for the port work only. The original mod's content is not covered and cannot be — see
[`LICENSE`](LICENSE) for exactly where the line falls.

## AI-generated

The port work was done with Claude Code (Anthropic), under human direction, review and in-game
testing.

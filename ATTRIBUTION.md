# Precious Stones and Jewelry Enhanced — attribution

A 1.6 port of **Precious Stones and Jewelry Enhanced**, by **DoctorStupid**
([2903245563](https://steamcommunity.com/sharedfiles/filedetails/?id=2903245563)).

## Status: public

The source mod is **dead** — it declares 1.4 and 1.5 and nothing further — and **no licence is
declared anywhere**, checked at the four places one could be: no `LICENSE` or `COPYING` file in the
mod, no mention in its `About.xml`, no linked repository (there is no `<url>` at all), and nothing
in the body of the description on its Steam page. That last check is the one that matters: it is
the one that was skipped once on たたら製鉄, whose ban on redistribution turned out to be a sentence
in its description and nowhere else. The description here is four sentences of feature copy, with
no clause of any kind.

This is the usual convention for ports on the RimWorld Workshop: republished with **credit by
name** and **removal on request, without argument**. The `<author>` field reads
`DoctorStupid - 1.6 port: nelim`, and the removal clause is in the description.

## Not redundant with the jewellery mods that are alive

Worth stating, because the mod's name says jewellery and its mechanic does not.

Plenty of jewellery is alive in 1.6 — Ancient Amulets (Continued), D4egon's Jewelry, Itemization
Overhaul - Jewelry & Charms, Jewelry (kikohi), Tribal Jewelry (Continued), [OMW] Shiny Math Rocks.
They **add items**. This mod's weight is not its three necklaces; it is a mood thought driven by
the **Beauty stat factor of the material a worn or wielded thing is made of**, which none of them
implements.

Checked rather than assumed. Every `.xml` in the 10 358 installed Workshop mods was searched for
`shiny`, `glisten` or `precious`; 1 031 files matched, of which 23 were thought definitions. Two
of those are custom situational thoughts about beautiful materials, and both are about the pawn's
**surroundings**, not their person:

| mod | worker | what it reads |
|---|---|---|
| Erin's Corvyia | `Corvyia.ThoughtWorker_PrettyMetalInBedroom` | metal furniture in the pawn's own bedroom |
| For Colour and Justice Kz | `CJ.ThoughtWorker_NearbyStuffOfBuildings` | the stuff of buildings standing nearby |

Nothing reads worn apparel or held equipment. The slot is free, and items from any of those mods
count towards this one as long as they are made from stuff.

## What was carried over

Everything the mod was: five defs, forty-eight textures, and about 150 lines of C#.

| def | type | what it is |
|---|---|---|
| `DoctorStupid_ShinyEquipment` | `ThoughtDef` | +1 to +6, nullified by Ascetic |
| `DoctorStupid_ShinyEquipment_Ascetic` | `ThoughtDef` | −5, requires Ascetic |
| `DoctorStupid_ShinyEquipment_Greedy` | `ThoughtDef` | +3 to +8, requires Greedy **or** Jealous |
| `DoctorStupid_Apparel_Necklace` | `ThingDef` | metal band, body slot, smithy |
| `DoctorStupid_Apparel_Amulet` | `ThingDef` | cut stone pendant, body slot, smithy |
| `DoctorStupid_Apparel_Beads` | `ThingDef` | stone beads, body slot, neolithic |

The thresholds (2.0 shiny, 4.0 glistening), the point values (1 and 3), the six mood steps, the
item stats, the recipes, the research and skill gates and the textures are DoctorStupid's,
unchanged.

## The defNames were kept, and so was the namespace

Every defName carries the author's own `DoctorStupid_` prefix, so there is nothing to collide with
and nothing to decide. The C# namespace `DoctorStupid.ShinyMod` and the assembly name `ShinyMod`
are kept too: the `workerClass` strings in the ThoughtDefs name that namespace, and so would any
other mod patching this one. A save carried over from the 1.5 mod keeps its jewellery.

## What 1.6 actually broke

**Nothing.** This is the rare case where the version bump costs nothing at all, and it was verified
one item at a time against the shipped 1.6 `Assembly-CSharp.dll` rather than assumed:

- `ApparelProperties.wornGraphicPath`, `countsAsClothingForNudity`, `canBeDesiredForIdeo`,
  `bodyPartGroups`, `layers` — all present. `wornGraphicPaths`, plural, is new in 1.6 and is for
  picking one of several graphics at random; these three items have one graphic each, so it does
  not apply.
- `ThoughtDef.validWhileDespawned` — present.
- `ThoughtState.ActiveAtStage(int)` and `ActiveAtStage(int, string)` — both present.
- `ThoughtWorker.CurrentStateInternal(Pawn)` — still `protected virtual`.
- `StuffCategoryDefOf.Metallic`, `StuffCategoryDefOf.Stony`, `StatDefOf.Beauty`,
  `Thing.LabelNoParenthesis` — all unchanged.
- `ArmorSmithableBase`, `ApparelMakeableBase`, the `Neck` body part group, the `ApparelMisc`
  category and `UnfinishedArmor` all still exist in Core.

`scripts/Check-XmlFields.ps1`, `Check-XmlClasses.ps1`, `Check-DefRefs.ps1` and
`Check-DefInjected.ps1` all come back clean.

So the C# is simply recompiled against 1.6 from the source the original shipped, rather than
carried over as a 1.4 binary.

One thing 1.6 *added* is worth knowing: **obsidian**, from Odyssey, is Stony *and* Metallic with a
Beauty factor of exactly 2.0. It qualifies as shiny, and it did not exist when this mod was
written. The full list of materials that score, across Core and every expansion:

| stuff | Beauty factor | worth |
|---|---|---|
| Gold | 4.0 | glistening, 3 points |
| Jade | 2.5 | shiny, 1 point |
| Obsidian | 2.0 | shiny, 1 point |
| Silver | 2.0 | shiny, 1 point |

## What was broken before 1.6

Four defects that had nothing to do with the version.

**The trait sentences never appeared outside English.** `Class2.cs` walked the degree list of
Greedy, Jealous and Ascetic looking for `degreeDatas[i].label == "greedy"` and so on, and a degree
label is translated: the French pack ships `<Greedy.degreeDatas.greedy.label>cupide</...>`, so the
comparison could not match and the sentence was never appended. All three traits have exactly one
degree, so the loop had nothing to select anyway; it appends to every degree now.

**And the sentence itself was English no matter what.** It was concatenated in code, so even in
English-adjacent cases it appended an English clause to whatever the loaded language had produced.
It comes from a keyed string now — see the note below on why this stays a static constructor
rather than becoming an XML patch.

**Gold, silver, jade and obsidian were off the default bill.** All three items inherit
`recipeMaker.defaultIngredientFilter` from `ApparelMakeableBase` or `ArmorSmithableBase`, and both
of those bar `Gold`, `Silver`, `Plasteel`, `Jade`, `Uranium`, `Bioferrite` and `Obsidian` — right
for a shirt, and precisely wrong for a mod whose necklaces exist to be made of those. A player had
to open every bill and tick them by hand. The filter is overridden on the three items now: gold,
silver, jade and obsidian back in; plasteel, uranium and bioferrite still out, being neither
precious nor pleasant against the skin.

**The worker dereferenced `p.apparel` without a check.** In practice the thoughts are gated on
traits and only humanlikes have those, so it never fired; it is guarded now, along with
`p.equipment`, for the cost of a `?`.

## The two decisions the port had to take

**1. The trait descriptions: kept, and made translatable.** The mechanism stays a
`[StaticConstructorOnStartup]` because the alternative does not work. A `PatchOperation` on the
TraitDef is applied *before* DefInjected translations are injected, so the language pack would
overwrite the patched description wholesale and the sentence would vanish in every language but
English — the same failure, arrived at from the other side. Static constructors run *after*
translation injection, which is exactly why the original could append to a translated string at
all. So: same hook, but the appended sentence is now `"ShinyMod.Trait.Greedy".Translate()` and
friends, and the append is guarded by a `Contains` check so it cannot double up.

The remaining edge, stated rather than hidden: a static constructor runs once per process, and
changing the game's language reloads the defs without re-running it. The sentences are absent
until the game is restarted. Fixing that would mean a Harmony dependency for three sentences of
flavour text, which is not a trade worth making.

**2. The thought labels: `{0}` kept, the reason moved to keyed strings.** The stage labels are
`{0}` and the worker fills them, which is the vanilla pattern — Core writes
`<label>my friend {0} died</label>` for the same reason. What was not the vanilla pattern was
building the fill from `"shiny " + label` and `text + ", etc"` in C#. Those three fragments are
`ShinyMod.Reason.Shiny`, `ShinyMod.Reason.Glistening` and `ShinyMod.Reason.AndMore` now, in
`Languages/English/Keyed` and `Languages/French/Keyed`.

The French is a noun and a colon — `éclat : collier` — rather than an adjective. An adjective
would have to agree in gender and number with an item label the game supplies at runtime
("collier brillant" but "perles brillantes"), and nothing in the string knows which it is getting.
A noun agrees with nothing. Vanilla's own French does the same thing wherever it can.

## What else changed

- **The ascetic thought declares one stage instead of six.** `ThoughtState.StageIndexFor` clamps
  the index the worker returns to the last stage a def declares, so one stage catches all six and
  the penalty is the same −5 it always was. Six identical stages meant six copies of the same
  sentence for every translator.
- **One typo** in a greedy thought description: "shrowded" → "shrouded".
- **The scoring loop is one method instead of two copies.** The original repeated the same
  forty-line block for equipment and for apparel; the behaviour is identical, including the rule
  that the first *glistening* item takes the label outright even if a shiny one was found first.

## What was deliberately left alone

- **A greedy pawn gets both thoughts at once.** The plain thought is nullified only by Ascetic, and
  the greedy thought requires Greedy or Jealous, so a greedy colonist in gold collects +6 and +8
  together. `requiredTraits` is any-of, not all-of — that was checked in `ThoughtUtility.
  CanGetThought` rather than assumed. It reads like a deliberate crescendo, and changing it would
  be a rebalance rather than a port.
- **"Shiny things are nice." six times over** as the plain thought's description, unchanged
  through all six mood steps. Flat, and the author's.
- **The pendant needs Smithing research** although it is cut stone worked at a smithy. Odd, and
  priced that way since 1.4.
- **`WorkToMake` is 2000 for all three** regardless of tech level, and the beads are neolithic.

## Textures and images

The forty-eight textures are DoctorStupid's, byte for byte, at their original paths under
`Textures/DoctorStupid/Apparel/`. `About/Preview.png` is DoctorStupid's own showcase, unchanged and
unrecut — 640×360 and 105 KB, well inside Steam's hard limit.

There is **no `About/ModIcon.png`**, and that is deliberate. The icon is the one file in a port
that claims to say "this is the mod", and cropping it out of the upstream author's sprite sheet
would make their art carry an identity they did not choose. It ships without one until a mascot
icon is drawn for it; RimWorld is perfectly happy without.

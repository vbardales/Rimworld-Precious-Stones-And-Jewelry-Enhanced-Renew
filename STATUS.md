---
mod: Precious Stones and Jewelry Enhanced Renew (unofficial)
packageId: nelim.preciousstonesandjewelry
repo: Rimworld-Precious-Stones-And-Jewelry-Enhanced-Renew
remote: https://github.com/vbardales/Rimworld-Precious-Stones-And-Jewelry-Enhanced-Renew.git
visibility: public
detached: yes
workflow_stage: playTests[1.0.0]
licence: silent
licence_at: "2026-09-13: source DoctorStupid (2903245563) declares only 1.4 and 1.5, so abandoned by the workflow definition; no licence in the mod files, in About.xml, or in the Steam description body; no linked repository"
upstream_mod_remotes: N/A
settings_audit: not_applicable
localization: complete
translation_en: complete
translation_fr: complete
dependencies: none
workshop: 3811382942
published: no
tested_on: never
remaining:
  - "2026-10-28: defect: Art/Preview-source.png mean value 0.275 (rule: at least 0.30), large dark area on the left reads as a vignette; owner source, not touched"
  - "2026-10-28: unverified: current upstream permissions and Steam comments of 2903245563"
  - "2026-10-28: unverified: in game at playTests, French {PAWN_pronoun} for a pawn with no gender in the three ShinyMod.Trait.* sentences (ChatGPT review, 2026-10-28)"
  - "2026-10-28: unverified: Check-Translations.ps1 expects handle paths stages.0-N for the six {0} labels, French ships index paths stages.N (Check-DefInjected.ps1 resolves all 26 keys); settle in game"
  - "2026-10-28: unverified: gameplay regression suite and EN/FR in-game validation; the About claim of in-game testing is not backed by evidence"
updated: 2026-10-28
protocols_read_sha: 43dd90d4b7873c500347fba1be01275a48d5795b
---

# Precious Stones and Jewelry Enhanced Renew (unofficial): status

Current state only: the front matter above is the source of truth, run lines go to `docs/runs/`.

The 2026-09-13 direct audit (monorepo era) is kept in `docs/runs/2026-09-13-direct-audit.md`. Its
settings and dependency findings (no settings surface, Core API only) stay unchecked here until
`settings` and `declareDependencies`.

## setupRepo, 2026-10-28

- Name: portage of a dead mod, so original name + ` Renew`, suffix ` (unofficial)` (licence silent),
  author `DoctorStupid - 1.6 adapted by Nelim`. Version number removed from the display name and
  from reader-visible text. packageId `nelim.preciousstonesandjewelry` unchanged.
- Duplicate check (1.a): `Search-Workshop.sh` over About.xml names (`Precious Stone|Jewel|Gemstone|Shiny`),
  12 hits: the original 2903245563, this mod's own item 3811382942, and ten jewellery or shiny
  mods. None implements the mechanic (mood from the beauty of the material a worn or wielded thing
  is made of): the 2026-09 corpus search of shiny/glisten/precious thoughts found only two
  surroundings-based thoughts (Erin's Corvyia, For Colour and Justice Kz). Not a duplicate.
- About.xml: UNOFFICIAL paragraph opens the description.
- `Mod/About/PublishedFileId.txt` = 3811382942: a Workshop item exists, so the file is committed.
- GitHub repository renamed to `Rimworld-Precious-Stones-And-Jewelry-Enhanced-Renew` (owner, 2026-10-28); remote, `repo`, and the About.xml `<url>` and source link follow.
- Standalone repository set up over the existing public remote (single import commit of
  2026-09-11), history kept, no force push.
- Art: `ModIcon-source.png` cropped in place by badge mode at the owner's request (2026-10-28), the
  original is not kept in git before this commit; ModIcon badge corner set to bottom-left in
  `Art/Preview.config.json`; Preview regenerated.

## makeSources, 2026-10-28

- ModIcon source cropped by badge mode, derivatives regenerated: ModIcon.png 128x128 (26.5 KB), ModIcon.ico, Preview.png 896x504.
- Preview-source.png 1672x941: object readable (jeweler at a bench with the three neck pieces and the four materials), one figure seen from behind, 2 hue families (dominant 71 %), mean value 0.275 so below the 0.30 rule, which is recorded as a defect. No illustration prompt file exists, nothing to delete.
- Art holds the minimal set; the echo file stays named echo-preview.png (owner, 2026-10-28: renaming to echo-source.png comes later; Audit session informed).

## code, 2026-10-28

- No feature left for 1.0.0. `dotnet build Source/ShinyMod.csproj -c Release`: 0 errors, 0 warnings, intermediates in `build/`; the rebuilt `Mod/Assemblies/ShinyMod.dll` is byte-identical to the committed one (git shows no change). No local script. CHANGELOG `[Unreleased]` states the change.

## declareDependencies, 2026-10-28 (revision ffdfb9f)

- Code references only Core types (RimWorld, Verse: TraitDefOf, StuffCategoryDefOf, StatDefOf); no Harmony, no other mod. Defs reference Core defs only.
- DLC content is guarded on the element, never on an Operation: `MayRequire="Ludeon.RimWorld.Ideology"` on the three SlaveSuppressionOffset stats, `MayRequire="Ludeon.RimWorld.Anomaly"` on the three Bioferrite filter entries. Obsidian (Odyssey) is scored by its stuff properties at runtime, no def references it.
- About.xml: no `modDependencies`; `loadAfter` Ludeon.RimWorld; `incompatibleWith` DoctorStupid.ShinyMod, checked against the original About.xml (packageId DoctorStupid.ShinyMod, 1.4 and 1.5). `supportedVersions` 1.6. No LoadFolders.xml, no conditional patch, no load-order cycle possible. Not an animal mod, so ANIMALS.md does not apply.

## Settings audit, 2026-10-28 (revision 4cd2ecf)

- Inventory: the C# is two files (ShinyModTraitDescriptions.cs, ThoughtWorker_ShinyEquipment.cs). No Verse.Mod subclass, no ModSettings, no settings window, no MainButtonDef; Mod/Defs holds only ThingDefs_Misc and ThoughtDefs. Configurable behaviour is four fixed balance constants (Beauty thresholds 2.0 and 4.0, points 1 and 3) and six mood steps, preserved from the original.
- Decision: no settings. No concrete player need: the thresholds are the mod's rule and exposing them would be a rebalance, not a feature. Bill ingredients use the game's own bill interface.
- Access contract: absence of any settings page and any MainButtons shortcut is verified in sources and defs above. Shortcut integration and RIMMSQOL are not applicable. No test run, none claimed.
- Language switch: the trait sentences are appended by a static constructor, so a language change needs a restart. Not a setting; kept as an in-game case for playTests.

## Translation audit, 2026-10-28

- Inventory (source and defs): seven Keyed strings per language (three trait sentences and four reason wordings: Shiny, Glistening, Shiny.AndMore, Glistening.AndMore), three jewellery labels and descriptions, thought labels and descriptions of the three ThoughtDefs. The C# holds no literal player text: every string is a `.Translate()` key (checked by reading both files).
- Fix: the reason wrapped a translated fragment in another one (`AndMore` taking `{REASON}`). It is now four complete keyed sentences with the item as only parameter, in both languages. Source changed, DLL rebuilt (0 warnings, 0 errors).
- English: Def values and English Keyed, no gap. French: Languages/French/Keyed and Languages/French/DefInjected (ThingDef, ThoughtDef).
- `Check-DefInjected.ps1 -TransMod PreciousStonesAndJewelryRenew/Mod`: 26 keys, 0 errors. `Check-Translations.ps1`: 12 findings, all on the six `{0}` thought stages (handle form `stages.0-N` expected, index form shipped); the same 12 appeared before this change.
- French agreement, read sentence by sentence: two texts agree with the pawn (`couvert`), both three-segment, and the neutral segment is now `x` (couvertx, given by the owner on 2026-10-28; it was a middle dot form, forbidden inside the al system). The trait sentences start with `{PAWN_pronoun}`: flagged. No tu or vous. The reason wording is a noun and a colon on purpose (no agreement).
- `FRENCH_REVIEW.md` generated by `Make-FrenchReview.ps1`. Virginie's review not done: `translation_fr` stays `partial`.
- No in-game check done.

- ChatGPT review of FRENCH_REVIEW.md (2026-10-28, run on the middle dot version): the two neutral-segment findings were already fixed by couvertx, the epicene rewording is declined (agreement is kept when the gender is available); the pronoun finding is kept as an in-game check at playTests; the PUBLICATION.md finding waits for writeDocs.
- Second ChatGPT review (2026-10-28, on couvertx): Amulet description now says "fine bande de métal" (English: thin metal band, the French said chain). The pronoun finding stays the in-game check above. Virginie's review covers this changed text.
- Third ChatGPT review (2026-10-28): necklace description now says "bande de métal" (English: metal band; anneau means ring), ascetic stage label now "ascète portant un objet brillant" (English: has shiny item). Virginie's review covers both changed texts.
- French review by Virginie: reviewer Virginie, 2026-10-28, revision d9ab22b (FRENCH_REVIEW.md), validated in the session by her own message after four ChatGPT passes; corrections she asked for: couvertx as the neutral segment. Texts changed since the first pass: amulet and necklace (bande de métal), ascetic label (portant un objet brillant). The in-game pronoun check stays open for playTests. The session did not touch the Review line table of FRENCH_REVIEW.md, which is hers.

## writeTests, 2026-10-28 (Mod and Source last changed at d9ab22b)

- 7.a `TEST_SCENARIOS.md`: 23 scenarios, one per promised behaviour (thresholds and points checked against the code, Beauty factors of Silver 2.0, Gold 4.0 and Jade 2.5 read in Core, Obsidian not re-read). All `unverified`: nothing played.
- 7.b Automated unit tests: not applicable. The only logic (scoring, trait sentences) reads Pawn, Thing and ThingDef from the running game, so there is no pure function to test without the game; scenarios 1 to 12 and 19 cover it through Pickle. No artificial test added.
- 7.c XML checks, rerun now: `Check-ModBasics.ps1` PASS (7 XML files, 6 defs); `Check-XmlFields.ps1` 3 files, no unknown field; `Check-DefRefs.ps1` no missing reference, no wrong type, all parents resolved; `Check-DefInjected.ps1` 26 keys, 0 errors. `Check-XmlClasses.ps1` not run: it needs a TypeLists argument this mod does not have (its only class, the worker, is in the mod assembly).
- 7.f Results refer to the revision above.
- 7.d Pickle suites: written, not executed: 7 features, 32 scenario blocks (Check-Steps: 146 step lines, every one resolves to exactly one expression), no local step (the steps are NPT's, in PickleTools ColonistRace, commits 35838fa and dd3eb6e, compiled and not played). Two pass maps: wsl-deps.sanctuary-minimal.map (every feature but the integration one) and wsl-deps.sanctuary-d4egon.map (D4egon's Jewelry); neither proven for the Backlot colonists, the @probe scenario is played first at playTests. Odyssey, Ideology and Anomaly scenarios carry @requires. See Tests/Pickle/README.md.
- 7.e Not applicable, by choice: unit tests (7.b above); a pass without a DLC (the guards are read by the @requires scenarios, and no fixture without Ideology is known); a declared-incompatibility pass and a 1.5 save (owner, 2026-10-28); a restart sequence (the mod stores nothing).
- 7.h This section is the record: 7.a to 7.g done.
- Colonists of the Pickle suite: those of Nelim's Sanctuary Backlot (save Nelims-tribe), never test-colony, unless the owner grants an express, motivated exception (owner rule, 2026-10-28). Recorded in TEST_SCENARIOS.md.
- Scenarios dropped or changed (owner, 2026-10-28): 23 (1.5 save of the original) is not done; the original-mod incompatibility is not tested; scenario 22 now covers the other jewellery mods (optional integration pass, D4egon's Jewelry item made of Gold counts).

## playTests, 2026-10-28

Entered from writeTests with 7.a to 7.h recorded above. Order of the first tickets: the @probe scenario with wsl-deps.sanctuary-minimal.map (do the Backlot colonists load, do the new steps work, calibrate the stat bounds from the [stat] log), then the full pass in English and in French, then the D4egon pass. Nothing played yet. The tested revision of Mod and Source is d9ab22b.
- Ticket 20261028-112650-429-9357 filed (probe, `-DepMap wsl-deps.sanctuary-minimal.map`, filter @probe, label 532b95c). Mod, Source and Tests stay frozen until RUN_DONE.
- ChatGPT review, fifth pass (2026-10-28): no language correction. The one pertinent point, the pronoun of the French trait sentences for a colonist with no gender, is now scenario 20b in TEST_SCENARIOS.md; the feature waits for a step NPT was asked for (trait description resolved for a colonist). Nothing else to apply.

---
mod: Precious Stones and Jewelry Enhanced Renew (unofficial)
packageId: nelim.preciousstonesandjewelry
repo: Rimworld-Precious-Stones-And-Jewelry-Enhanced-Renew
remote: https://github.com/vbardales/Rimworld-Precious-Stones-And-Jewelry-Enhanced-Renew.git
visibility: public
detached: yes
workflow_stage: code[1.0.0]
licence: silent
licence_at: "2026-09-13: source DoctorStupid (2903245563) declares only 1.4 and 1.5, so abandoned by the workflow definition; no licence in the mod files, in About.xml, or in the Steam description body; no linked repository"
upstream_mod_remotes: N/A
settings_audit: unchecked
localization: partial
translation_en: complete
translation_fr: unchecked
dependencies: unchecked
workshop: 3811382942
published: no
tested_on: never
remaining:
  - "2026-10-28: defect: Art/Preview-source.png mean value 0.275 (rule: at least 0.30), large dark area on the left reads as a vignette; owner source, not touched"
  - "2026-10-28: unverified: current upstream permissions and Steam comments of 2903245563"
  - "2026-10-28: defect: Art/Preview.config.json echo file is echo-preview.png, the minimal set names echo-source.png"
  - "2026-10-28: defect: thought reason wraps an already translated fragment (ThoughtWorker_ShinyEquipment.cs) instead of complete parameterized variants"
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
- Art holds the minimal set; the echo file is still named echo-preview.png.

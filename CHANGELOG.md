# Changelog

All notable changes to this port are recorded here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Added

- 1.6 port of Precious Stones and Jewelry Enhanced by DoctorStupid, rebuilt from the C# the
  original shipped rather than from its 1.4 binary.
- ModIcon and Workshop Preview.
- English and French keyed strings for the thought label, and a French translation of the three
  jewellery items and the three thoughts.

### Fixed

- The sentence appended to the greedy, jealous and ascetic trait descriptions never appeared in
  any language but English. It selected the trait degree by comparing its label against the
  English word, and degree labels are translated — the French pack ships "cupide" for greedy, so
  the comparison never matched. It now applies to every degree of the three traits, which is the
  same thing in English since each has exactly one.
- The appended sentence was English regardless of the loaded language. It is a keyed string now,
  and the append is guarded so it cannot double up.
- Gold, silver, jade and obsidian were barred from the default bill for all three jewellery items,
  inherited from the vanilla clothing ingredient filter. They are allowed back; plasteel, uranium
  and bioferrite stay out.
- The mood tab label was concatenated in English inside the worker, so no translation could reach
  it. It comes from `ShinyMod.Reason.*` keys now.
- `Pawn.apparel` and `Pawn.equipment` were dereferenced without a null check.
- Typo in a greedy thought description: "shrowded" → "shrouded".

### Changed

- The ascetic thought declares one stage instead of six identical ones.
  `ThoughtState.StageIndexFor` clamps to the last stage a def declares, so the −5 applies at every
  score exactly as before.
- The scoring loop, previously duplicated for equipment and for apparel, is one method. Same
  behaviour, including the rule that the first glistening item takes the label outright.


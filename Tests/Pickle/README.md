# Pickle suite of Precious Stones and Jewelry Enhanced Renew

Development only, never published. Scenarios are written, **none has been played** (2026-10-28).

## What it tests

`TEST_SCENARIOS.md` at the mod root lists the scenarios. This suite holds those that need a running game:

| Feature | Scenarios |
|---|---|
| `precious-stones-probe.feature` (`@probe`) | One scenario: do the Backlot colonists load with the minimal map, do the steps work |
| `precious-stones-score.feature` | 1 to 12 (score and traits), 18 (mood label, `@english` and `@french`) |
| `precious-stones-trait-text.feature` | 19 (trait descriptions, `@english` and `@french`) |
| `precious-stones-other-jewellery.feature` | 22 (D4egon's Jewelry, optional integration, `@requires:D4egon.D4egonsJewlry`) |

Not written yet, waiting for steps NPT may add to PickleTools: 13 to 16 (recipes, bill filter, stat) and 20 (French agreement of a thought
text for a colonist with no gender). Not done by the owner's decision: 23, and the original-mod incompatibility.

## Colonists

Those of Nelim's Sanctuary Backlot (save `Nelims-tribe`), never `test-colony`, unless the owner grants an express, motivated exception
(owner rule, 2026-10-28). Safe names in the save: Nelim, Miel, Soren, Ryu. These features use Miel. Edits made by a scenario live in memory and
the fixture is never written back.

## Pass maps

`wsl-deps.sanctuary-minimal.map` stages only what the Backlot depends on. It is **not proven** to load the colonists without the Backlot's
third-party list (facial animation, realistic bodies): play `@probe` first and read `Player.log`. If it fails, copy
`SanctuaryBacklot/Tests/Pickle/wsl-deps.sanctuary.map` here line by line, add `path:SanctuaryBacklot/Mod` and the config seeds of
`SanctuaryBacklot/Tests/Pickle/config/sanctuary/`.

The integration feature needs a map that also stages D4egon's Jewelry (`D4egon.D4egonsJewlry`, Workshop 3757128869): a second map, to write once the probe passes.

## Steps

No local step. Steps come from Pickle and from Nelim's Pickle Tools (ColonistRace: wear and wield made of a stuff, has the trait, thought label,
trait description). `scripts/Check-Steps.ps1 -ModRoot .`: every line resolves to exactly one expression.

## Language

`-Language English` or `-Language French` at launch, never inside a scenario. Filter `@english` or `@french` for the texts that differ.

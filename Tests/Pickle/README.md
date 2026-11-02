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

| `precious-stones-recipes.feature` | 13, 14, 15 (where the items are made, their gates, the default bill filter) |
| `precious-stones-stats.feature` | 16, 17 (equipped stat offsets; bounds to calibrate from the first run's `[stat]` log) |
| `precious-stones-french-agreement.feature` | 20 (couvert, couverte, couvertx; `@french`) |

| `precious-stones-pronoun.feature` | 20b (the French pronoun of the trait sentences for a colonist with no gender; the form is read from the run log) |

Not done by the owner's decision: 23, and the original-mod incompatibility.

## Colonists

Those of Nelim's Sanctuary Backlot (save `Nelims-tribe`), never `test-colony`, unless the owner grants an express, motivated exception
(owner rule, 2026-10-28). Safe names in the save: Nelim, Miel, Soren, Ryu. These features use Miel. Edits made by a scenario live in memory and
the fixture is never written back.

## Pass maps

`wsl-deps.sanctuary-minimal.map` (name kept) is the full third-party list of the Backlot, copied from `SanctuaryBacklot/Tests/Pickle/wsl-deps.sanctuary.map` on 2026-11-02 with the seeds in `config/sanctuary/`, after the first probe failed with only the lines the Backlot depends on (missing gene Eyes_DarkBrown, no Miel). Probe replayed with it.

The integration feature uses `wsl-deps.sanctuary-d4egon.map` (the same list plus D4egon's Jewelry, `D4egon.D4egonsJewlry`, Workshop 3757128869).

## Steps

No local step. Steps come from Pickle and from Nelim's Pickle Tools (ColonistRace: wear and wield made of a stuff, has the trait, thought label,
trait description). `scripts/Check-Steps.ps1 -ModRoot .`: every line resolves to exactly one expression.

## Language

`-Language English` or `-Language French` at launch, never inside a scenario. Filter `@english` or `@french` for the texts that differ.

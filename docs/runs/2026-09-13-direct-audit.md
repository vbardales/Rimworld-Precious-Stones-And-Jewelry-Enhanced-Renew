# Direct audit of 2026-09-13 (moved out of STATUS.md on 2026-10-28)

History only. Written when the mod lived in the monorepo; the state chain has changed since.

## Direct audit — 2026-09-13

Audited monorepo revision: `75c3000e1833d325cc7626a402981e4aa881d47a`.
The actual repository root is `C:/Users/nelim/Documents/rimworld`; this mod has no
local `.git`. Distributed content is `PreciousStonesAndJewelry/Mod`.
Before this audit, only STATUS.md was locally modified within this mod (three
unchecked localization fields added). Existing modifications and historical notes
above are preserved. Previous stage was blank, not a certified workflow state.
The stage now uses the literal workflow name `dansMonoRepo`; no legacy-code mapping
is needed. A prepared copy does not establish the `horsMonoRepo` gate.

### Ordered transitions

| Transition | Result and evidence |
| --- | --- |
| dansMonoRepo -> horsMonoRepo | Not passed: no standalone local Git repository established. `gh repo view vbardales/Rimworld-Precious-Stones-And-Jewelry-Enhanced --json nameWithOwner,visibility,url,defaultBranchRef` confirms the existing PUBLIC repository and main branch. A standalone remote and correspondence with pushed content remain unverified. This is not a complaint about the monorepo remote. English README, ATTRIBUTION, LICENSE and CHANGELOG exist; distributed LICENSE and ATTRIBUTION are byte-identical to their root copies. Public/silent is the recorded decision, supported by the installed upstream About declaring only 1.4/1.5. Current online permissions/comments were not rechecked; the historical no-permission claim is not newly certified. MIT is explicitly limited to port additions, not third-party assets. |
| horsMonoRepo -> ModIcon generated | Not passed: Mod/About/ModIcon.png is absent. Release build succeeded with zero warnings/errors; rebuilt DLL is byte-identical to the distributed DLL. No development-complete claim is made while regression tests remain unverified. |
| ModIcon generated -> Preview generated | Defect: directly inspected original upstream showcase, PNG 640x360, 107687 bytes. File size passes; expected 896x504 dimensions do not. The image is a sprite montage on a radial background, not the prescribed colony scene. No missing generation history is used as a blocker. |
| Preview generated -> preOptions | Defects: public/silent title lacks `(unofficial)` and description lacks the mandatory opening notice. Final source link is a bare URL, not `[url=...]Source code on GitHub[/url]`. Description is English. Current artwork lacks the specified title/tag/summary/rule/version-badge composition; accent/secondary treatment is not established. No naming mutation was made during the audit. |
| preOptions -> options | Independent pass: settings_audit not_applicable; see below. |
| options -> l10n | Partial: EN/FR resource coverage and injection paths pass. Source wraps an already translated Shiny/Glistening reason inside AndMore; TRANSLATIONS.md requires complete parameterized sentences instead of composed translated fragments. No missing key or observed in-game failure is inferred from this structural defect. |
| l10n -> preTest | Static dependency checks pass independently: Core API only; no Harmony or third-party runtime reference. Ideology stat and Anomaly material are guarded with MayRequire. Original package is explicitly incompatible. No LoadFolders or conditional patch folders exist. No DLC present/absent gameplay tests claimed. |
| preTest -> done | Not verified: no project functional scenario suite or automated gameplay regression suite found. XML checks executed successfully below; historical clean-check statements alone are not treated as current proof. |
| done -> tested | Not verified: no game launched, no current logs or EN/FR gameplay scenarios checked. New game, existing save, thought scoring/trait combinations, recipes and language-switch behavior remain to exercise. README/About claim human in-game testing, but no corresponding evidence was found; this claim does not certify tested. |

### Settings audit

Reviewed both C# files and all distributed definitions. Behavior comprises fixed
material Beauty thresholds (2 and 4), score weights (1 and 3), trait-dependent mood
stages and three jewelry recipes. These are preserved balance rules, not a promised
configuration surface. Bill ingredient selection uses the game's existing interface.
No useful additional setting is established by this audit. There is no Verse.Mod
settings entry, ModSettings persistence, settings window or MainButton definition.
No empty page or shortcut is exposed by the sources. Settings UI, bounds, persistence
and RIMMSQOL integration tests are therefore not applicable. No integration was tested.
This follows the user's explicit clarification that this gate does not require gameplay.

### Translation audit

Inventory: six Keyed strings (three trait additions and three thought-reason templates),
three jewelry labels/descriptions, and the descriptions/labels of 13 thought stages.
Six plain thought labels contain only `{0}` and receive the translated reason; no redundant
French injection is needed for that placeholder. English Def source text supplies native
English coverage. French supplies all 26 owned textual DefInjected paths. Keyed XML checks
found six nonempty keys per language, matching keys and parameters. Manual text review
covered the French pawn-gender expressions and inherited vanilla recipe text mechanism.
`Check-DefInjected.ps1 -TransMod <mod>/Mod` checked 26 keys with zero errors and no
unverified targets reported (11592 definitions indexed). Translation resource fields
are complete; overall localization remains partial for the nested translated-fragment
construction in ThoughtWorker_ShinyEquipment.cs. The historical language-switch limitation
in ATTRIBUTION.md (startup trait additions need a restart) remains a gameplay test case.

### Commands and artifact evidence

- Parsed every distributed XML successfully.
- `Check-XmlFields.ps1 -ModPath <mod>/Mod -ExtraAssemblies <mod>/Mod/Assemblies/ShinyMod.dll`: 3 files, no unknown fields.
- `Check-DefRefs.ps1 -ModPath <mod>/Mod`: 6 definitions, no missing or mistyped references, all parents resolved.
- `Check-DefInjected.ps1 -TransMod <mod>/Mod`: 26 keys, 0 errors.
- `dotnet build Source/ShinyMod.csproj -c Release -p:BaseIntermediateOutputPath=<mod>/.audit/obj/ -p:OutputPath=<mod>/.audit/bin/`: succeeded, 0 warnings/errors. Initial sandbox attempt failed with SDK-directory access denied; authorized retry succeeded. The distributed DLL was not overwritten.
- SHA256 of both built and distributed ShinyMod.dll: `71101D7D6477F46194ED3B73A6210FADD34E9642259DCD4CAA671ECD1374F507`.
- LICENSE root/distributed SHA256: `B3A3FF793BA6A68ECF0C3B2E44E490BCDDE3348AD5424553511420A21082BA14`.
- ATTRIBUTION root/distributed SHA256: `C96EE33CFE7DBD120C6BF524BBBF7D49B96D839D110C8F4FCA5E7BDEF764AC82`.
- Build intermediates were isolated for the audit. Normal Directory.Build.props currently targets the parent monorepo's .build directory; review this path when detaching.

### Next transition only

Establish the standalone local repository outside the monorepo, verify its configured
GitHub remote and pushed commit, and settle the current documented rights/naming decision.
The requested Renew folder is preparation, not evidence of a completed repository migration.
No images, features, commits or publications were made to improve the audit stage.

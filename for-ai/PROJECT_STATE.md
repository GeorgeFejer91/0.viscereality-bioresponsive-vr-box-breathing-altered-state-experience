# Current project state

Last updated: 2026-08-21

The durable next-session handoff is `for-ai/HANDOFF_NEXT_SESSION.md`. Read it after the mandatory bootstrap files and verify it against the current working tree before continuing.

## Git state at control-plane creation

- `main.tex` matches the committed repository version.
- `supplementary.tex` exists as an untracked, reconstructed supplementary draft.
- `AGENTS.md` and `for-ai/` are newly created internal control-plane files.

Agents must run `git status --short` at the start of any editing task because this snapshot will become stale.

## Known manuscript status

- The manuscript is formatted for Springer Nature.
- A LaTeX compiler was not available on the command path during the preceding checks.
- Citation keys used by the inspected manuscript and supplementary draft resolved against `references.bib` during the preceding static check.
- The manuscript declarations still contained submission placeholders when last reviewed, including author contributions and confirmation fields.
- The root still contains duplicate or legacy-named figure copies. They require a user-supervised artifact audit before the root can be treated literally as an upload-ready file set.
- The user has set the final analytic sample to the 39 included participants. Condition-level PLV values from all 47 tested participants may be used only during the quality-screening stage that determines the eight exclusions; all subsequent inferential protocols, including PLV condition tests, use only the 39 included participants.
- Participant flow must still report that 47 participants were tested, 8 were excluded, and 39 were analyzed.
- `main.tex`, archived supplementary material, and obsolete local figure variants still contain 47-participant inferential sensitivity remnants pending item-by-item removal approval. Participant-flow and PLV quality-screening material involving all 47 participants may remain when it does not report inferential condition comparisons.
- The canonical PLV screening visual is `Fig04_results_plv_exclusion_and_adherence_unified.pdf` with SHA-256 `53A85FE28AF5BB5A06747CBAF73DDD2FE758BAA328FBCFA050D0CE4C9D08EE1D`. It is the single-panel violin-and-cutoff figure and must not be replaced by a selected-versus-all-observed sensitivity-panel variant.
- `main.tex` now points directly to that canonical filename. The user approved deletion of the byte-identical `Fig06_plv_results.pdf` alias and the stale sensitivity-panel SVG, but the immutable research-artifact gate requires those deletions to be performed by the user or repository maintainer.
- The authoritative reproducibility repository contains corresponding full-sample outputs and pipeline references. These may be inventoried but cannot be modified by an AI agent.
- `main.tex` now defines the dark-screen control once as a dark field with a central fixation marker that also provided breathing-performance feedback and uses ``dark-screen control'' consistently as the short label thereafter.

## Authoritative research-source status

- Figures, statistics, original data, analysis pipelines, and figure-generation mechanisms originate from `https://github.com/GeorgeFejer91/0_OSF_reproducability_package`.
- The remote was confirmed reachable through Git on 2026-08-21.
- The remote HEAD observed on 2026-08-21 was `1368f4283e9186b551aecad6d626e17df9eeff0b`; this is an observation, not a permanent pin, and must be rechecked when provenance is audited.
- Anonymous webpage inspection returned 404 during the same check, but the Git remote itself resolved successfully.
- All of these research-source artifacts are read-only for AI agents. Recommendations may be made but never applied by an agent under the current instruction.
- At remote HEAD `1368f4283e9186b551aecad6d626e17df9eeff0b`, the committed Figure 4 PDF, PNG, and SVG are all the correct single-panel visual. The obsolete visual survives as dormant code in `2.AnalysisScripts/5.FigureGeneration/figure_pipeline_shared.py`, while the active adapter uses the single-panel implementation in `figure_pipeline_dissertation_style.py` and the validator forbids the obsolete panel labels.
- The authoritative package still generates and registers three full-sample sensitivity datasets plus a text report: `05_plv_all_observed_sensitivity.csv`, `05_plv_full_sample_sensitivity.csv`, `05_plv_full_sample_sensitivity.txt`, and `06_all_outcome_full_sample_sensitivity.csv`. Their generator, validator, consolidated-report sections, reviewer scope, metadata dictionaries, manifests, checksums, and upload-readiness statement require coordinated maintainer-side removal.

## Known supplementary status

- The original source of truth for supplementary text is the active Study 3 dissertation appendix body at `C:/Users/gyorg/Documents/GithubWriting/Dissertation/Dissertation_scaffold/Study 3/dissertation/dissertation_adapter/sections/study3_appendix.tex`.
- The canonical dissertation body is byte-identical to the Study 3 root copy in `Dissertation_scaffold` and the corresponding Study 3 copy in `Dissertation-scaffold-overleaf` at the observed checkpoints.
- The former root `supplementary.tex` was a reconstructed draft that was not byte-identical to the canonical dissertation appendix or either standalone dissertation supplementary source. It has been retired to `for-ai/archive/supplementary/supplementary-pre-restructure-2026-08-21.tex`.
- The active supplementary source is `supplementary/main.tex`. On 2026-08-21, the user approved and an agent implemented a supplementary-only technical restructure comprising preregistration deviations, PLV computation and quality screening, altered-state questionnaire analyses, temporal experience tracer analyses, blinding analyses, and reproducibility access.
- The implemented supplement contains the approved PLV equation, pooled lower-tail IQR calculation, exact exclusion list and condition-level PLV table, 3D-ASCr scoring equations, compact tracer-method description, Bang blinding-index definition and observed counts, and the OSF access statement.
- Exact numerical table bodies for the detailed 11-ASC, tracer, and expanded blinding results remain pending separate cell-by-cell approval because those values were not displayed in the approved recommendation batch. Their subsection structure is present but intentionally unpopulated.
- The GitHub reproducibility URL in the supplement retains the explicitly approved `FINAL_SUBMISSION_COMMIT` placeholder. It must not be treated as submission-ready until a cleaned immutable commit exists and its exact URL is separately approved.
- The newly populated supplementary sections do not yet have explicit, identifiable referrals in `main.tex`. The user expressly limited this implementation to the supplementary document and deferred all corresponding `main.tex` changes for separate analysis and item-by-item preapproval. This is an unresolved supplement-admissibility discrepancy, so the active supplement is a working technical draft and must not be treated as submission-ready.
- Before substantive content is added to or retained in the active supplement, it must be mapped to an explicit, identifiable referral in `main.tex`. Any missing referral is a mandatory unresolved discrepancy, requiring either an approved referral in `main.tex` or approved omission from the supplement.
- Supplementary tracer figure copies are stored in `supplementary/figures/`. Root copies remain temporarily because `main.tex` still references them.
- Retired supplementary material is stored in `for-ai/archive/supplementary/` and must not be included in external submission packages.
- The user has not approved corresponding edits to `main.tex` that would reroute temporal experience tracer content.
- The user selected a compact main-text altered-state hierarchy: the post-preregistration 3D-ASCr composites are to provide the primary summary, and the complete preregistered 11D-ASC analyses are to appear in Supplementary Section S3 after exact wording and movement proposals are approved.
- The approved main-text 3D-ASCr rationale has been implemented in `main.tex`. It identifies the higher-order model as post-preregistration, explains its theoretical and parsimony rationale, and explicitly refers readers to complete 11D-ASC analyses in Supplementary Section S3.
- The user further directed the Discussion to focus on the higher-order Positive, Distressing, and Perceptual pattern. The current individual-subscale discussion, especially the subscale-by-subscale cross-study interpretation, is pending exact approval for movement to Supplementary Section S3 or omission where redundant.
- The user selected Supplementary Section S2 for the complete preregistered temporal-tracer methods and results because they add limited explanatory scope. The main text must still identify the measures as preregistered and refer explicitly to that section.
- A read-only audit of authoritative OSF HEAD `1368f4283e9186b551aecad6d626e17df9eeff0b` found that the Bayesian source tables are internally consistent. The manuscript's 11D-ASC Bayesian paragraph mixes omnibus and pooled-VR planned-contrast Bayes factors. Numerical correction is a user or repository-maintainer action under the immutable research-source gate.
- The authoritative tracer-correlation pipeline pools three observations per participant as if they were independent. An isolated read-only reanalysis of the 39 included participants found that the qualitative conclusion of positive correspondence survives between-participant and within-participant dependence-aware analyses, but the committed inferential uncertainty is not dependence-aware. Upstream correction remains a repository-maintainer action.
- The authoritative Bayesian pipeline does not implement the preregistered joint order restriction as one order-constrained Bayes factor. It implements two separate one-sided paired Bayes factors. A maintainer implementation plan is pending execution.
- The user selected a parsimonious main-text Bayesian hierarchy: three order-adjusted 3D-ASCr omnibus Bayes factors, detailed 11D-ASC Bayesian results in Supplementary Section S3, and joint three-condition order-restricted testing in place of stepwise directional tests. The exact ordered-test mapping is pending approval; the current recommendation is one ordered BF for Positive Effects and one for Perceptual Effects, with no directional test for Distressing Effects.
- The user directed the corrected dependence-aware tracer analysis to Supplementary Section S2. No supplementary text or authoritative statistics have been changed while the user reviews the revised proposals.
- The manuscript accurately describes the implemented retrospective tracer rating procedure. The discrepancy between that procedure and the preregistered continuous-rating description remains unresolved; no concealment-oriented edit is authorized.

## Pending editorial decisions

- How to populate the remaining approved technical subsections with exact source-locked 11-ASC, tracer, and expanded blinding tables after cell-by-cell approval.
- For every candidate supplementary item, whether `main.tex` already contains a qualifying explicit referral and, if not, whether to add that referral or omit the item.
- Exact, separately approvable `main.tex` referrals for each retained technical supplement section, without making any main-text change during the supplementary-only implementation.
- Whether and how to relegate temporal experience tracer material from `main.tex` to the supplement.
- Approval of the remaining exact content movements that implement the complete 11D-ASC Supplementary Section S3 and the temporal-tracer Supplementary Section S2. The main-text 3D-ASCr rationale and S3 referral are complete.
- Approval of exact wording that identifies the self-related measures as preregistered without labeling them exploratory.
- Transparent resolution of the discrepancy between the preregistered continuous tracer procedure and the implemented retrospective rating procedure.
- User or maintainer correction of the mixed 11D-ASC Bayesian values in `main.tex` and the inconsistent Changed Meaning of Percepts interpretation in the Discussion.
- User or maintainer implementation of dependence-aware ASC-tracer correlations and one joint order-constrained Bayesian test in the immutable authoritative pipeline.
- Approval of the exact 3D-ASCr Bayesian main-text specification and the exact order-restricted hypothesis mapping.
- Which other robustness, Bayesian, exploratory, blinding, or cross-study material should move to the supplement.
- User-executed deletion of the approved obsolete local Figure 4 files: the byte-identical `Fig06_plv_results.pdf` alias and stale sensitivity-panel SVG.
- Approval of exact removals of all $N=47$ inferential and sensitivity-analysis remnants from the manuscript package, while retaining participant-flow reporting.
- User-executed disposition of corresponding full-sample outputs and pipeline references in the immutable authoritative reproducibility repository.
- Approval of the audited figure disposition: reroute the two temporal-tracer figures to Supplementary Section S4, standardize the remaining eight main-figure filenames to placement order, insert the supplementary figures as Figures S1 and S2, and archive duplicate or legacy variants.

## Figure audit status

- The 2026-08-21 read-only audit found 24 root figure assets representing 10 unique visuals, plus three assets in `supplementary/figures/` representing two of those visuals and one already archived duplicate tracer PDF.
- Every unique visual was rendered and visually inspected. The active PLV screening figure is the approved single-panel violin/cutoff version and does not contain the prohibited sensitivity-analysis panel.
- `main.tex` currently produces ten numbered figures. The root tracer schematic and tracer-profile figures are Figures 5 and 8, while the PLV screening, blinding, and cross-study filenames do not match their actual placement numbers.
- `supplementary/main.tex` is configured for `S`-prefixed figure numbering but currently contains no figure environments. Its existing `FigS01_tracer_schematic.pdf` and `FigS02_tracer_profiles.pdf` copies are therefore staged but unused.
- No figure was moved, renamed, deleted, or modified during the audit. Physical cleanup remains pending explicit approval and the immutable research-source gate.
- The user subsequently approved the full proposed figure disposition. The approvals are recorded, but physical source-derived figure moves and renames remain protected user or maintainer actions under the immutable-artifact rule.
- The staged supplementary tracer PDFs are not yet inserted because their exact figure environments and captions require itemized text approval.

## Current declaration and funding status

- The user confirmed that no author has competing interests. `main.tex` still contains the confirmation placeholder pending approval of the exact replacement sentence.
- BIAL funding metadata has been verified as Grant 308/22, ``Altered states of viscereality: Augmenting breathwork with bio-responsive virtual reality,'' from the 2022 programme, with the public project period October 2023 to April 2026.
- Baden-W\"urttemberg Stiftung support has been verified through the Forschungswerkstatt -- Deine Idee f\"ur Morgen programme for ``Atemr\"aume: Integration atem- und herzratenbasierter Interaktionen in therapeutische VR-Umgebungen,'' with a public 2026--2027 project period.
- Replacing the supplement's `FINAL_SUBMISSION_COMMIT` placeholder remains deliberately deferred as the final task.
- The user rejected supplementary blinding. The active supplement's current blinding section remains present pending exact deletion approval; once removed, reproducibility becomes Section S5.
- The revised tracer plan retains the motivation in the main Introduction, introduces ``psychometric time-series ratings'' as an alternative term, and limits other main tracer content to one exploratory Methods referral to S4.
- The direct OSF reference for recreated stimuli, item keys, and study materials should remain in Methods and also point to the supplementary reproducibility map.
- Approved Revised Items 10A--10F and 11A--11C are implemented. The main Introduction retains the tracer motivation and introduces psychometric time-series ratings; the main Methods contains one exploratory referral to S4; substantive tracer methods, results prose, and both tracer figures have been removed from the main Results and Discussion.
- `supplementary/main.tex` now includes `FigS01_tracer_schematic.pdf` as Figure S1 and `FigS02_tracer_profiles.pdf` as Figure S2. The supplementary blinding section is removed, so reproducibility is now Section S5.
- Supplementary subsection S4.3, ASC--tracer correspondence, remains unpopulated pending the separately controlled Item 8 statistical work and dependence-aware source correction.
- Static LaTeX checks pass for duplicate labels, unresolved local references, missing bibliography keys, missing graphics, and unmatched environments. `git diff --check` passes. No LaTeX compiler is available in the current runtime, so the revised supplement PDF has not been regenerated or visually verified.
- Main figure numbering now contains eight figure environments after tracer relocation, but the four later source-derived filenames remain legacy-numbered pending user or maintainer execution of the approved immutable-artifact rename plan.

## Approved cleanup execution status

- On 2026-08-21, the user explicitly approved the detailed local and OSF cleanup checklist covering removal of the obsolete Figure 4 alias and stale SVG, full-sample sensitivity generators and outputs, validator dependencies, report sections, registries, manifests, dictionaries, checksums, and replay verification.
- The permitted `main.tex` change is complete and hash-verified: it points to the canonical `Fig04_results_plv_exclusion_and_adherence_unified.pdf`, and no `Fig06_plv_results.pdf` reference remains.
- The approved local figure deletions remain user-executed because the immutable research-artifact gate prohibits AI agents from deleting source-derived figures.
- The OSF pipeline and outputs are not present in this workspace, and the authoritative repository remains read-only for AI agents. All approved OSF mutations therefore remain repository-maintainer actions.
- The archived pre-restructure supplement remains preserved under `for-ai/archive/supplementary/` pursuant to the earlier explicit archive instruction. The cleanup checklist did not select the alternative of deleting or redacting that historical archive.

The user's instruction authorizes the substance of the selected hierarchy and correction work, but no project-text edit may be applied until its exact current and proposed wording receives item-by-item approval. Numerical-statistic and authoritative-pipeline changes remain user or maintainer actions regardless of approval.

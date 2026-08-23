# Current project state

Last updated: 2026-08-22

## GitHub checkpoint policy

- Before every separately approved project-text item is implemented, the complete pre-item repository state must be committed and successfully pushed to the configured GitHub remote.
- If several items are approved together, implementation must proceed serially with a new pushed checkpoint before each item.
- A failed commit or push blocks implementation of that item; unrelated user changes must remain preserved and visible in the checkpoint history.
- The active manuscript branch observed when this rule was recorded was `main`, with GitHub remote `origin` pointing to `https://github.com/GeorgeFejer91/0.viscereality-bioresponsive-vr-box-breathing-altered-state-experience.git`.

## Current ASC Discussion revision

- The approved opening of the altered-states Discussion now interprets the three 3D-ASCr dimensions through the fine-grained subscale decomposition and administered item content rather than relisting subscale results.
- It characterizes Perceptual Effects as elementary visual and cross-modal attribution phenomena with intervention-to-measure overlap, Positive Effects as unity, altered salience, diminished bodily presence, and awe rather than generalized bliss, and Distressing Effects as a diffuse accumulation of modest destabilizing experiences.
- The paragraph explicitly refers readers to Supplementary Section S3.4 and cites Terhune et al. for the distinction between LSD-induced synaesthesia-like reports and genuine synaesthesia. The approved bibliography entry is now implemented and resolves in the compiled article.

The durable next-session handoff is `for-ai/HANDOFF_NEXT_SESSION.md`. Read it after the mandatory bootstrap files and verify it against the current working tree before continuing.

## Git state at control-plane creation

- `main.tex` matches the committed repository version.
- `supplementary.tex` exists as an untracked, reconstructed supplementary draft.
- `AGENTS.md` and `for-ai/` are newly created internal control-plane files.

Agents must run `git status --short` at the start of any editing task because this snapshot will become stale.

## Known manuscript status

- As of 2026-08-23, the user requires exact filename identity between active manuscript/supplement `\includegraphics` assets and their canonical reproducibility-pipeline exports. The current active manuscript filenames control synchronization until a deliberate cross-repository rename changes both sides together.

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
- On 2026-08-22, the user approved a more grounded revision of that rationale. `main.tex` now describes the 3D-ASCr as a psychometrically supported post-registration higher-order summary whose level of detail corresponds to the paper's hypotheses, without claiming independent validation or greater reliability in bioresponsive VR and without claiming that its adoption introduced no analytic degrees of freedom.
- The user further directed the Discussion to focus on the higher-order Positive, Distressing, and Perceptual pattern. The current individual-subscale discussion, especially the subscale-by-subscale cross-study interpretation, is pending exact approval for movement to Supplementary Section S3 or omission where redundant.
- The user selected Supplementary Section S2 for the complete preregistered temporal-tracer methods and results because they add limited explanatory scope. The main text must still identify the measures as preregistered and refer explicitly to that section.
- A read-only audit of authoritative OSF HEAD `1368f4283e9186b551aecad6d626e17df9eeff0b` found that the Bayesian source tables are internally consistent. The manuscript's 11D-ASC Bayesian paragraph mixes omnibus and pooled-VR planned-contrast Bayes factors. Numerical correction is a user or repository-maintainer action under the immutable research-source gate.
- The authoritative tracer-correlation pipeline pools three observations per participant as if they were independent. An isolated read-only reanalysis of the 39 included participants found that the qualitative conclusion of positive correspondence survives between-participant and within-participant dependence-aware analyses, but the committed inferential uncertainty is not dependence-aware. Upstream correction remains a repository-maintainer action.
- The authoritative Bayesian pipeline does not implement the preregistered joint order restriction as one order-constrained Bayes factor. It implements two separate one-sided paired Bayes factors. A maintainer implementation plan is pending execution.
- The user selected a parsimonious main-text Bayesian hierarchy comprising three order-adjusted 3D-ASCr omnibus Bayes factors and the two planned contrasts, with detailed 11D-ASC Bayesian results in Supplementary Section S3. The user subsequently decided not to add post-registration ordered-model Bayes factors for any 3D-ASCr composite because the symmetric-versus-asymmetric differences are negligible to small and the substantive signal is VR versus control. The registered joint-order mismatch for Experience of Unity, Blissful State, and Audio-Visual Synesthesia remains separate and unresolved.
- The user directed the corrected dependence-aware tracer analysis to Supplementary Section S2. No supplementary text or authoritative statistics have been changed while the user reviews the revised proposals.
- The manuscript accurately describes the implemented retrospective tracer rating procedure. By user direction, the preregistration's continuous-rating description is closed and requires no deviation disclosure or further escalation unless the user explicitly reopens it.

## Pending editorial decisions

- How to populate the remaining approved technical subsections with exact source-locked 11-ASC, tracer, and expanded blinding tables after cell-by-cell approval.
- For every candidate supplementary item, whether `main.tex` already contains a qualifying explicit referral and, if not, whether to add that referral or omit the item.
- Exact, separately approvable `main.tex` referrals for each retained technical supplement section, without making any main-text change during the supplementary-only implementation.
- Whether and how to relegate temporal experience tracer material from `main.tex` to the supplement.
- The registered joint order-constrained Bayes factors for Experience of Unity, Blissful State, and Audio-Visual Synesthesia remain unimplemented. The main Methods and S3 now disclose the stepwise substitute and explain its conclusion. Exact distribution-free statistics remain in the reproducibility package under the approved parsimonious reporting policy.
- Maintainer-side replacement of the mixed-effects likelihood-ratio omnibus outputs with the registered order-adjusted repeated-measures ANCOVA. A read-only comparison found identical nominal and FDR decisions across every 11D-ASC, 3D-ASCr, self-related, tracer-peak, tracer-AUC, and PLV outcome. The user approved the proposed main-article Methods and Results and Supplementary Sections S1 and S3 replacements on 2026-08-22, but the immutable canonical pipeline and outputs have not yet been regenerated.
- The user approved preregistration-audit Master Items 1--9. Items 1--4 remain staged behind the maintainer-side RM-ANCOVA regeneration. The exact 11D-ASC main-results removal in Item 9 is implemented. The user pinned Discussion Item 10. Tracer Item 14 is closed by user direction without a submission-facing disclosure; Item 15, dependence-aware ASC--tracer analysis, remains pending.
- The user directed the paper not to foreground the registry's inaccurate completely-black control description and not to add a separate deviation disclosure for the exploratory confidence-weighted blinding index or added blinding checks. The implemented control remains reported accurately, and the modified blinding index remains labeled exploratory rather than as a standard Bang index.
- Approval of exact wording that identifies the self-related measures as preregistered without labeling them exploratory.
- User or maintainer correction of the mixed 11D-ASC Bayesian values in `main.tex` and the inconsistent Changed Meaning of Percepts interpretation in the Discussion.
- User or maintainer implementation of dependence-aware ASC-tracer correlations. Maintainer implementation of the original joint order-constrained Bayesian tests remains optional if the current explicit stepwise-deviation disclosure is retained.
- Approval of the exact 3D-ASCr Bayesian main-text specification and the exact order-restricted hypothesis mapping.
- Which other robustness, Bayesian, exploratory, blinding, or cross-study material should move to the supplement.
- User-executed deletion of the approved obsolete local Figure 4 files: the byte-identical `Fig06_plv_results.pdf` alias and stale sensitivity-panel SVG.
- Approval of exact removals of all $N=47$ inferential and sensitivity-analysis remnants from the manuscript package, while retaining participant-flow reporting.
- User-executed disposition of corresponding full-sample outputs and pipeline references in the immutable authoritative reproducibility repository.
- Approval of the audited figure disposition: reroute the two temporal-tracer figures to Supplementary Section S4, standardize the remaining eight main-figure filenames to placement order, insert the supplementary figures as Figures S1 and S2, and archive duplicate or legacy variants.

## Submission-formatting to-do list

The consolidated checkable tracker is `for-ai/FINAL_SUBMISSION_CHECKLIST.md`. Keep its completed and pending states synchronized with this project-state record after each finalization step.

### Work now inside this repository

- Audit the main manuscript and active supplement against the live *Virtual Reality* formatting and supplementary-information requirements.
- Prepare exact, separately approvable wording proposals for every required submission-facing change, including `Online Resource 1` referrals, its concise caption, availability statements, and formal repository citations. Do not insert these changes before approval.
- Define and, after approval, use uniquely searchable placeholder tokens for `OSF_PROJECT_DOI`, `ZENODO_VERSION_DOI`, `GITHUB_FINAL_COMMIT`, and `GITHUB_RELEASE_TAG` wherever final external identifiers are not yet available.
- Complete local file organization and Springer upload naming, including the final supplementary upload name `ESM_1.pdf`, while retaining stable editable LaTeX entry points.
- Build both PDFs, resolve technical formatting defects, and visually inspect title pages, line numbering, citations, figures, tables, declarations, supplement front matter, hyperlinks, and references.
- Generate a dry-run submission manifest and source archive that exclude `AGENTS.md`, `for-ai/`, Git metadata, build caches, temporary files, and internal archives.
- Run a placeholder scan and produce a local readiness report that clearly separates completed formatting from deliberately deferred external identifiers and reproducibility validation.
- Add a canonical build orchestrator under `for-ai/scripts/` that compiles through internal scratch directories and emits only `output/submission/Manuscript.pdf` and `output/submission/ESM_1.pdf` after successful validation.
- Revise the packaging orchestrator so its canonical upload-facing result is `output/submission/Manuscript_Source.zip` and its manifest excludes legacy PDFs plus all internal or review-only material.
- Implemented on 2026-08-23: `for-ai/scripts/build-submission-pdfs.ps1` now compiles both documents through `for-ai/build/submission-pdfs/` and stages the canonical PDFs under `output/submission/`; `new-submission-package.ps1` packages the 16 active local source dependencies into `Manuscript_Source.zip`. Review mode warns about the deliberately unresolved final-commit placeholder, while `-Final` blocks release until it is replaced.

### Final-stage maintainer tasks, deliberately deferred

- Run the final end-to-end audit of the complete reproducibility package after manuscript and supplement formatting are frozen.
- Resolve any maintainer-only reproducibility issues without allowing AI agents to mutate the immutable authoritative data, figures, statistics, outputs, or pipelines.
- Publish or finalize the study package on OSF, create the immutable Zenodo archival release, and tag or pin the final authoritative GitHub reproducibility commit.
- Synchronize titles, creators, ORCIDs, versions, licences, related identifiers, checksums, and reciprocal links across OSF, Zenodo, GitHub, the manuscript, and the supplement.
- Replace every approved placeholder with the resulting DOI, release tag, or full commit hash; formally cite the finalized records; and verify all public links while logged out.
- Rebuild the final PDFs and source archive, rerun the placeholder scan, and block submission if any unresolved placeholder or repository-version mismatch remains.

## Figure audit status

- The 2026-08-21 read-only audit found 24 root figure assets representing 10 unique visuals, plus three assets in `supplementary/figures/` representing two of those visuals and one already archived duplicate tracer PDF.
- Every unique visual was rendered and visually inspected. The active PLV screening figure is the approved single-panel violin/cutoff version and does not contain the prohibited sensitivity-analysis panel.
- `main.tex` currently produces ten numbered figures. The root tracer schematic and tracer-profile figures are Figures 5 and 8, while the PLV screening, blinding, and cross-study filenames do not match their actual placement numbers.
- `supplementary/main.tex` is configured for `S`-prefixed figure numbering but currently contains no figure environments. Its existing `FigS01_tracer_schematic.pdf` and `FigS02_tracer_profiles.pdf` copies are therefore staged but unused.
- No figure was moved, renamed, deleted, or modified during the audit. Physical cleanup remains pending explicit approval and the immutable research-source gate.
- The user subsequently approved the full proposed figure disposition. The approvals are recorded, but physical source-derived figure moves and renames remain protected user or maintainer actions under the immutable-artifact rule.
- The staged supplementary tracer PDFs are not yet inserted because their exact figure environments and captions require itemized text approval.

## Current declaration and funding status

- The user confirmed that no author has competing interests and approved the exact declaration. `main.tex` now states that the authors declare no competing interests.
- BIAL funding metadata has been verified as Grant 308/22, ``Altered states of viscereality: Augmenting breathwork with bio-responsive virtual reality,'' from the 2022 programme, with the public project period October 2023 to April 2026.
- Baden-W\"urttemberg Stiftung support has been verified through the Forschungswerkstatt -- Deine Idee f\"ur Morgen programme for ``Atemr\"aume: Integration atem- und herzratenbasierter Interaktionen in therapeutische VR-Umgebungen,'' with a public 2026--2027 project period.
- The user approved and `main.tex` now applies funding wording that identifies BIAL Grant 308/22 as funding the reported study and the Baden-W\"urttemberg Stiftung award as support for continued Viscereality development.
- The user finalized the CRediT role allocation: George Fejer holds Conceptualization, Data curation, Formal analysis, Funding acquisition, Investigation, Methodology, Project administration, Software, Validation, Visualization, Writing -- original draft, and Writing -- review and editing; Till Holzapfel holds Conceptualization, Methodology, Resources, Software, Validation, and Visualization; Taru Hirvonen holds Methodology, Resources, Software, and Visualization; Johannes Blum holds Methodology, Resources, Software, and Validation; Anestis Lalidis Mateo holds Methodology, Resources, and Software; Michael Gaebler holds Conceptualization, Project administration, Supervision, and Writing -- review and editing; Bigna Lenggenhager holds Conceptualization, Funding acquisition, Supervision, and Writing -- review and editing. Investigation is assigned only to George Fejer because he collected all data.
- The approved assembled `Authors' contributions` statement is inserted in `main.tex` using the finalized CRediT allocation and manuscript order.
- The formal author order now places Anestis Lalidis Mateo before Johannes Blum: George Fejer, Till Holzapfel, Taru Hirvonen, Anestis Lalidis Mateo, Johannes Blum, Michael Gaebler, and Bigna Lenggenhager. Affiliation identifiers remain author-specific.
- The approved minimal ethics declaration now identifies approval by the Ethics Committee of the University of Konstanz and conduct in accordance with the Declaration of Helsinki.
- All authors will receive the final manuscript draft for final approval of authorship order, contributions, declarations, and content before submission.
- Replacing the supplement's `FINAL_SUBMISSION_COMMIT` placeholder remains deliberately deferred as the final task.
- The user rejected supplementary blinding. The active supplement's current blinding section remains present pending exact deletion approval; once removed, reproducibility becomes Section S5.
- The revised tracer plan retains the motivation in the main Introduction, introduces ``psychometric time-series ratings'' as an alternative term, and limits other main tracer content to one exploratory Methods referral to S4.
- The direct OSF reference for recreated stimuli, item keys, and study materials should remain in Methods and also point to the supplementary reproducibility map.
- Approved Revised Items 10A--10F and 11A--11C are implemented. The main Introduction retains the tracer motivation and introduces psychometric time-series ratings; the main Methods contains one exploratory referral to S4; substantive tracer methods, results prose, and both tracer figures have been removed from the main Results and Discussion.
- `supplementary/main.tex` now includes `FigS01_tracer_schematic.pdf` as Figure S1 and `FigS02_tracer_profiles.pdf` as Figure S2. The supplementary blinding section is removed, so reproducibility is now Section S5.
- Supplementary subsection S4.3, ASC--tracer correspondence, remains unpopulated pending the separately controlled Item 8 statistical work and dependence-aware source correction.
- The user has now made the 3D-ASCr versus 11D-ASC placement decision final: detailed altered-state reporting in `main.tex` is limited to the three 3D-ASCr composites, while substantive 11D-ASC Results and lower-order Discussion interpretation move to Supplementary Section S3 after item-by-item approval.
- Supplementary Section S3 contains the approved detailed prose for all 11 fine-grained dimensions. Each block reports all three condition descriptives, the order-adjusted omnibus condition test, Bayesian evidence, both planned contrasts, convergent or divergent sensitivity evidence, applicable directional tests, exploratory order diagnostics, and a direct substantive conclusion. Tables S2--S4 rank each composite's constituent dimensions by paired Cohen's $d_z$ and report the pooled-VR-minus-control mean difference with its 95\% confidence interval, paired Cohen's $d_z$, $p$, and global 11-dimension Benjamini--Hochberg $q_{\mathrm{FDR}}$.
- Supplementary Section S3.4 now provides three approved prose paragraphs summarizing the fine-grained contributors to Positive, Distressing, and Perceptual Effects, including paraphrased examples of the phenomena assessed by the relevant items and the perceptual-content-overlap caveat.
- The durable ASC preregistration checkbox audit in `for-ai/preregistration/PREREGISTRATION_AND_DEVIATIONS.md` records which promises are fulfilled, which deviations are formally addressed, and which gaps remain. The main Methods and S3 now disclose that the available directional analyses are stepwise substitutes, report all six exact pairwise Bayes factors, and explain that the full ordering was unsupported. The original joint order-constrained Bayes factors remain unimplemented. Exact distribution-free statistics remain in the reproducibility package under the approved parsimonious reporting policy.
- The approved detailed 11D-ASC Results block has now been removed from `main.tex`; Supplementary Section S3 is the sole detailed 11D-ASC Results destination. The fine-grained Discussion material remains deliberately deferred.
- The older main-text Bayesian paragraph mixes omnibus and planned-contrast Bayes factors. The lower-order Discussion also incorrectly states that Changed Meaning of Percepts was largely unaffected by VR. Neither passage may be copied unchanged into the supplement.
- The implemented S3 hierarchy is one concise section-level orientation paragraph followed directly by Positive Effects, Distressing Effects, and Perceptual Effects subsections. Each subsection begins with its approved driver table and contains populated bold run-in blocks for constituent 11D-ASC dimensions, ordered from larger to smaller pooled-VR paired standardized effect size.
- The user has explicitly deferred all altered-states Discussion restructuring until the S3 hierarchy and its correspondence with the main Methods and Results are settled.
- The selected exact S3 section title is ``11D-ASC: Altered States of Consciousness Rating Scale,'' subject to submission-facing item approval. This follows the Studerus instrument naming and makes the destination of the relocated 11-dimensional analysis explicit.
- Static LaTeX checks pass for duplicate labels, unresolved local references, missing bibliography keys, missing graphics, and unmatched environments. MiKTeX compilation also passes. The current eleven-page `output/pdf/supplementary-materials.pdf` includes the complete approved 11D-ASC blocks and three-paragraph S3.4 synthesis and was visually verified on 2026-08-22.
- Main figure numbering now contains eight figure environments after tracer relocation, but the four later source-derived filenames remain legacy-numbered pending user or maintainer execution of the approved immutable-artifact rename plan.

## Approved cleanup execution status

- On 2026-08-21, the user explicitly approved the detailed local and OSF cleanup checklist covering removal of the obsolete Figure 4 alias and stale SVG, full-sample sensitivity generators and outputs, validator dependencies, report sections, registries, manifests, dictionaries, checksums, and replay verification.
- The permitted `main.tex` change is complete and hash-verified: it points to the canonical `Fig04_results_plv_exclusion_and_adherence_unified.pdf`, and no `Fig06_plv_results.pdf` reference remains.
- The approved local figure deletions remain user-executed because the immutable research-artifact gate prohibits AI agents from deleting source-derived figures.
- The OSF pipeline and outputs are not present in this workspace, and the authoritative repository remains read-only for AI agents. All approved OSF mutations therefore remain repository-maintainer actions.
- The archived pre-restructure supplement remains preserved under `for-ai/archive/supplementary/` pursuant to the earlier explicit archive instruction. The cleanup checklist did not select the alternative of deleting or redacting that historical archive.

The user's instruction authorizes the substance of the selected hierarchy and correction work, but no project-text edit may be applied until its exact current and proposed wording receives item-by-item approval. Numerical-statistic and authoritative-pipeline changes remain user or maintainer actions regardless of approval.

## Preregistration preservation and deviation status

- The exact two-page AsPredicted #262545 PDF is preserved at `for-ai/preregistration/Study3_AsPredicted_Preregistration_262545.pdf` with SHA-256 `B8DA2B50E976E14C3A552D32194B659ECB66CC62A23284DD3610FF7729FB913D`.
- `for-ai/preregistration/PREREGISTRATION_AND_DEVIATIONS.md` is the durable crosswalk of the original commitments, explicitly justified departures, reported but incompletely rationalized changes, and unresolved mismatches.
- The registration is partially prospective: it states that 19 participants had already been collected for technical-pilot purposes and had not been inspected beyond confirmation of successful data logging.
- Explicitly rationalized departures include PLV and IQR-based quality screening in place of phase-duration error and cycle rules; mixed-effects likelihood-ratio tests in place of the preregistered repeated-measures ANOVA with order; paired t-test implementation of the planned contrasts; added nonparametric and FDR procedures; and the post-preregistration 3D-ASCr reporting hierarchy.
- Unresolved preregistration matters include exploratory relabeling and dependence-aware implementation of ASC-tracer correspondence; two stepwise one-sided Bayesian tests instead of the preregistered joint three-condition order test; the completely-black-control registry description versus the implemented fixation and performance-feedback display; and the modified confidence-weighted blinding index. The user closed the continuous-versus-retrospective tracer-description issue without a submission-facing disclosure and resolved the JASP-to-R/BayesFactor software substitution as non-substantive when the same statistical analysis is reproduced; software and prior details remain required for reproducibility.
- Future agents must consult and update the crosswalk whenever work affects preregistration-related claims. No submission-facing wording was changed during creation of this internal knowledge base.

## 2026-08-23 - Current Supplementary Section S4 status

- The portrait Supplementary Figure S2 is embedded at the full available text width on a dedicated page. Its page uses the supplement's normal 39.4 mm horizontal margins and locally reduced 10 mm top and 12 mm bottom margins so that the figure, full caption, and page footer remain together. The current compiled supplement is 11 pages; Figure S2 occupies page 10 and was visually verified as legible and unclipped.

- The user approved tracer Items 1--5. `supplementary/main.tex` now contains the source-grounded Meta Quest 3 implementation description, explicit peak and trapezoidal-AUC reduction rules, exact $N=39$ condition statistics, descriptive pooled ASC--tracer correspondence with its dependence caveat, and the approved balanced lower-burden interpretation.
- Supplementary Figure S1 remains the canonical tracer peak/AUC schematic. Supplementary Figure S2 now uses the approved portrait asset `supplementary/figures/FigS02_tracer_profiles_vertical.pdf`; its SHA-256 is `B10213192A15E2784F4CA9AADF48843A493572E862105C88C935122EDCFBF47C`, identical to the canonical reproducibility-package variant.
- The old pooled-correlation scatterplots, pooled peak--AUC plot, and heatmaps are not selected for the active supplement because they are redundant or treat repeated participant-condition observations as independent.
- Approved Item 4, the descriptive 11-panel recalled-time-course subsection and Figure S3, remains unapplied because the required canonical asset is deleted from the immutable source worktree. It remains available at authoritative commit `1368f4283e9186b551aecad6d626e17df9eeff0b` as `4.Figures/Supplementary/3.AppendixTracerTimecourses/avg_tracer_timecourse_master_grid.pdf` (Git blob `bfc7a350a6d089d4b85f619c2285924e13f0b6dc`). A repository maintainer must restore or supply that exact PDF before insertion as `supplementary/figures/FigS03_tracer_timecourses.pdf`.
- The current 12-page `output/pdf/supplementary-materials.pdf` was compiled with two final pdfLaTeX passes. Its log contains no undefined citations or references, overfull boxes, or oversized floats. S4 pages were rendered with Poppler and visually inspected; the vertical Figure S2, caption, page footer, section transitions, and references are legible and unclipped.

## 2026-08-23 - Final temporal-tracer layout and reporting state

- The main Methods now gives the concise Meta Quest tracer implementation and includes the hypothetical peak-versus-AUC schematic as a right-hand half-width wrapped figure. A deliberate page break starts the block at the top of page 20 so surrounding Methods text wraps cleanly without displacing later content.
- Supplementary Figure S1 uses the same right-hand half-width presentation and titled hypothetical caption, preserving the supplement as a standalone account. Section S4 reports source-verified peak and AUC contrasts in Table S5 and closes with a cautious descriptive correspondence and validation interpretation.
- Supplementary Section S4.3 now precedes Table S5 in source order. This fills page 9 with continuous explanatory text, places the complete table on page 10, and keeps the enlarged portrait Figure S2 and its caption together on page 11.
- The final 53-page main article and 12-page supplement compile without undefined references or citations, overfull boxes, oversized floats, or wrap-figure collision warnings. The affected pages were rendered and visually verified.
- Figure S3 remains the sole unavailable immutable-source dependency. It may be inserted only after a maintainer restores or supplies the exact canonical PDF already identified in the status above.

## 2026-08-23 - Submission review line numbering

- The user directed that Springer Nature's built-in `lineno` class option be enabled in both `main.tex` and `supplementary/main.tex`.
- The approved `main.tex` class-option change is implemented and compiles successfully with `vruler.sty`; representative first, figure, and final pages were visually checked and the margin ruler is legible and unclipped.
- The corresponding `supplementary/main.tex` line-number option is implemented. Both documents now use `sn-basic` author--year references, the supplement contains the required identifying front matter, and the main declarations heading is ``Statements and Declarations.''
- The updated main article compiles to 54 A4 pages and the supplement to 11 A4 pages. Their final logs contain no undefined citations or references, overfull boxes, or unresolved LaTeX warnings. Representative title, citation, figure/table, declaration, supplement-front-matter, and final-reference pages were rendered and visually verified with unclipped line numbering.

## 2026-08-23 - Pictographic-measure audit and ASC correspondence status

- Read-only inspection confirms that the released PBBS runtime asset progresses from diffuse A to sharply bounded G. With A--G mapped to 1--7, higher stored values indicate stronger boundary salience; the prose item key describes the visual direction in reverse. Canonical source correction remains a maintainer action.
- A complete temporary exploratory screen now covers pictograph associations with all 3D-ASCr composites, all 11 ASC subscales, and all 42 items, with family-wise Benjamini--Hochberg correction, pooled-VR-minus-control change correlations, clustered within-person sensitivity, formal condition interactions, and symmetric-minus-asymmetric change correlations.
- The approved reporting hierarchy has been implemented: Supplementary Section S4 contains the complete multiplicity-corrected exploratory analysis, while the main article retains a concise construct-linked synthesis focused on Unity, Disembodiment, Spiritual Experience, and Blissful State.
- The Methods now identifies all pictographs as SVG recreations of published or earlier versions and explains direct control over opacity, line width, dash pattern, figure size, and spatial extent without claiming validated measurement equivalence.
- The Small Self wording now identifies the Vidal publication as the source and the item as ad hoc, without implying that the present team is validating it or that external validation activity is ongoing.
- The PBBS direction has been verified against the released administered asset. The Methods reports A-to-G coding as increasing boundary salience, and construct-facing correspondence analyses reverse the score so that higher values indicate greater boundary dissolution.

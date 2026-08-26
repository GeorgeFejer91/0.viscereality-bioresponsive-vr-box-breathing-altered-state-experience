# Current project state

Last updated: 2026-08-26

## 2026-08-24 reproducibility release

- The public reproducibility repository is
  `https://github.com/GeorgeFejer91/Viscereality-Bioresponsive-Virtual-Reality-for-Box-Breathing-and-Altered-State-Experience`.
  Release `v1.0.0` resolves to commit
  `1de1acc03e325e66aad8751c5e4a0efa86e149f7`.
- The immutable Zenodo version 1.0.0 record is
  `https://zenodo.org/records/22073981`, with version DOI
  `10.5281/zenodo.22073981`.
- The published Zenodo ZIP contains 2,059 entries; all 2,057 manifested files
  passed SHA-256 verification. The archive SHA-256 is
  `0fe7094d3224736fe8ac7513c642e685812e1e329b6342fac112cff9562a609f`.
- The supplementary reproducibility section now presents four complementary
  records: the OSF project, Zenodo archival release, GitHub version 1.0.0
  release, and version-controlled GitHub repository with its exact release
  commit.

## Current publication-readiness status (2026-08-24)

- Completed: active manuscript and supplement sources contain no release or
  registered-statistics placeholder tokens; declarations are populated; Online
  Resource 1 has a caption and explicit section referrals; and the final-mode
  PDF build succeeds at manuscript commit `9bbf683` (52 manuscript pages,
  17 Online Resource pages).
- Completed: Zenodo, OSF, GitHub release, GitHub repository, DOI, release tag,
  and reciprocal supplement links are recorded. Do not reopen these items from
  older notes below.
- Open: `output/submission/Manuscript_Source.zip` is stale. It contains 16
  entries instead of the current 17-file source manifest, eight files differ
  from the working tree, and it still contains `FINAL_SUBMISSION_COMMIT`.
  Regenerate, extract, and compile this archive before submission.

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
- As of 2026-08-24, the main article cites ten figures in physical order: `Fig01_study_procedure.pdf` through `Fig06_plv_results.pdf`, `Fig07_results_subjective_self_pictogram_violin_grid.pdf`, `Fig08_3d_ascr_results.pdf`, `Fig09_results_blinding_condensed_summary.pdf`, and `Fig10_cross_study_profiles.pdf`. The supplement cites `FigS01_tracer_schematic.pdf` and `FigS02_tracer_profiles_vertical.pdf`. All 12 cited assets are SHA-256 identical to the canonical reproducibility-package copies.
- The current final-mode build contains a 52-page manuscript and 17-page Online Resource. The source archive, not the external identifiers or active-source placeholders, is the current packaging blocker.

- The manuscript is formatted for Springer Nature.
- A LaTeX compiler was not available on the command path during the preceding checks.
- Citation keys used by the inspected manuscript and supplementary draft resolved against `references.bib` during the preceding static check.
- The manuscript declarations are populated in the current source; older placeholder notes are superseded.
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
- The current active supplement contains populated 11D-ASC, pictograph--ASC, tracer, blinding, and reproducibility sections; older notes describing empty sections are superseded.
- The supplement now identifies the cleaned public reproducibility repository,
  release `v1.0.0`, and exact commit
  `1de1acc03e325e66aad8751c5e4a0efa86e149f7`.
- The current `main.tex` contains explicit `Online Resource 1, Section~S#`
  referrals and a concise Online Resource 1 caption; older notes describing
  missing referrals are superseded.
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
- The registered joint order-constrained Bayes factors for Experience of Unity, Blissful State, and Audio-Visual Synesthesia remain unimplemented. The temporary main-text stepwise-deviation disclosure was removed by user direction; current S3 stepwise values are placeholders pending authoritative joint-order results. Exact distribution-free statistics remain in the reproducibility package under the approved parsimonious reporting policy.
- Maintainer-side replacement of the mixed-effects likelihood-ratio omnibus outputs with the registered order-adjusted repeated-measures ANCOVA. A read-only comparison found identical nominal and FDR decisions across every 11D-ASC, 3D-ASCr, self-related, tracer-peak, tracer-AUC, and PLV outcome. The user approved the proposed main-article Methods and Results and Supplementary Sections S1 and S3 replacements on 2026-08-22, but the immutable canonical pipeline and outputs have not yet been regenerated.
- The user approved preregistration-audit Master Items 1--9. Items 1--4 remain staged behind the maintainer-side RM-ANCOVA regeneration. The exact 11D-ASC main-results removal in Item 9 is implemented. The user pinned Discussion Item 10. Tracer Item 14 is closed by user direction without a submission-facing disclosure; Item 15, dependence-aware ASC--tracer analysis, remains pending.
- The user directed the paper not to foreground the registry's inaccurate completely-black control description and not to add a separate deviation disclosure for the exploratory confidence-weighted blinding index or added blinding checks. The implemented control remains reported accurately, and the modified blinding index remains labeled exploratory rather than as a standard Bang index.
- Approval of exact wording that identifies the self-related measures as preregistered without labeling them exploratory.
- User or maintainer correction of the mixed 11D-ASC Bayesian values in `main.tex` and the inconsistent Changed Meaning of Percepts interpretation in the Discussion.
- User or maintainer implementation of dependence-aware ASC-tracer correlations. Maintainer implementation of the original joint order-constrained Bayesian tests is required; retaining the avoidable stepwise substitute is not the selected resolution.
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
- Implemented: `for-ai/scripts/build-submission-pdfs.ps1` compiles both
  documents through `for-ai/build/submission-pdfs/` and stages the canonical
  PDFs. The existing `Manuscript_Source.zip` still needs regeneration because
  it predates the final source edits.

### Final-stage maintainer tasks, deliberately deferred

- Run the final end-to-end audit of the complete reproducibility package after manuscript and supplement formatting are frozen.
- Resolve any maintainer-only reproducibility issues without allowing AI agents to mutate the immutable authoritative data, figures, statistics, outputs, or pipelines.
- Regenerate and independently compile the final source archive; complete the
  remaining journal-portal and scientific/editorial checklist items.
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
- George Fejer's affiliations are, in order, the Max Planck Institute for Human Development in Berlin, the Max Planck Institute for Human Cognitive and Brain Sciences in Leipzig, the University of Konstanz, and the ALIUS Research Network. Michael Gaebler is affiliated with both Max Planck institutes. The main manuscript and Online Resource corresponding-author block reflect the approved metadata.
- The approved minimal ethics declaration now identifies approval by the Ethics Committee of the University of Konstanz and conduct in accordance with the Declaration of Helsinki.
- All authors will receive the final manuscript draft for final approval of authorship order, contributions, declarations, and content before submission.
- The supplement's former `FINAL_SUBMISSION_COMMIT` placeholder has been
  replaced by the exact public release commit.
- The user rejected supplementary blinding. The active supplement's current blinding section remains present pending exact deletion approval; once removed, reproducibility becomes Section S5.
- The revised tracer plan retains the motivation in the main Introduction, introduces ``psychometric time-series ratings'' as an alternative term, and limits other main tracer content to one exploratory Methods referral to S4.
- The direct OSF reference for recreated stimuli, item keys, and study materials should remain in Methods and also point to the supplementary reproducibility map.
- Approved Revised Items 10A--10F and 11A--11C are implemented. The main Introduction retains the tracer motivation and introduces psychometric time-series ratings; the main Methods contains one exploratory referral to S4; substantive tracer methods, results prose, and both tracer figures have been removed from the main Results and Discussion.
- `supplementary/main.tex` now includes `FigS01_tracer_schematic.pdf` as Figure S1 and `FigS02_tracer_profiles.pdf` as Figure S2. The supplementary blinding section is removed, so reproducibility is now Section S5.
- Supplementary subsection S4.3, ASC--tracer correspondence, remains unpopulated pending the separately controlled Item 8 statistical work and dependence-aware source correction.
- The user has now made the 3D-ASCr versus 11D-ASC placement decision final: detailed altered-state reporting in `main.tex` is limited to the three 3D-ASCr composites, while substantive 11D-ASC Results and lower-order Discussion interpretation move to Supplementary Section S3 after item-by-item approval.
- Supplementary Section S3 contains the approved detailed prose for all 11 fine-grained dimensions. Each block reports all three condition descriptives, the order-adjusted omnibus condition test, Bayesian evidence, both planned contrasts, convergent or divergent sensitivity evidence, applicable directional tests, exploratory order diagnostics, and a direct substantive conclusion. Tables S2--S4 rank each composite's constituent dimensions by paired Cohen's $d_z$ and report the pooled-VR-minus-control mean difference with its 95\% confidence interval, paired Cohen's $d_z$, $p$, and global 11-dimension Benjamini--Hochberg $q_{\mathrm{FDR}}$.
- Supplementary Section S3.4 now provides three approved prose paragraphs summarizing the fine-grained contributors to Positive, Distressing, and Perceptual Effects, including paraphrased examples of the phenomena assessed by the relevant items and the perceptual-content-overlap caveat.
- The durable ASC preregistration checkbox audit in `for-ai/preregistration/PREREGISTRATION_AND_DEVIATIONS.md` records which promises are fulfilled, which deviations are formally addressed, and which gaps remain. The original joint order-constrained Bayes factors remain unimplemented; current S3 stepwise values must be replaced rather than reframed as the registered test. Exact distribution-free statistics remain in the reproducibility package under the approved parsimonious reporting policy.
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
- The OSF pipeline and outputs are present in the sibling `0_OSF_reproducability_package` repository and remain read-only for this task. All OSF mutations remain repository-maintainer actions.
- The archived pre-restructure supplement remains preserved under `for-ai/archive/supplementary/` pursuant to the earlier explicit archive instruction. The cleanup checklist did not select the alternative of deleting or redacting that historical archive.

The user's instruction authorizes the substance of the selected hierarchy and correction work, but no project-text edit may be applied until its exact current and proposed wording receives item-by-item approval. Numerical-statistic and authoritative-pipeline changes remain user or maintainer actions regardless of approval.

## Preregistration preservation and deviation status

- The exact two-page AsPredicted #262545 PDF is preserved at `for-ai/preregistration/Study3_AsPredicted_Preregistration_262545.pdf` with SHA-256 `B8DA2B50E976E14C3A552D32194B659ECB66CC62A23284DD3610FF7729FB913D`.
- `for-ai/preregistration/PREREGISTRATION_AND_DEVIATIONS.md` is the durable crosswalk of the original commitments, explicitly justified departures, reported but incompletely rationalized changes, and unresolved mismatches.
- Explicitly rationalized departures include PLV and IQR-based quality screening in place of phase-duration error and cycle rules; paired t-test implementation of the planned contrasts; added nonparametric and FDR procedures; and the post-preregistration 3D-ASCr reporting hierarchy. The mixed-effects omnibus is now a restoration-pending inconsistency rather than the selected final analysis.
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

## 2026-08-23 - Full-paper audit implementation and registered-pipeline restoration

- Detailed 11D-ASC statistics have been removed from the main Results and replaced by a direct Supplementary S3 referral. This eliminates the main paragraph that mixed omnibus and planned-contrast Bayes factors.
- Exploratory pictograph--ASC coefficients have been removed from the main Results; S4 remains the complete numerical destination.
- The descriptive cross-study ASC figure and detailed comparison have moved from the main Discussion to Supplementary S3. The incorrect claim that Changed Meaning of Percepts was unaffected has been removed.
- The Discussion now uses four functional subsections plus a separate Conclusion.
- The user rejected retaining a stepwise-directional deviation when the registered joint order test can be implemented. The temporary disclosure was removed. The registered joint tests for EU, BS, and AVS are now a required maintainer-side restoration rather than an optional alternative.
- `for-ai/scripts/candidate_registered_analysis_pipeline.R` contains a non-authoritative candidate implementation of both the registered order-adjusted repeated-measures ANCOVA and the registered joint ordered Bayes factors. The locked native-Windows R backend crashes before execution, so the Bayesian portion remains unrun.
- `for-ai/scripts/candidate_registered_rm_ancova.py` was executed in the locked OSF Python environment on the authoritative `N=39` master dataset. It produced internal outputs under `for-ai/statistical-audit/candidate-registered-results/`, and an independent statsmodels calculation reproduced all 40 `F` statistics to numerical precision.
- Registered RM-ANCOVA versus current mixed-effects decisions are unchanged for all 40 outcomes at both nominal and within-family FDR thresholds. This satisfies the user's criterion for preferring the registered pipeline, but the results remain non-authoritative until OSF adoption and regeneration.
- `for-ai/statistical-audit/STATISTICAL_REPORTING_CHRONOLOGY.md` is the running segment inventory. `FINAL_STATISTICS_AUDIT_CHECKLIST.md` is the controlling final reconciliation checklist.
- Remaining statistical blockers are authoritative RM-ANCOVA adoption, authoritative joint-order BF adoption, final multiplicity wording approval and application, pictograph-output synchronization, and final manuscript-to-output numerical reconciliation.
- PLV is frozen by user direction. The confidence-weighted blinding index remains in the main Results with limited emphasis. The partially prospective registration timing and JASP substitution are not to be foregrounded.

## 2026-08-23 - Post-screening sample and complete statistics re-audit

- The user reaffirmed that PLV is final. Records from the eight PLV-screened-out participants may be used only for adherence quality screening, outlier detection, and participant flow; they do not enter any other analysis. The active manuscript and supplement contain no 47-participant inferential comparison.
- The complete manuscript-facing non-OSF pipeline inventory is now `for-ai/statistical-audit/NON_OSF_STATISTICS_PIPELINE_INVENTORY.md`. The only missing pipeline families are the registered non-PLV RM-ANCOVA, the registered joint ordered Bayes factors for EU/BS/AVS, and the exploratory pictograph--ASC analysis reported in S4.
- `for-ai/scripts/pictograph_asc_correspondence_pipeline.py` consolidates and supersedes the temporary S4 audit scripts. It ran successfully at 10,000 permutations and 2,000 participant bootstraps on the locked `N=39` inputs and reproduced all manuscript spot checks. Its outputs remain internal and require OSF adoption.
- The critical consistency report is `for-ai/statistical-audit/FULL_PAPER_STATISTICAL_CLAIM_AUDIT.md`.
- Newly confirmed reporting gaps are the six available 3D-ASCr planned-contrast Bayes factors in the main Results, a compact complete self-condition/Bayesian table in S4, and the 22 registered tracer omnibus tests in S5. Tracer Bayes factors are not explicitly preregistered and should remain in OSF for parsimony.
- The supplementary cross-study prose is stale relative to the current six-profile figure because it omits Fincham and calls the figure a five-dataset comparison.
- The repeated claim of no adverse events among all 47 participants has no identified source in the active manuscript or OSF result outputs. It requires a source-locked safety record or removal after exact item approval.
- Submission-facing corrections remain blocked by the item-by-item wording gate. Candidate RM-ANCOVA and joint-order values remain additionally blocked by authoritative OSF adoption.

## 2026-08-23 - Approved statistical-text Items A1--A7

- The user explicitly approved A1--A7. Each item was applied only after its
  required GitHub checkpoint, committed separately, and pushed to `main`.
- The main article now contains all six source-locked 3D-ASCr planned-contrast
  Bayes factors, qualifies the smaller Distressing effect, states the selected
  multiplicity hierarchy, and defines recruitment-naive.
- Supplementary S3 now interprets ICC as weak nominal evidence that is not
  FDR-robust, with inconclusive Bayesian evidence.
- The cross-study text and caption now identify the present profile plus five
  comparison datasets, and the bibliography uses the final Fincham et al. 2026
  Frontiers in Psychology record.
- The final Discussion paragraph and Conclusion no longer claim cross-study
  equivalence, superior tolerability, clinical benefit, practice efficacy, or an
  unsupported absence of adverse events.
- A separate opening-Discussion sentence still says `no adverse events across 47
  tested participants`. It was outside A7's approved locations and remains
  unapplied as exact Item A8.
- The S3.4 Distressing summary still states only that neither constituent
  survives FDR. Exact Item A9 would align it with the approved hierarchy by
  distinguishing ICC's weak nominal result from its non-robust FDR sensitivity
  result and Anxiety's nominally inconclusive contrast.
- The canonical review PDFs compile to 50 main pages and 18 supplementary pages.
  Logs contain no undefined citations or references, duplicate labels, overfull
  boxes, or fatal errors. Every page affected by A1--A7 was rendered and visually
  verified. Zenodo and final OSF-commit placeholders remain expected blockers for
  final-mode packaging.

## 2026-08-23 - Parsimonious OSF statistics pipeline handoff

- `for-ai/statistical-audit/OSF_PARSIMONIOUS_STATISTICS_PIPELINE_SPEC.md` now defines the complete OSF maintainer target: a 39-outcome non-PLV registered engine, the three registered joint-order Bayes factors, the manuscript-facing exploratory scope, compact output schemas, validation contracts, and the adoption/replay sequence.
- `for-ai/statistical-audit/OSF_PIPELINE_SEGMENT_CHECKLIST.csv` provides a 48-row chronological main-and-supplement audit sheet with stable segment IDs, compute-once keys, expected test scope, current OSF state, and required maintainer action.
- The handoff keeps PLV frozen, prohibits non-PLV inference in the eight excluded participants, and distinguishes required manuscript-supporting tests from optional OSF-only extensions. Tracer Bayes factors, pooled repeated-observation ASC--tracer correlations, extra blinding diagnostics, tracer moderation extensions, and unreported item-level pictograph expansions are outside the required reviewer-facing scope.
- The preferred OSF architecture extends the existing registry and numbered scripts rather than creating outcome-specific scripts. The existing 39-row primary-family CSV becomes the canonical registered frequentist table after its mixed-model omnibus fields are superseded; a three-row joint-order Bayesian output, compact blinding output, five pictograph outputs, and a manuscript-statistic map complete the missing machine-readable layer.
- No manuscript, supplement, figure, data, or authoritative OSF file was changed for this handoff.

## 2026-08-23 - Registered-omnibus source-lock placeholders

- The user approved placeholder Items P1--P3 pending authoritative OSF adoption of the registered non-PLV partial-$F$ pipeline.
- Main and supplementary Methods now describe the registered participant-blocked, block-position-adjusted partial-$F$ analysis for non-PLV outcomes. The finalized PLV omnibus remains unchanged.
- Two main-results locations and all 11 Supplementary S3 omnibus locations now use the exact searchable marker `REGISTERED OMNIBUS STATISTICS PENDING OSF SOURCE LOCK` instead of the obsolete mixed-model chi-square values.
- The placeholders are review-state blockers and must be replaced from a clean, replay-verified OSF commit before final-mode packaging. Planned contrasts, ordinary Bayesian results, PLV statistics, and exploratory mixed models were not changed.

## 2026-08-24 - Cross-study Discussion placement and Online Resource audit

- The user restored the descriptive cross-study ASC profile to the altered-state Discussion. The former full-paper-audit decision to place that profile in Supplementary S3 is superseded.
- Main Figure 9 now uses the unchanged source-derived `Fig09_cross_study_profiles.pdf`, cites the current five comparison datasets, and retains the contextual, non-equivalence interpretation. The supplementary cross-study subsection and duplicate figure environment are removed.
- With the cross-study figure removed from the supplement, the tracer schematic and empirical profile comparison again display as Figures S1 and S2, matching `FigS01_tracer_schematic.pdf` and `FigS02_tracer_profiles_vertical.pdf`. No figure asset was renamed, moved, or modified.
- All 13 main-text supplementary referrals now use `Online Resource 1, Section S#`, and the main article supplies the approved concise Online Resource 1 caption.
- Tables S2--S4 and S8 and Figures S1 and S2 now have explicit textual referrals in sequential order. IQR, 3D-ASCr, and SFoRC are defined at first supplementary use.
- The old page-9 cross-study reflow and supplementary filename-renaming proposals are obsolete. The rebuilt supplement is 16 A4 pages; the former severely underfilled cross-study and pre-profile pages no longer exist in that form.
- The canonical review build is 51 manuscript pages and 16 Online Resource pages. Final logs contain no undefined citations or references, duplicate labels, overfull boxes, or fatal errors, and every page was rendered and visually inspected.
- Maintainer-only dependencies remain: re-export the tracer schematic at PDF 1.5 or earlier, add redundant non-colour condition encoding to the empirical tracer-profile figure, and restore the canonical recalled-time-course asset before inserting the already approved subsection and Figure S3.

## 2026-08-24 - Statistical reporting complete under owner-defined scope

- Approved statistical completion Items 1--4 are implemented and source-locked: the non-PLV omnibus model is correctly identified as the registered block-position-adjusted participant-blocked partial-`F` test while PLV retains its finalized mixed-effects omnibus; the EU, BS, and AVS stepwise directional statements are replaced by the registered joint-order Bayes factors; Supplementary Section S5 includes all 22 tracer omnibus tests; and Supplementary Section S4 includes the complete three-measure frequentist and Bayesian pictograph inventory with a main-text referral.
- Authoritative statistics implementation commit `9df6cc4d1ef291445dadab11fdb53d5bbde084dd` passed the recorded clean-room audit. The OSF `3.Results/S6/` folder contains the expected 39-row registered omnibus, 78-row planned-contrast, 3-row joint-order, 3-row self-condition, 22-row tracer-omnibus, 381-row pictograph, and 448-row manuscript-claim views.
- The owner explicitly declined another OSF rerun. Manual read-only folder and script inspection found no missing required result family, so no tests were added to the scripts.
- The owner excluded the separately raised blinding wording and adverse-events issues from this statistical completion scope and stated that OSF branch state does not determine readiness of this manuscript repository. Those matters must not be reopened as statistical blockers unless the owner changes scope.
- The owner subsequently reaffirmed approval of audit concerns 1--4 and resolved concerns 5--6 by authorial authority, with an explicit instruction not to reopen or raise concerns 5--6 again. Concern 4 is implemented in the self-measure Methods: PBBS and Small Self use A--G/1--7, whereas SFoRC uses A--H/1--8, preserving the valid included `H` response and the required `N=39` analysis.
- The canonical review build completes successfully at 52 manuscript pages and 17 Online Resource pages. Final logs contain no undefined citations or references, duplicate labels, overfull boxes, or fatal errors. The pages containing the amended Bayesian method, restored Figure 7 referral, Table S5, and Table S9 were rendered and visually verified without clipping, overlap, or illegible content.
- Statistical reporting and external release identifiers are complete under
  the owner-defined scope. The stale source archive and remaining checklist
  items are the active submission blockers.

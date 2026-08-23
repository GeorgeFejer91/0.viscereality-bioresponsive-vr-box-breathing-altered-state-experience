# Project decisions

## 2026-08-23 - GitHub checkpoint before every approved item

Decision: require a successful pushed Git checkpoint immediately before implementation of every separately approved project-text item.

Rationale: the user wants a durable remote record of exactly what changed, when it changed, and which approved item caused each change.

Consequences:

- Multiple approved items must be implemented serially rather than bundled into one uncheckpointed edit.
- The state before Item 1 must be committed and pushed before Item 1 is applied. The completed Item 1 state must then be committed and pushed as the checkpoint before Item 2, and so forth.
- An item remains unapplied if its required checkpoint cannot be committed or pushed.
- Checkpointing must preserve unrelated user changes and does not weaken the immutable research-artifact gate.
- Each implementation report must identify the pushed branch and pre-item commit.

## 2026-08-21 — AI control plane

Decision: use `for-ai/` as the single internal location for AI instructions, project constraints, workflow state, decisions, and orchestration scripts.

Rationale: the repository root should remain limited to submission-facing outputs, while future agents need a durable and discoverable source of project instructions.

Consequences:

- Root `AGENTS.md` is the mandatory bootstrap.
- Future project-wide instructions must be recorded in `for-ai/`.
- `for-ai/` and `AGENTS.md` are excluded from external uploads.
- New scripts must be placed in `for-ai/scripts/` and registered in its README.

## 2026-08-21 — Item-by-item supervision of all project text

Decision: no AI agent may edit any project text without explicit user approval of a separately numbered change item.

Rationale: the user requires the ability to approve some proposed changes and reject others after critically reviewing the exact current and replacement wording.

Consequences:

- A request to revise or improve text produces recommendations only.
- Every recommendation must identify the file and location, exact current text, exact replacement, rationale, consequences, risks, and verification.
- Unrelated edits must be separate items.
- Only explicitly approved item numbers may be applied.
- Rejected, deferred, and unmentioned text remains unchanged.

## 2026-08-21 — Supplement provenance language

Decision: distinguish recovered originals from reconstructed supplementary drafts in all reporting.

Rationale: several dissertation/publication copies exist, with different dates, paths, and content hashes.

Consequence: the root `supplementary.tex` remains labeled as reconstructed until the user selects and verifies a canonical source for adaptation.

## 2026-08-21 — Immutable authoritative reproducibility repository

Decision: treat `https://github.com/GeorgeFejer91/0_OSF_reproducability_package` as the authoritative source for figures, statistics, original data, analysis pipelines, and figure-generation mechanisms.

Rationale: the user identified this repository as containing the original data and mechanisms from which the manuscript's figures and statistical results were produced.

Consequences:

- Agents must never mutate the authoritative repository or its canonical artifacts.
- Source-derived figures and numerical statistics in this manuscript repository are also immutable.
- Agents may inspect, compare, validate without mutation, and prepare itemized recommendations.
- Suggested research-artifact changes cannot be implemented by an agent under the current instruction.
- Discrepancies must be reported rather than silently corrected.
- Provenance reports should include source paths and commit hashes when available.

## 2026-08-21 - Dissertation source governs supplementary-text provenance

Decision: use the active Study 3 appendix in `GeorgeFejer91/Dissertation_scaffold` as the original source of truth for supplementary text. Publication repositories are comparison evidence only for this purpose.

Rationale: the user explicitly directed supplementary provenance tracing back to the dissertation projects. The active dissertation build includes `Dissertation_formatting/appendices/appendix_study3_supplement.tex`, which includes `Study 3/dissertation/dissertation_adapter/sections/study3_appendix.tex`.

Consequences:

- Treat the included dissertation appendix body as the canonical original when auditing or reconstructing supplementary text.
- Treat byte-identical Study 3 copies in the dissertation repository and its Overleaf mirror as mirrors of that source.
- Do not present standalone publication-repository supplements as the original supplementary-text authority.
- Continue to treat the root `supplementary.tex` as reconstructed until it is deliberately reconciled with the dissertation source under the item-by-item approval protocol.

## 2026-08-21 — Parsimonious supplementary structure

Decision: maintain the active supplementary document under `supplementary/main.tex` as a concise companion to the main article, with retired drafts and redundant supplementary assets stored under `for-ai/archive/supplementary/`.

Rationale: the supplement should contain only material needed to interpret, audit, or extend the main article without duplicating its narrative or the machine-readable reproducibility package.

Consequences:

- The supplement is organized into analysis decisions and sensitivity, temporal experience tracers, supporting statistical tables, and study-material and reproducibility resources.
- Temporal experience tracers receive a self-contained exploratory section.
- Controller-derived respiratory-signal implementation is not duplicated in the supplement because the main article describes it and cites the prior implementation papers.
- Data, code, raw outputs, participant-level plots, and replay materials remain on OSF.
- Archived supplementary material is internal and excluded from external submission packages.

## 2026-08-21 — Final analytic sample of 39 participants

Decision: use condition-level PLV values from all 47 tested participants only for the quality-screening stage that determines exclusions, then use only the 39 included participants for every inferential and sensitivity analysis presented in the manuscript and active supplement, including inferential condition tests of PLV.

Rationale: the user made a final top-down decision that the eight participants excluded for breathing-signal quality are outside the analytic sample and that their outcomes must not be analyzed further in manuscript-facing materials.

Consequences:

- Retain the all-participant PLV quality-screening procedure, cutoff, flags, and participant-flow information.
- Remove 47-participant inferential results and selected-versus-full-sample inferential comparisons from the manuscript package after item-by-item approval.
- Retain transparent participant-flow reporting that 47 participants were tested, 8 were excluded, and 39 were analyzed.
- Do not introduce new analyses using the excluded participants.
- The authoritative reproducibility repository remains immutable for AI agents. Upstream changes can be inventoried for user action but cannot be implemented by an agent.

## 2026-08-21 — Explicit main-text referral for every supplementary item

Decision: allow a substantive item in the active supplementary material only when `main.tex` contains an explicit, identifiable referral telling the reader that the item is available in the supplement.

Rationale: supplementary content must remain visibly connected to the main article, and discrepancies between the two documents must be forced into the user's decision process rather than silently accumulating.

Consequences:

- A generic supplementary-material mention does not cover unrelated or unidentifiable items.
- Every proposal, review, or decision involving an unreferenced supplementary item must explicitly flag the discrepancy.
- The affected item must either receive an explicit referral in `main.tex` or be omitted from the active supplement.
- Adding the referral and omitting the item are independently approvable project-text changes under the existing item-by-item protocol.
- Existing unreferenced content prevents the supplement from being treated as submission-ready until the discrepancy is resolved.

## 2026-08-21 — Canonical PLV screening figure

Decision: treat `Fig04_results_plv_exclusion_and_adherence_unified.pdf` (SHA-256 `53A85FE28AF5BB5A06747CBAF73DDD2FE758BAA328FBCFA050D0CE4C9D08EE1D`) as the canonical visual version of the PLV screening figure. It is the single-panel violin plot showing the cutoff, excluded-participant markers, and below-cutoff values. No version containing a selected-versus-all-observed sensitivity panel is permitted in the manuscript package.

Rationale: the user explicitly selected this PDF as the one and only acceptable visual version. It communicates the quality-screening procedure without reintroducing inferential analysis of the excluded participants.

Consequences:

- Preserve the canonical PDF unchanged.
- `main.tex` points directly to the canonical filename following explicit item-by-item approval.
- The user approved retirement of the conflicting local SVG and redundant `Fig06_plv_results.pdf` alias. Because figures and source-derived research artifacts are immutable for AI agents, their physical deletion remains a user-executed repository-maintenance action.
- The current authoritative renderer already routes this figure through the single-panel dissertation-style implementation, and its validation contract forbids the unwanted sensitivity-panel labels.
- Dormant sensitivity-panel code and corresponding upstream analysis-output remnants have been inventoried for user or maintainer removal, but remain read-only for AI agents.

## 2026-08-21 - Altered-state outcome hierarchy and supplementary placement

Decision: present the post-preregistration 3D-ASCr higher-order composites as the compact altered-state summary in the main article, while reporting the complete preregistered 11D-ASC analyses in the supplement with an explicit main-text referral.

Rationale: the 3D-ASCr factor model became available after preregistration, provides a smaller and more interpretable contemporary summary of the 11D-ASC, and maps the lower-order dimensions onto the study's broad theoretical interest in positive versus negative experiential valence. The study did not specify detailed predictions for each lower-order 11D-ASC dimension.

Consequences:

- The main article must identify use of the 3D-ASCr as a post-preregistration departure and explain the outcome hierarchy briefly.
- The complete preregistered 11D-ASC analysis remains reportable in Supplementary Section S3 for transparency, but the numerous lower-order tests need not remain in the main Results.
- The Discussion should interpret the higher-order Positive, Distressing, and Perceptual pattern rather than dissecting individual 11D-ASC subscales. Subscale-specific cross-study interpretation and other lower-order detail belong with the complete 11D-ASC material in Supplementary Section S3.
- Temporal experience tracers remain acknowledged as preregistered measures, but their complete methods and results belong in Supplementary Section S2 because they add limited explanatory scope beyond the questionnaire results.
- The main article must contain explicit, identifiable referrals to both supplementary sections before substantive content is moved.
- The self-related measures must not be called exploratory merely because the supporting prior literature was limited; exact replacement wording remains subject to item-by-item approval.
- No additional main-text statement about the preregistration's partial prospectivity is required solely for this editorial reorganization because the registration itself records its timing.
- These are placement and framing decisions only. Exact project-text changes remain subject to the item-by-item approval gate.

## 2026-08-21 - Dark-screen control terminology

Decision: refer to the control condition concisely as the ``dark-screen control'' after defining it as a dark-field headset condition with a central fixation marker that also provided breathing-performance feedback.

Rationale: ``dark-screen control'' is a simple, recognizable label that does not imply the display was entirely black or without visual content. Repeating the full apparatus description at every comparison would be cumbersome. The user's focus is consistent condition naming, not foregrounding that participants' eyes were open.

Consequences:

- Use ``dark-screen control'' as the standard short label throughout the manuscript.
- Explain the dark field and dual fixation/performance-feedback function once in the main Methods definition and only where technical detail requires it elsewhere.
- Remove ``black-screen,'' ``black screen,'' ``blackened VR screen,'' ``eyes-open control,'' and generic alternative labels for the condition after exact replacements receive item-by-item approval.
- Exact submission-facing wording remains subject to the item-by-item approval gate.

## 2026-08-21 - Parsimonious Bayesian altered-state reporting (superseded in part on 2026-08-22)

Decision: center the main article's Bayesian altered-state reporting on the three 3D-ASCr composites across the three conditions. Place complete 11D-ASC Bayesian analyses in Supplementary Section S3, and replace stepwise directional testing in the main narrative with joint three-condition order-restricted tests that map as closely as possible to the preregistered directional intent.

Supersession note: the later decision not to add 3D-ASCr ordered-model Bayes factors replaces the composite joint-order portion of this decision. The omnibus and planned-contrast hierarchy remains active.

Rationale: the main article should present a small set of interpretable theory-relevant analyses rather than numerous lower-order Bayes factors. The preregistration requested Bayesian condition analyses and predicted the three-condition order for Experience of Unity, Blissful State, and Audio-Visual Synesthesia. The post-preregistration 3D-ASCr compresses the first two into Positive Effects and the third into Perceptual Effects, although it also includes lower-order dimensions without directional predictions.

Consequences:

- Retain one order-adjusted omnibus condition Bayes factor for each of Positive, Distressing, and Perceptual Effects in the main article.
- Do not present the complete 11D-ASC Bayesian inventory in the main article.
- Prefer one joint three-condition order restriction per theory-relevant higher-order composite over two stepwise one-sided comparisons.
- Do not impose a directional ordering on Distressing Effects without a separate theoretical justification, because the preregistration did not specify directional predictions for its constituent dimensions.
- The exact choice between two composite-specific ordered Bayes factors and one multivariate conjunction remains pending user approval after review of the concrete implementation alternatives.
- Complete model specifications, prior sensitivity, Monte Carlo checks, and lower-order Bayesian results belong in Supplementary Section S3.

## 2026-08-21 - Figure disposition and numbering rule

Decision: every figure asset in the project must have one unambiguous disposition: actively referenced by `main.tex`, retained in `supplementary/figures/` for an explicitly referenced supplementary figure, or retained only under `for-ai/archive/`. Main-article figure filenames must follow their order of appearance in `main.tex`; supplementary figure filenames must follow their order of appearance in `supplementary/main.tex` using the `FigS01`, `FigS02`, and subsequent convention.

Rationale: the repository currently contains byte-identical aliases, legacy descriptive filenames, source-format companions, and active filenames whose numeric prefixes do not match LaTeX placement order. A single classification and naming rule prevents obsolete figures from entering a submission package and makes the manuscript and supplement auditable.

Consequences:

- Figure moves, renames, deletions, and corresponding LaTeX-reference changes remain pending explicit item-by-item approval and the immutable research-source gate.
- The current root and supplementary figure inventories have been audited read-only. Root tracer figures remain temporarily necessary because `main.tex` still references them, even though supplementary PDF copies already exist.
- Under the previously selected parsimonious hierarchy, the recommended target is eight ordered main figures and two supplementary tracer figures, with all duplicate, legacy-named, and unused source-format variants archived.
- Compiled manuscript PDFs and temporary page renders are build artifacts, not manuscript figures, and must not be assigned figure numbers.

## 2026-08-21 - Approved figure disposition, tracer relocation, and declarations

Decision: the user approved the audited eight-main/two-supplement figure disposition and directed that all substantive temporal tracer material be moved to the supplement. The user also directed that detailed analyses currently described generically as available in OSF instead receive identifiable supplementary referrals, with the OSF reproducibility package cited directly once. The authors declare no competing interests.

Rationale: this keeps the main article focused on the primary 3D-ASCr account, makes the supplement a complementary technical article, and prevents repeated generic repository referrals from substituting for navigable supplementary sections.

Consequences:

- The two tracer visuals are intended to become Supplementary Figures S1 and S2 using the staged `FigS01_tracer_schematic.pdf` and `FigS02_tracer_profiles.pdf` files.
- Main figure filenames are intended to follow the approved eight-figure placement order. Physical moves, renames, or deletions of immutable source-derived figures remain user or maintainer actions.
- Exact main-text removals, supplementary captions and insertions, referrals, declarations, and funding wording remain pending item-by-item wording approval.
- The OSF DOI should remain once in the main availability declaration; other analysis-specific references should use supplementary section labels.
- Replacement of the supplement's `FINAL_SUBMISSION_COMMIT` placeholder is explicitly reserved as the final task.

Funding provenance: the official BIAL archive identifies reference `PT/FB/BL-2022-308`, commonly expressed as Grant 308/22, for ``Altered states of viscereality: Augmenting breathwork with bio-responsive virtual reality.'' The Baden-W\"urttemberg Stiftung identifies George Fejer's Forschungswerkstatt project as ``Atemr\"aume: Integration atem- und herzratenbasierter Interaktionen in therapeutische VR-Umgebungen.''

## 2026-08-21 - Revised tracer, blinding, and reproducibility placement

Decision: retain the temporal-tracer motivation in the main Introduction, introduce the measure as psychometric time-series ratings also termed temporal experience tracers, and explain in one concise Methods referral that the analyses are exploratory because they add no explanatory value beyond the questionnaire results in this study. Keep blinding concise and complete in `main.tex`, with no supplementary blinding section. Retain the direct OSF resource reference in the self-related-measures Methods sentence and connect it to the supplementary reproducibility map.

Rationale: readers need the tracer motivation to understand why the measure was collected, but its detailed methods and results do not advance the main interpretation. The blinding analysis is already compact and complete in the main article, so duplication in the supplement is unnecessary. The direct OSF link is useful at the point where the manuscript names concrete study resources.

Consequences:

- Removing supplementary blinding causes the reproducibility section to renumber from S6 to S5.
- No main-text referral to supplementary blinding should be added.
- The exact revised tracer motivation, exploratory rationale, OSF-plus-supplement sentence, and supplementary deletion remain pending item-by-item wording approval.
- All new current-paper prose should prefer present tense and active voice.

Implementation: the user approved Revised Items 10A--10F and 11A--11C. The approved main-text referrals and tracer relocation are applied, supplementary tracer Figures S1 and S2 are inserted, supplementary blinding is removed, and reproducibility now occupies S5. Detailed ASC--tracer correspondence statistics remain pending Item 8 and are not silently inferred or added.

## 2026-08-22 - Final 3D-ASCr main-text and 11D-ASC supplement split

Decision: limit detailed altered-state analysis and interpretation in the main article to the three post-preregistration 3D-ASCr composites. Move the substantive 11D-ASC Results and lower-order subscale Discussion material to Supplementary Section S3, where the complete preregistered 11D-ASC analysis inventory and a concise descriptive component decomposition will be reported.

Rationale: the three higher-order dimensions provide sufficient detail for the explanatory scope of the article, while the supplement can preserve preregistration transparency and show which lower-order dimensions account for the composite pattern without overloading the main narrative.

Consequences:

- The main Methods retains the measurement identity, the post-preregistration disclosure, the scope rationale, and an explicit S3 referral.
- The main Results reports the 3D-ASCr descriptives, implemented condition analysis, both planned contrasts, and parallel Bayesian results at composite level.
- Preregistered directional hypotheses for EU, BS, and AVS remain 11D-ASC hypotheses and must be reported in S3. Any composite-level directional test is post-preregistration and must be labeled accordingly.
- S3 must report all 11 subscales, condition descriptives, the implemented order-adjusted omnibus analysis and preregistered RM-ANOVA sensitivity, both planned contrasts, Bayesian omnibus and planned-contrast results, the preregistered directional checks, multiplicity and robustness information, and deviations from the exact preregistered implementation.
- The S3 component decomposition is descriptive and deterministic. It should identify arithmetic contributions of constituent subscale mean differences to each equal-weighted composite, without causal or unique-effect language.
- Older text is a source for careful transfer only. The mixed Bayesian paragraph and the inaccurate Changed Meaning of Percepts interpretation require correction rather than unchanged copying.
- Exact manuscript and supplementary wording remains pending item-by-item approval. Source-derived numerical insertions remain protected by the immutable research-artifact rule.

## 2026-08-22 - Hierarchical internal structure for Supplementary Section S3

Decision: organize the complete lower-order altered-state supplement beneath the three 3D-ASCr composites. Use subsections for Positive Effects, Distressing Effects, and Perceptual Effects, and use consistent bold run-in headings for every constituent 11D-ASC dimension rather than eleven additional numbered subsections.

Rationale: this structure maintains the main article's three-composite explanatory hierarchy while allowing readers to drill down directly to the lower-order dimensions that account for each composite result.

Consequences:

- Precede the three composite subsections with one shared subsection describing the 11D-ASC measure, preregistered analysis commitments, implemented deviations, multiplicity, robustness, Bayesian models, and the descriptive component-decomposition rule.
- Use the same result order under every bold dimension heading: condition descriptives, omnibus analysis, RM-ANOVA sensitivity, both planned contrasts, parallel Bayesian results, any preregistered directional test, and arithmetic contribution to the parent composite.
- Reserve direction-specific reporting for EU, BS, and AVS. Do not imply that the other eight dimensions or the three composites had preregistered directional predictions.
- Use tables to carry the repeated exact statistics and concise prose to explain the driver pattern, thereby avoiding eleven long and repetitive mini-results sections.
- Complete S3 and its main Methods and Results correspondence before revising or relocating altered-states Discussion material.
- Exact submission-facing headings, prose, and table cells remain pending item-by-item approval.

Naming: use ``11D-ASC: Altered States of Consciousness Rating Scale'' as the S3 section title. ``Rating Scale'' follows the title of the Studerus psychometric paper, and ``11D-ASC'' is the manuscript's established abbreviation for the 11-dimensional scoring structure.

## 2026-08-22 - Author contribution allocation and declaration funding scope

Decision: distinguish BIAL funding of the reported study from Baden-W\"urttemberg Stiftung support for continued Viscereality development. Record author contributions using the CRediT taxonomy according to the user's direct allocation.

Rationale: the later Atemr\"aume award supports continued development and should not be described as funding the experiment reported here. CRediT roles should describe actual work rather than author order or generic principal-investigator status.

Consequences:

- George Fejer: Conceptualization, Data curation, Formal analysis, Funding acquisition, Investigation, Methodology, Project administration, Software, Validation, Visualization, Writing -- original draft, and Writing -- review and editing.
- Till Holzapfel: Conceptualization, Methodology, Resources, Software, Validation, and Visualization.
- Taru Hirvonen: Methodology, Resources, Software, and Visualization.
- Johannes Blum: Methodology, Resources, Software, and Validation.
- Anestis Lalidis Mateo: Methodology, Resources, and Software.
- Michael Gaebler: Conceptualization, Project administration, Supervision, and Writing -- review and editing.
- Bigna Lenggenhager: Conceptualization, Funding acquisition, Supervision, and Writing -- review and editing.
- Investigation is assigned only to George Fejer, who collected all study data.
- The exact assembled `Authors' contributions` replacement was subsequently approved and implemented in manuscript order. All authors will receive the final draft for final approval.

## 2026-08-22 - Revised author order

Decision: place Anestis Lalidis Mateo before Johannes Blum in the manuscript author list and use the same order in the CRediT contribution statement.

Rationale: the user explicitly changed the formal author ordering.

Consequences:

- The target author order is George Fejer, Till Holzapfel, Taru Hirvonen, Anestis Lalidis Mateo, Johannes Blum, Michael Gaebler, and Bigna Lenggenhager.
- Affiliation identifiers remain author-specific: Anestis Lalidis Mateo retains affiliation 6 and Johannes Blum retains affiliation 5.
- The exact `main.tex` author-line reordering and assembled CRediT paragraph were subsequently approved and implemented. All authors will receive the final draft for final approval.

## 2026-08-22 - Preserve the preregistration and maintain a live departure ledger

Decision: preserve a byte-identical copy of AsPredicted #262545 under `for-ai/preregistration/` and maintain `PREREGISTRATION_AND_DEVIATIONS.md` as the reusable source-to-manuscript crosswalk for all future agents.

Rationale: the original commitments and the study's departures are repeatedly relevant to analysis, reporting hierarchy, confirmatory status, Methods, Results, Discussion, and supplementary transparency. Scattered notes do not reliably preserve the distinction between an explicitly justified departure and an unresolved mismatch.

Consequences:

- Future preregistration-related work begins with the preserved PDF and the crosswalk.
- The ledger separately records retained commitments, explicitly justified departures, disclosed but incompletely rationalized changes, and unresolved implementation or reporting mismatches.
- The ledger must be updated together with `PROJECT_STATE.md` and `CHANGELOG.md` when preregistration-related status changes.
- The source PDF remains immutable and internal. It is excluded from external submission packages with the rest of `for-ai/`.
- Creating this internal record does not approve or apply any submission-facing text change.

## 2026-08-22 - Reader-oriented Bayes-factor reporting

Decision: report every Bayes factor with its direction and named model comparison, followed immediately by a plain-language statement of how much more likely the observed data are under the better-supported model than under the comparison model.

Rationale: Bayes factors are frequently misunderstood as posterior probabilities of hypotheses. Guidance from van Doorn et al. (2021) and Kruschke (2021) supports reporting the numerical factor, model direction, priors, and an accessible relative-evidence interpretation. The user specifically requested reader-oriented wording and rejected treating a change from JASP to R/BayesFactor as a substantive issue when the statistical analysis is otherwise the same.

Consequences:

- State ``the observed data were approximately $x$ times more likely under model A than under model B,'' not ``hypothesis A was $x$ times more likely.''
- Use $\mathrm{BF}_{10}$ or $\mathrm{BF}_{01}$ so the reported factor is normally at least 1 in the direction being described.
- Treat categorical evidence labels as optional summaries, never as substitutes for the numerical factor and its model comparison.
- Keep omnibus, paired-contrast, directional, and joint-order Bayes factors distinct.
- Report priors, model definitions, software, and versions once in Methods or reproducibility documentation rather than repeating them in every result block.
- Treat software substitution alone as a reproducibility detail, not a scientific deviation, when the model, hypotheses, priors, and estimand remain unchanged.
- Exact submission-facing implementation remains subject to item-by-item approval.

## 2026-08-22 - Direct 11D-ASC conclusions and order-language convention

- Each Supplementary Section S3 subscale block reports the full three-condition pattern rather than relying only on the pooled driver table.
- The primary omnibus result is described as an order-adjusted condition test. Separate exploratory order-main-effect and condition-by-order tests support statements about presentation order.
- Each block ends with a direct substantive conclusion without the label ``in plain terms.''
- Nonsignificant order findings are described as no reliable evidence that the result was influenced by the order in which participants underwent the three conditions, rather than as proof that order had no influence.
- Reader-facing interpretive summaries call the 11D-ASC dimensions ``fine-grained subscales'' rather than ``lower-order'' subscales.

## 2026-08-22 - Return the primary frequentist omnibus analysis to the registered model

Decision: replace the order-adjusted mixed-effects likelihood-ratio omnibus test with the registered order-adjusted repeated-measures ANCOVA after maintainer-side regeneration of the immutable analysis outputs.

Rationale: an isolated read-only comparison used participant as the repeated-measures blocking factor, condition as a three-level within-participant factor, and numeric block position (1--3) as a covariate. Across all 11D-ASC, 3D-ASCr, self-related, tracer-peak, tracer-AUC, and PLV outcomes, the registered-style partial-F test produced the same nominal and within-family FDR significance decisions as the current mixed-model likelihood-ratio test.

Consequences:

- The authoritative reproducibility repository must be updated by its maintainer; AI agents must not modify its pipeline or canonical outputs.
- After source regeneration, the main article and supplement should report the registered order-adjusted repeated-measures ANCOVA statistics rather than characterize the omnibus model as a preregistration deviation.
- Planned contrasts, Bayesian analyses, distribution-free robustness checks, FDR correction, and exploratory interaction models are separate procedures and are not changed by this decision.
- The user approved the proposed main-article Methods and Results replacements and the corresponding Supplementary Sections S1 and S3 replacements on 2026-08-22. Applying them remains contingent on maintainer-side regeneration of the authoritative outputs.

## 2026-08-22 - Grounded 3D-ASCr justification

Decision: describe the 3D-ASCr as a psychometrically supported post-registration higher-order summary whose level of detail corresponds to the paper's broad Positive, Distressing, and Perceptual hypotheses. Do not claim that it has been independently validated or shown to be more reliable in bioresponsive VR, and do not claim that foregrounding the later hierarchy introduced no analytic degrees of freedom.

Rationale: Stocker et al. support the higher-order scoring framework primarily in psychedelic datasets and state that it can be applied to previously collected ASC data. The complete registered 11D-ASC analyses remain in Supplementary Section S3, preserving the registered evidence while the main text uses the level of aggregation relevant to its explanatory scope.

## 2026-08-22 - Preregistration-audit master decisions

- Master Items 1--9 are approved. Items 1--4 remain staged until maintainer-side RM-ANCOVA regeneration makes the proposed hierarchy accurate; Item 9 remains staged until the directional Bayesian decision is resolved. Items 5, 7, 8, and 17 are implemented. Item 6 establishes that no large table of every unregistered nonparametric statistic will be added; exact secondary output remains in the reproducibility package and S3 reports material divergences.
- Master Item 10, removal of the fine-grained Discussion paragraph, is pinned for later review.
- Master Item 14, the tracer acquisition disclosure, is closed by later user direction and must not be proposed or repeatedly raised. Master Item 15, the dependence-aware ASC--tracer analysis, remains pending.
- Do not add submission-facing preregistration-deviation discussion about the registry's inaccurate completely-black control description. Report the implemented dark-screen control accurately and otherwise ignore that historical detail.
- Do not add a separate preregistration-deviation disclosure for the exploratory confidence-weighted blinding index or the additional blinding analyses. Preserve their current accurate exploratory labeling and do not describe the modified index as a standard Bang index.

## 2026-08-22 - Do not add 3D-ASCr ordered-model Bayes factors

Decision: do not add joint order-restricted Bayes factors for the post-registration Positive, Distressing, or Perceptual Effects composites.

Rationale: the symmetric-versus-asymmetric differences are negligible to small, while the pooled-VR-versus-control differences carry the substantive condition signal. A composite ordering model would therefore add little beyond the omnibus and planned contrasts and could give undue interpretive weight to the exact ordering of the two VR mappings.

Consequences:

- Retain the 3D-ASCr omnibus analyses and the pooled-VR-versus-control and symmetric-versus-asymmetric planned contrasts.
- Do not treat the registered directional predictions for Experience of Unity, Blissful State, and Audio-Visual Synesthesia as composite-level predictions.
- The missing registered joint order-constrained tests for those three original 11D-ASC subscales remain a separate unresolved matter. Resolve them through maintainer-side implementation or a concise explicit deviation disclosure in Supplementary Section S3.

## 2026-08-22 - Close the tracer acquisition-description issue

Decision: do not foreground, disclose, or repeatedly raise the preregistration's continuous-in-block tracer description as a discrepancy. Continue to report the implemented retrospective post-block tracer procedure accurately.

Rationale: the user explicitly closed this issue and instructed future agents to stop bringing it forward.

Consequences:

- Do not propose a submission-facing deviation statement about continuous versus retrospective tracer acquisition.

## 2026-08-23 - Complete S4 prose and use the portrait tracer-profile figure

Decision: implement approved tracer Items 1--5 and use the canonical portrait layout of Supplementary Figure S2 rather than the horizontal three-across layout. Size the portrait figure by page height so its radar plots are larger than in the horizontal arrangement while its caption and footer remain inside the text block.

Rationale: the portrait layout gives each radar panel more room and remains readable at final A4 size. The S4 interpretation reports condition effects and raw pooled correspondence without treating the repeated participant-condition records as independent inferential observations. It frames an 11-prompt format as a validation target rather than a demonstrated replacement for the 42-item questionnaire.

Dependency: the separately approved recalled-time-course subsection remains pending a canonical Figure S3 generated or restored by the reproducibility-repository maintainer. Do not copy a stale dissertation bitmap or mutate the immutable figure pipeline.

## 2026-08-23 - Give portrait Supplementary Figure S2 a dedicated full-width page

Decision: place `FigS02_tracer_profiles_vertical.pdf` at `\textwidth` on a dedicated float page. Retain the supplement's normal horizontal margins and locally reduce only the top and bottom margins to 10 mm and 12 mm, respectively, so the figure and its complete caption stay on one page.

Rationale: at the normal text height, scaling the portrait asset to the full text width makes the figure plus caption too tall. A locally enlarged vertical page area preserves full-width radar plots, keeps the caption and page footer together, and does not modify the immutable source figure.
- Do not list the issue as unresolved, pending, or blocking supplement completion.
- Preserve accurate descriptions of the retrospective procedure and do not claim that continuous in-block ratings were collected.
- Revisit the issue only if the user explicitly reopens it.

## 2026-08-23 - Journal-specific submission formatting

Decision: use the Springer Nature template's built-in `lineno` option in both active documents and use the `sn-basic` author--year reference style required by the live *Virtual Reality* journal guidance. Include identifying article, journal, author, affiliation, and corresponding-author information in the supplementary PDF, and use ``Statements and Declarations'' as the main declaration heading.

Rationale: the journal-level author instructions govern over the generic template's active example configuration. The live guidance and recent journal articles use author--year citations, and the supplementary-information instructions require identifying metadata in each file.

Consequences:

- Keep the unchanged official `sn-basic.bst` from Springer Nature's December 2024 template package in the submission source set.
- Compile both active documents with line numbers during submission review.
- Rebuild the bibliography and visually inspect both PDFs after any formatting change.

## 2026-08-23 - Local-first formatting with deferred reproducibility publication

Decision: complete all feasible manuscript, supplement, naming, packaging, compilation, and visual-verification work in this repository first. Keep OSF, Zenodo, and authoritative GitHub reproducibility publication, the final repository audit, and final identifier substitution as the last stage.

Rationale: final archival identifiers and immutable repository versions should describe the submission-frozen reproducibility package. Explicit placeholders allow formatting to proceed without prematurely publishing records that may change during the final audit.

Consequences:

- Track current local formatting work and deferred release work separately in the `PROJECT_STATE.md` submission-formatting to-do list.
- Use uniquely searchable placeholders until final identifiers exist, subject to item-by-item approval for submission-facing insertions.
- A placeholder-bearing PDF or source package is an internal review artifact, not a submission-ready artifact.
- AI agents may format and validate this manuscript repository within existing approval gates, but external reproducibility publication and mutations to authoritative research artifacts remain maintainer actions.

## 2026-08-23 - Canonical upload-artifact names and internal orchestration boundary

Decision: keep all build and packaging orchestration under `for-ai/scripts/`, all temporary compilation state under `for-ai/`, and all upload-facing outputs under `output/submission/`. The canonical PDF names are `Manuscript.pdf` and `ESM_1.pdf`; the canonical editable-source archive is `Manuscript_Source.zip`.

Rationale: fixed output names prevent legacy local filenames from leaking into the submission package, while the directory boundary keeps AI controls and build state separate from upload-ready artifacts.

Consequences:

- A successful orchestrated build must compile the main article and supplement independently and only then stage the two canonical PDFs.
- Packaging must exclude legacy compiled PDFs, internal control files, logs, auxiliary files, temporary directories, and review-only artifacts.
- Script creation and modification remain subject to exact item-by-item approval before implementation.

## 2026-08-23 - Final temporal-tracer figure hierarchy

Decision: retain the hypothetical peak-versus-AUC schematic in both documents as a right-hand half-width wrapped figure, and retain the empirical portrait profile comparison as a dedicated full-width supplementary page. Present the S4 interpretation before the detailed contrast table so the wrapped page remains textually continuous.

Rationale: the duplicated schematic lets the main Methods introduce the unfamiliar measurement while keeping the supplement independently interpretable. The dedicated portrait profile page gives the radar plots sufficient space, and moving S4.3 ahead of Table S5 removes the float-induced blank-page appearance without changing the approved scientific wording.

Consequences:

- The main schematic is Figure 5 and the supplementary duplicate is Figure S1; both use the approved titled hypothetical caption.
- Supplementary Figure S2 remains full width on its own page with its caption and footer.
- Table S5 contains the source-verified peak and AUC contrasts; S4.3 explicitly treats cross-format correspondence as descriptive and calls for dedicated validation.
- No unavailable historical time-course figure may be substituted for canonical Figure S3.

## 2026-08-23 - Exact cross-repository figure filename identity

Decision: use the exact filenames in the active manuscript and supplementary `\includegraphics` commands as the controlling names for the corresponding canonical reproducibility-pipeline exports.

Rationale: different source and manuscript numbering for the same figure obscures provenance and makes synchronization error-prone.

Consequences:

- Canonical pipeline exports, numeric prefixes, manuscript copies, manifests, generated registries, and reviewer-scope records must use identical filenames.
- A future figure rename or renumber must be applied across both repositories and all active references in the same task.
- Historical aliases and independent source-only figure numbering are not permitted in active output inventories.
- This exact-name identity rule supersedes any earlier workflow that temporarily tolerated legacy-numbered manuscript copies or differently numbered authoritative exports.

## 2026-08-23 - Pictographic-measure provenance and exploratory ASC correspondence

Decision: identify all three self-related pictographs as SVG recreations of previously published versions and explain the vector format's direct control over graded visual properties. Identify the Small Self item only as sourced from the Vidal publication and described there as ad hoc; do not imply that the present authors are conducting its validation or that the source authors' validation work is ongoing. Place the complete exploratory pictograph--ASC association analysis in a dedicated supplementary segment, while limiting the main article to a concise, explicitly exploratory summary of construct-linked associations such as spatial self-extension with unity and disembodiment.

Rationale: the SVG format provides scalable rendering and direct control of opacity, line width, dash pattern, figure size, and spatial extent, which should be disclosed without implying measurement equivalence. A complete corrected association matrix in the supplement avoids selective reporting, while a short main-text synthesis keeps the central theoretical relationships visible. Intervention-aware analyses must distinguish pooled-VR-minus-control change covariance from symmetric-minus-asymmetric covariance and formal condition moderation.

Consequences:

- Exact Methods, Results, Discussion, and supplementary wording remains subject to item-by-item approval.
- Label every pictograph--ASC association as exploratory and report the full multiplicity-corrected family in the supplement.

## 2026-08-23 - Preregistration-first pipeline restoration and internal candidate boundary

Decision: use the registered analysis whenever it remains sensible and does not materially change the interpretation. Restore the order-adjusted repeated-measures ANCOVA and the joint ordered Bayes factors for EU, BS, and AVS rather than preserving avoidable deviations.

Implementation boundary:

- Candidate pipelines may be created and run only under `for-ai/`.
- Candidate outputs remain internal, non-authoritative, and excluded from submission.
- The authoritative `0_OSF_reproducability_package` remains read-only for AI agents.
- The OSF maintainer must review, port, regenerate, and commit the adopted analyses before numerical manuscript replacement.
- The stepwise-directional deviation disclosure added during the audit was removed after the user selected implementation of the registered joint test.

## 2026-08-23 - Statistical reporting preferences from the full-paper audit

Decisions:

- Make no further PLV changes. The current main and supplementary PLV reporting is accepted.
- Retain the exploratory confidence-weighted blinding index in the main Results, but do not give it additional emphasis because it does not materially change the standard Bang-index interpretation.
- Do not add manuscript discussion of the partially prospective registration timing.
- Do not foreground the JASP-to-R software substitution when the statistical model, hypothesis, prior, and estimand are reproduced.
- Preserve ``naive'' only in the recruitment-naive sense defined in `GLOBAL_INSTRUCTIONS.md`, not as a claim that prior experience was screened or absent.
- Use a preregistration-first, less-conservative multiplicity hierarchy: nominal $p$ values govern preregistered planned contrasts; FDR governs exploratory and post-hoc screens; adjusted $q$ values remain visible as sensitivity information for preregistered multi-outcome families. Exact submission-facing replacements remain subject to item-by-item wording approval.

Execution record: the internal registered RM-ANCOVA candidate was run on the locked authoritative `N=39` master dataset. All 40 nominal and all 40 within-family FDR decisions match the current mixed-effects pipeline, and an independent statsmodels calculation reproduced the candidate `F` statistics to numerical precision. The registered frequentist model is therefore the selected final pipeline after OSF adoption. The joint-order Bayes factor remains pending locked Linux x86-64 execution because the native-Windows R backend crashes before analysis.
- Do not claim that a cross-sectional or change-score association is causal.
- Report that pooled VR-related SFoRC and Small Self changes covary with Positive Effects, but that no symmetric-minus-asymmetric contrast correlation survives family correction.
- Treat condition-interaction findings cautiously and report both the planned contrasts and family correction rather than foregrounding an isolated omnibus result.

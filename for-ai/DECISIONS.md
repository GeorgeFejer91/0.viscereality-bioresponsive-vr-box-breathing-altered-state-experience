# Project decisions

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

## 2026-08-21 - Parsimonious Bayesian altered-state reporting

Decision: center the main article's Bayesian altered-state reporting on the three 3D-ASCr composites across the three conditions. Place complete 11D-ASC Bayesian analyses in Supplementary Section S3, and replace stepwise directional testing in the main narrative with joint three-condition order-restricted tests that map as closely as possible to the preregistered directional intent.

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

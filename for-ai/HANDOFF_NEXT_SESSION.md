# Next-session handoff

Last updated: 2026-08-24

## Mandatory startup

Before acting, read `AGENTS.md` and every file listed there in the required order. In particular:

- Every submission-facing text change requires a numbered current-versus-proposed wording item and explicit item-by-item user approval.
- Figures, statistics, original data, analysis pipelines, and source-derived research artifacts are immutable for AI agents.
- All inferential analyses after PLV quality screening use only the final included sample of `N=39`. All 47 tested participants appear only in participant-flow reporting and the PLV screening stage.
- Use present tense and active voice wherever practical when the current paper describes what it does, reports, presents, or interprets.
- Do not use em dashes in project text.

## Current manuscript state

The active main figure canon is now sequential and synchronized to the reproducibility repository: Figures 1 through 6 retain their manuscript-facing names, the restored pictographic self-related results are Figure 7, 3D-ASCr is Figure 8, blinding is Figure 9, and the cross-study comparison is Figure 10. The active supplement retains Figures S1 and S2. Every cited figure asset is byte-identical across the two repositories. The canonical 51-page manuscript and 16-page Online Resource compiled successfully, and the affected figure pages passed rendered visual inspection.

Active sources:

- Main article: `main.tex`
- Supplement: `supplementary/main.tex`
- Supplementary figures: `supplementary/figures/`
- Compiled outputs: `output/pdf/`, but the current supplement PDF predates the latest edits and is stale.

The latest approved implementation completed the following:

1. The Introduction retains the motivation for psychometric time-series ratings, referred to as temporal experience tracers.
2. The main Methods contains one concise statement explaining that the tracer results add no explanatory value beyond the questionnaire results in this study, treats the analyses as exploratory, and refers to Supplementary Section S4.
3. Detailed tracer methods, the tracer schematic, tracer Results, the tracer-profile figure, and the tracer Discussion interpretation are removed from `main.tex`.
4. Supplementary Figure S1 uses `FigS01_tracer_schematic.pdf` in S4.1.
5. Supplementary Figure S2 uses `FigS02_tracer_profiles.pdf` in S4.2.
6. Supplementary blinding is removed. Blinding remains complete and self-contained in `main.tex`.
7. Reproducibility is now Supplementary Section S5.
8. Main-text referrals currently identify S1, S2, S3, S4, and S5.
9. The main article now contains eight figure environments after relocating the two tracer figures.

Static checks after these edits found:

- no duplicate labels;
- no unresolved local `\ref` labels;
- no missing bibliography keys;
- no missing `\includegraphics` targets;
- no unmatched LaTeX environments; and
- no `git diff --check` errors.

A compatible MiKTeX compiler is available at `C:/Users/gyorg/AppData/Local/Programs/MiKTeX/miktex/bin/x64/pdflatex.exe`, although it is not on the command path. The per-user setup now includes the journal-class dependencies `sttools`, `threeparttable`, `appendix`, `amscls`, `natbib`, and `placeins`. A prior three-page snapshot compiled successfully, but `output/pdf/supplementary-materials.pdf` predates the latest S4 tracer prose and Figure S1/S2 insertions. It is stale and is not a visual verification of the current source.

## Remaining work in recommended order

### 1. Complete Item 8, supporting supplementary statistics

This is the next substantive task. Do not add numbers without source locking and cell-by-cell approval.

#### S3.2, 11-ASC analyses

The subsection exists but is empty. The parsimonious target is:

- Table S2: condition means and standard deviations for all 11 subscales, pooled-VR-versus-control planned contrast, symmetric-versus-asymmetric planned contrast, effect size, and FDR-adjusted result.
- Table S3: the corresponding Bayesian results with each value mapped to the correct omnibus or planned-contrast source.

Important known issue: the current manuscript's 11D-ASC Bayesian paragraph mixes omnibus and pooled-VR planned-contrast Bayes factors. Verify each proposed cell against the immutable authoritative outputs before presenting it for approval. Do not silently correct the manuscript or source tables.

#### S4.2, tracer condition contrasts

The subsection contains descriptive prose and Figure S2 but no numerical table. The parsimonious target is one compact table with 11 peak rows and 11 AUC rows, containing the planned contrasts, effect sizes, and FDR results. Use only `N=39`.

#### S4.3, ASC-tracer correspondence

The subsection is empty. Do not populate inferential correlations from the currently committed pooled implementation. The authoritative pipeline treats three repeated observations per participant as independent. A repository maintainer must implement or approve a dependence-aware analysis first. Once corrected source values exist, present the exact S4.3 prose and table cells for user approval.

The user has closed the preregistration's continuous-versus-retrospective tracer-description issue. Describe the implemented retrospective procedure accurately, but do not prepare a deviation disclosure or raise the issue again unless the user explicitly reopens it.

#### Exploratory order and PLV-moderation checks

The user previously preferred these checks in the supplement rather than the main paper. The current detailed paragraph remains in `main.tex` under Exploratory Checks and still points generically to OSF. Prepare a separate exact movement proposal. A compact S1 subsection is the current logical destination.

### 2. Complete Item 12, replace generic OSF-only analysis referrals

This item has not received final exact wording approval. Prepare a new numbered packet before editing.

Current generic OSF references that require disposition include:

- the final sentence of the representative PLV figure caption;
- the condition-only repeated-measures ANOVA sensitivity sentence;
- robustness and multiplicity outputs;
- Bayesian posterior and prior-robustness outputs;
- Results-level robustness language;
- three 11D-ASC result references to descriptives, divergence, and per-dimension Bayes factors; and
- the Exploratory Checks paragraph.

Route analysis-specific material to the identifiable S1-S4 section that actually contains it. Do not claim that a supplement section reports a table until that table is present.

The user explicitly wants the concrete OSF resource reference retained in the self-related-measures Methods sentence and paired with the S5 reproducibility map. Preserve that sentence unless a new exact revision is approved.

The formal Availability and Code Availability declarations also contain the OSF DOI. Decide whether journal declarations require the repeated DOI or whether Code Availability can say that the code is included in the package described above. Present this as a separate approval item.

### 2A. Resolve remaining terminology inconsistencies

Prepare exact itemized replacements before editing:

- Supplementary S1 still says `black-screen control`.
- The S2 exclusion table still uses `Black screen` as a column heading and condition label.
- The supplement mixes `11-ASC` and `11D-ASC`, while the current main article uses `11D-ASC` for the questionnaire.

These are known inconsistencies with the approved dark-screen-control terminology and current outcome naming. Do not fix them silently.

### 3. Complete declarations

The user states that no author has competing interests. The exact proposal already prepared is:

```latex
Competing interests: The authors declare no competing interests.
```

Do not apply it without confirming that this exact item is approved in the active session.

Verified funding facts:

- BIAL Foundation Grant 308/22.
- Exact title: ``Altered States of Viscereality: Augmenting Breathwork with Bio-Responsive Virtual Reality.''
- Award round: 2022 Grants Programme for Scientific Research.
- Public project period: October 2023 to April 2026.
- Baden-W\"urttemberg Stiftung programme: Forschungswerkstatt -- Deine Idee f\"ur Morgen.
- Exact project title: ``Atemr\"aume: Integration atem- und herzratenbasierter Interaktionen in therapeutische VR-Umgebungen.''
- Public project period: 2026--2027.

The latest proposed funding wording distinguishes funding of the present project from support for continued Viscereality development. Re-present the exact current and proposed wording for approval before editing `main.tex`.

`Authors' contributions` remains a placeholder. Do not invent CRediT roles. Ask the user for author-specific contributions, then prepare an exact proposal.

### 4. Complete the approved figure-file disposition

The user approved the eight-main/two-supplement figure plan. AI agents still must not move, rename, delete, regenerate, or edit source-derived figure files. These are user or repository-maintainer actions.

Target active main filenames, in placement order:

1. `Fig01_study_procedure.pdf`
2. `Fig02_controller_pipeline.pdf`
3. `Fig03_breathing_indicator.pdf`
4. `Fig04_plv_example.pdf`
5. `Fig05_plv_results.pdf`, currently `Fig04_results_plv_exclusion_and_adherence_unified.pdf`
6. `Fig06_3d_ascr_results.pdf`, currently `Fig07_3d_ascr_results.pdf`
7. `Fig07_blinding_results.pdf`, currently `Fig10_blinding_results.pdf`
8. `Fig08_cross_study_profiles.pdf`, currently `Fig09_cross_study_profiles.pdf`

Target active supplementary filenames are already correct:

- `FigS01_tracer_schematic.pdf`
- `FigS02_tracer_profiles.pdf`

The redundant PLV alias `Fig06_plv_results.pdf` should move to:

`for-ai/archive/figures/legacy-and-source-variants/Fig06_plv_results.pdf`

Other approved archive candidates are recorded in the figure-audit decision and previous handoff context. Do not restore the obsolete sensitivity-panel SVG or the retired root tracer radar shown as deleted in the current working tree.

After a user or maintainer creates the approved active filenames, update the four `\includegraphics` references in `main.tex` to the placement-ordered names and re-run all checks. The filename-reference mapping was already approved, but preserve the item-by-item record.

The immutable study-procedure figure still contains an embedded ``Experience Tracers'' label. The user accepts the main tracer motivation, so this residual label is currently compatible with the placement decision. Any visual change remains a maintainer action.

### 5. Compile and visually verify

Before claiming submission readiness:

1. Invoke the installed MiKTeX executables by their explicit per-user paths because they are not on `PATH`.
2. Compile `main.tex` and `supplementary/main.tex` with BibTeX and repeated LaTeX passes as required.
3. Confirm zero unresolved references and citations in the logs.
4. Render every PDF page to PNG with Poppler.
5. Inspect figure placement, captions, table width, float order, section numbering, and page breaks.
6. Confirm that the supplement labels the tracer figures as Figure S1 and Figure S2 and reproducibility as Section S5.
7. Confirm that no supplementary blinding section remains.

Do not treat the supplement as submission-ready while S3.2 and S4.3 are empty, the S3 and S4 main-text referrals overpromise completeness, the declarations retain placeholders, or `FINAL_SUBMISSION_COMMIT` remains unresolved.

### 6. Final task, Item 9

Do this only after all manuscript, supplement, source-output, and figure-disposition work is final:

1. Obtain the immutable final submission commit for `https://github.com/GeorgeFejer91/0_OSF_reproducability_package`.
2. Replace `FINAL_SUBMISSION_COMMIT` in `supplementary/main.tex` after exact URL approval.
3. Rebuild and visually verify both PDFs.
4. Run the final package manifest in preview mode.
5. Confirm that `AGENTS.md`, `for-ai/`, `.git/`, temporary files, stale PDFs, and build caches are excluded from the submission package.

## Working-tree caution

The repository is dirty. Preserve all unrelated user changes. At handoff creation, `git status --short` includes modified manuscript/figure files, deleted obsolete figure files, and untracked `for-ai/`, `supplementary/`, `output/`, and `tmp/` directories. Do not restore, discard, or overwrite any of them without explicit authorization.

## Recommended first action next session

Re-run `git status --short`, confirm this handoff still matches the filesystem, and prepare the exact numbered Item 8 proposal for S3.2 before changing any submission-facing text or numerical table.

## 2026-08-23 tracer continuation override

The earlier statements that S4.3 is empty, Figure S2 uses the horizontal PDF, or the supplement PDF is stale are superseded. Approved tracer Items 1--3 and 5 are implemented; S4.3 contains the approved descriptive correspondence and validation caveat; Figure S2 uses the canonical portrait PDF; and the current 12-page supplement has passed compilation and visual QA. The only unfinished tracer item is approved Item 4, which requires a maintainer-supplied canonical `supplementary/figures/FigS03_tracer_timecourses.pdf`. Once that asset exists, insert the already approved subsection and figure environment, compile twice, render every affected page, and update this handoff.

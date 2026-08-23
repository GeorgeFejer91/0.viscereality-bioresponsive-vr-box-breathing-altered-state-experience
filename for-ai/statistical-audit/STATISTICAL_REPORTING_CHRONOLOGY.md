# Statistical reporting chronology

Last updated: 2026-08-23

## Purpose and status labels

This is the running structural inventory used to reconcile manuscript reporting with the authoritative analysis software and outputs. Segment identifiers are stable even when LaTeX line numbers change.

The implementation-facing OSF handoff is `OSF_PARSIMONIOUS_STATISTICS_PIPELINE_SPEC.md`; its machine-readable segment audit is `OSF_PIPELINE_SEGMENT_CHECKLIST.csv`. Those files define the compute-once test bundles, expected counts, output schemas, and maintainer adoption sequence corresponding to this chronology.

- `LOCKED`: reported values have an identified authoritative output source.
- `TEXT PENDING`: source output exists, but approved manuscript wording still awaits upstream regeneration or exact approval.
- `ADOPTION REQUIRED`: a candidate implementation exists only under `for-ai/` and must be adopted into the authoritative repository.
- `SOURCE SYNC REQUIRED`: manuscript results currently rely on internal temporary analysis output that is not yet canonical in the authoritative repository.
- `DESCRIPTIVE`: no inferential source output is required.

Authoritative repository inspected at commit:

`1368f4283e9186b551aecad6d626e17df9eeff0b`

Core authoritative sources:

- Master data: `3.Results/1.MasterDataset/01_master_analysis_dataset.csv`
- Frequentist family summary: `3.Results/2.PrimaryStatistics/04_primary_family_summary.csv`
- Bayesian omnibus: `3.Results/4.BayesianStatistics/02_bayesian_omnibus_summary.csv`
- Bayesian planned contrasts: `3.Results/4.BayesianStatistics/03_bayesian_planned_contrasts.csv`
- Current stepwise directional output, to be superseded for the registered test: `3.Results/4.BayesianStatistics/06_bayesian_directional_summary.csv`
- Exploratory family output: `3.Results/3.ExploratoryStatistics/02_exploratory_statistics_results.csv`
- Blinding association output: `3.Results/3.ExploratoryStatistics/08_blinding_pre_post_guess_association.csv`

## Main article chronology

### M00 — Participants and design

- Location: `main.tex`, Participants and Present Study.
- Reports: target 36; 47 tested; 8 excluded; final inferential sample 39; 6--7 participants per order; age and gender descriptives.
- Source: master dataset and outlier summary.
- Status: `LOCKED`.
- Audit rule: 47 is used only for participant flow and PLV screening; all inference uses 39.

### M01 — Common statistical framework

- Location: `main.tex`, Preregistration and Reproducibility.
- Reports: omnibus condition model, two preregistered paired contrasts, robustness tests, multiplicity policy, Bayesian omnibus and planned contrasts, directional hypotheses, blinding models, and exploratory models.
- Status: `ADOPTION REQUIRED` for the omnibus RM-ANCOVA and joint ordered Bayes test; otherwise `LOCKED`.
- Candidate implementation: `for-ai/scripts/candidate_registered_analysis_pipeline.R`.
- Executed frequentist candidate: `for-ai/scripts/candidate_registered_rm_ancova.py` and `for-ai/statistical-audit/candidate-registered-results/candidate_registered_rm_ancova.csv`.
- Decision audit: all 40 nominal and all 40 FDR decisions match the current mixed-effects pipeline. Authoritative adoption is still required before manuscript replacement.
- Required OSF adoption: replace the mixed-effects omnibus with the registered order-adjusted repeated-measures ANCOVA; replace the stepwise directional substitute with a joint `symmetric > asymmetric > dark-screen control` Bayes factor for EU, BS, and AVS.

### M02 — Sample and exclusions

- Location: `main.tex`, Results, Sample and Exclusions.
- Reports: 47 records screened, 8 excluded, final complete-triad sample 39.
- Status: `LOCKED`.
- Editing constraint: PLV reporting is frozen by user direction unless explicitly reopened.

### M03 — Adherence, PLV

- Location: `main.tex`, Results, Adherence.
- Reports: three condition means and SDs; pooled-VR contrast with `t`, `p`, `d_z`, and CI; symmetry contrast; omnibus condition statistic; two planned-contrast Bayes factors.
- Source: primary family summary, Bayesian planned contrasts, canonical PLV figure.
- Status: `LOCKED`.
- Editing constraint: no further PLV changes.

### M04 — Self-related condition effects

- Location: `main.tex`, Results, Self-Related Measures.
- Reports: detailed SFoRC descriptives, pooled contrast, symmetry contrast, omnibus result, and planned-contrast BF; concise pooled results and Bayes evidence for body boundaries and Small Self.
- Source: primary family summary and Bayesian planned contrasts.
- Status: reported main values are `LOCKED`, but the registered family is incomplete across the paper. A compact supplementary table must add all three condition descriptives, the three registered omnibus tests after adoption, all three omnibus Bayes factors, and both planned-contrast Bayes factors for every self measure.

### M05 — Exploratory pictograph–ASC summary

- Location: `main.tex`, final paragraph of Self-Related Measures.
- Reports: non-numerical summary only; complete coefficients refer to Supplementary S4.
- Status: `SOURCE SYNC REQUIRED`. The complete analysis has now been consolidated and executed through `for-ai/scripts/pictograph_asc_correspondence_pipeline.py`; candidate outputs are under `for-ai/statistical-audit/non-osf-results/pictograph-asc-correspondence/`. OSF adoption remains required.

### M06 — 3D-ASCr main altered-state result

- Location: `main.tex`, Results, Altered States of Consciousness, 3D-ASCr composites.
- Reports: three condition means and SDs for Positive, Distressing, and Perceptual Effects; pooled-VR `t`, `p`, `d_z`, raw-scale change, and common-language effect; symmetry summary; three omnibus condition statistics; three omnibus Bayes factors.
- Source: primary family summary and Bayesian omnibus summary.
- Status: `LOCKED` under the current mixed-model source; omnibus statistics must be replaced after registered RM-ANCOVA adoption.
- Executed registered candidates: Positive `F(2,75)=7.56`, Distressing `F(2,75)=4.64`, Perceptual `F(2,75)=19.63`; all preserve the current substantive decisions.
- Interpretive rule: Perceptual and Positive evidence is clear; Distressing is smaller and its modest Bayesian support must not be overstated.
- Planned Bayesian reporting: all six source-locked contrasts are now in the main paragraph. Pooled VR versus control: Perceptual `BF10=1178.41`, Positive `BF10=12.96`, Distressing `BF10=3.02`. Symmetric versus asymmetric: Perceptual `BF01=3.87`, Positive `BF01=5.07`, Distressing `BF01=5.66`.

### M07 — 11D-ASC referral

- Location: `main.tex`, one-sentence 11D-ASC paragraph.
- Reports: no lower-order statistics; refers to Supplementary S3.
- Status: `LOCKED` structurally.

### M08 — Blinding

- Location: `main.tex`, Results, Blinding Questionnaire.
- Reports: symmetry, neutral, sham, and total accuracy; correct, incorrect, and uncertain guesses; standard Bang index and CI; exploratory confidence-weighted index and CI; point-biserial association.
- Source: master blinding data, canonical figure, and blinding association output.
- Status: `LOCKED` for reported aggregates.
- Interpretive rule: the confidence-weighted index remains in the main text but receives no additional emphasis because it does not materially change the standard-index interpretation.

### M09 — Exploratory order and PLV-moderation checks

- Location: `main.tex`, Results, Exploratory Checks.
- Reports: global null summary for corrected order and moderation families; PLV order main effect, condition-by-order test, and linear session-position contrast.
- Source: exploratory family output.
- Status: `LOCKED`; final placement remains an editorial question, not a statistical regeneration requirement.

## Supplement chronology

### S1 — Preregistration departures

- Reports: PLV replacement, exclusion-rule replacement, current omnibus-model departure, paired contrast implementation, nonparametric additions, multiplicity procedure, post-registration 3D hierarchy, exploratory-analysis status, and tracer-correspondence limitation.
- Status: `TEXT PENDING` for removal of the omnibus-model departure after RM-ANCOVA adoption.
- Joint ordered Bayes policy: do not retain a stepwise-deviation disclosure. Implement the registered joint test upstream.

### S2 — PLV computation and screening

- Reports: analytic-signal construction, phase difference, PLV equation, pooled lower-tail IQR rule, quartiles, cutoff, and eight excluded participant triads.
- Source: master dataset, outlier summary, and canonical PLV implementation.
- Status: `LOCKED` and frozen by user direction.

### S3.00 — 11D-ASC family orientation

- Reports: eleven-dimension family, three 3D-ASCr groupings, descriptive driver ranking, and multiplicity definition.
- Status: main Methods now states the selected planned-versus-exploratory hierarchy; a final S3-wide sentence audit remains open.

### S3.01 — Positive Effects driver table

- Ordered rows: EU, CMP, DIS, SE, IS, BS.
- Reports: pooled-VR mean difference, CI, paired `d_z`, nominal `p`, and global eleven-dimension `q`.
- Source: primary family summary.
- Status: `LOCKED`.

### S3.02–S3.07 — Positive constituent blocks

- Sequence: EU, CMP, DIS, SE, IS, BS.
- Each reports: three condition descriptives; omnibus statistic and BF; pooled contrast and BF; symmetry contrast and BF; robustness statement; order diagnostic; direct conclusion.
- Directional registered outcomes: EU and BS.
- Status: `ADOPTION REQUIRED` for registered RM-ANCOVA and joint ordered BF values; all other values `LOCKED`.

### S3.08 — Distressing Effects driver table

- Ordered rows: ICC, ANX.
- Status: `LOCKED` numerically; the ICC block now distinguishes nominal evidence, FDR sensitivity, and inconclusive Bayesian evidence.

### S3.09–S3.10 — Distressing constituent blocks

- Sequence: ICC, ANX.
- Reports the same recurring statistic types as the Positive blocks.
- Status: `ADOPTION REQUIRED` for RM-ANCOVA; otherwise `LOCKED`.

### S3.11 — Perceptual Effects driver table

- Ordered rows: AVS, EI, CI.
- Status: `LOCKED`.

### S3.12–S3.14 — Perceptual constituent blocks

- Sequence: AVS, EI, CI.
- Directional registered outcome: AVS.
- Status: `ADOPTION REQUIRED` for RM-ANCOVA and joint ordered AVS BF; otherwise `LOCKED`.

### S3.15 — Fine-grained contribution summary

- Reports: arithmetic contributors to Positive, Distressing, and Perceptual Effects; questionnaire-content overlap; family-wide symmetry and order conclusions.
- Status: `DESCRIPTIVE`, with wording review required after multiplicity and RM-ANCOVA adoption.

### S3.16 — Cross-study context

- Reports: the present profile plus five comparison datasets and subscale-level qualitative context.
- Status: `DESCRIPTIVE` only. No cross-study inferential claim is permitted.

### S4.00 — Pictograph scoring and exploratory model

- Reports: coding direction, reverse scoring, pooled-VR and symmetry change scores, permutation and bootstrap settings, fixed-effects interaction models, and three multiplicity families.
- Status: internal pipeline and candidate outputs now exist and reproduce the manuscript; authoritative `SOURCE SYNC REQUIRED` remains.

### S4.01 — Composite correspondence

- Reports: nine Spearman correlations and adjusted values; three rank-partial follow-ups.
- Status: `SOURCE SYNC REQUIRED`.

### S4.02 — Fine-grained correspondence

- Reports: 33 subscale associations and every item association surviving correction across 126 tests.
- Status: `SOURCE SYNC REQUIRED`.

### S4.03 — Intervention and mapping specificity

- Reports: symmetry-minus-asymmetry screens and participant fixed-effects interaction families.
- Status: internal pipeline and candidate outputs now exist and reproduce the manuscript; authoritative `SOURCE SYNC REQUIRED` remains.

### S4.04 — Registered self-measure condition inventory

- Intended reports: complete condition descriptives, registered omnibus tests, omnibus Bayes factors, and both planned frequentist/Bayesian contrasts for Perceived Body Boundaries, SFoRC, and Small Self.
- Status: `TEXT PENDING` and `ADOPTION REQUIRED` for the registered omnibus values. This compact table is currently absent.

### S5.00 — Tracer task and data reduction

- Reports: retrospective drawing task, normalized peak and AUC definitions, and exploratory status.
- Status: `LOCKED` descriptively.

### S5.01 — Tracer condition contrasts

- Reports: 44 paired contrasts, comprising peak and AUC for eleven dimensions and both planned contrasts, with `t`, `d_z`, `p`, and `q`.
- Source: primary family summary and tracer reference output.
- Status: `LOCKED`.

### S5.01A — Registered tracer omnibus condition tests

- Intended reports: order-adjusted RM-ANCOVA for peak and AUC across all 11 dimensions, with `F(2,75)`, nominal `p`, partial eta-squared, and exploratory-family `q`.
- Status: currently absent; `ADOPTION REQUIRED` for authoritative registered values. The candidate pattern retains EU, EI, and AVS after FDR for both peak and AUC; DIS is nominal only.

### S5.02 — ASC–tracer correspondence

- Reports: descriptive profile convergence only and validation limitations.
- Status: `DESCRIPTIVE`; dependence-aware inferential validation remains upstream work.

### S6 — Reproducibility and access

- Reports: OSF DOI, repository contents, materials, data, scripts, figures, and version placeholder.
- Status: `TEXT PENDING` for final authoritative commit identifier.

## Required reconciliation sequence

1. Have the authoritative repository maintainer review and adopt the executed RM-ANCOVA candidate; its 40/40 decision audit is complete.
2. Run the joint-order candidate in the locked Linux x86-64 R/BayesFactor environment.
3. Validate the joint-order posterior coefficient mapping, prior order probability, and Monte Carlo error.
4. Regenerate canonical OSF outputs and record the authoritative commit hash and output paths.
5. Replace manuscript mixed-model omnibus statistics with source-locked RM-ANCOVA values.
6. Replace stepwise directional interpretation with source-locked joint-order Bayes factors for EU, BS, and AVS.
7. Re-run the full segment-by-segment audit before submission.
8. Add the compact self-condition and tracer omnibus tables after the applicable approval and adoption gates; the source-locked 3D planned Bayes factors are complete.
9. Resolve the one remaining unsupported Discussion-opening safety claim; the cross-study prose/caption and final Discussion/Conclusion claims are reconciled.

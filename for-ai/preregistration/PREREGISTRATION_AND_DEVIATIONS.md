# Preregistration and deviation crosswalk

Last audited: 2026-08-22

## Mandatory use

This file is the durable internal reference for the original Study 3 preregistration and the manuscript's departures from it. Read it before reviewing or changing claims about study design, hypotheses, outcomes, exclusions, sample size, confirmatory or exploratory status, statistical models, temporal tracers, blinding, or preregistration transparency.

Do not infer that a departure is resolved merely because the current manuscript reports the implemented method accurately. The status labels below distinguish departures with an explicit rationale from mismatches that still need transparent submission-facing treatment. Any new manuscript wording remains subject to the item-by-item approval protocol.

## Preserved source

- Internal immutable copy: `for-ai/preregistration/Study3_AsPredicted_Preregistration_262545.pdf`
- Title: `Viscereality - Symmetric Breathing Space`
- Registry: AsPredicted #262545
- Public record URL printed in the PDF: `https://aspredicted.org/qc3rz2.pdf`
- Preregistered: 2025-12-06 05:30 PT
- PDF generated: 2026-08-14 07:15 PT
- Pages: 2
- SHA-256: `B8DA2B50E976E14C3A552D32194B659ECB66CC62A23284DD3610FF7729FB913D`
- Authoritative local source inspected read-only: `C:/Users/gyorg/Desktop/0_OSF_reproducability_package/5.MethodsAndMaterials/Preregistration/Study3_AsPredicted_Preregistration_262545.pdf`
- A second copy at `C:/Users/gyorg/Documents/GithubWriting/Publications/Viscereality--Empirical-Validation-of-a-Bioresponsive-Virtual-Reality-Breathing-Environment/osf/6.Documentation/Study3_AsPredicted_Preregistration_262545.pdf` has the same SHA-256.
- The record is bundled with AsPredicted #262919, `Visceral Breathing Space`, at `https://aspredicted.org/za3zq6.pdf`. That bundled registration was not part of this audit.

The internal PDF is a byte-identical preservation copy. Do not edit, regenerate, annotate, or replace it without source and hash verification.

## Registration timing and scope

The registration is partially prospective. Question 1 states that some data had already been collected. Question 8 specifies that 19 participants had been collected during a pilot intended to verify Meta Quest signal logging and troubleshoot technical issues. The record states that these data had not been inspected beyond successful data logging and that approximately half of the planned sample was collected before author approval of the registration was completed.

The study's primary aim was to validate Viscereality for altered states of consciousness, self-related experience, and adherence to box breathing. The secondary aim was to test whether dynamic visual symmetry affected valence, engagement, adherence, and self-related experience.

## Preregistered design and outcome commitments

### Conditions

All participants were to complete three counterbalanced within-subject conditions with identical breathing instructions, task duration, and controller-based respiratory acquisition:

1. High-symmetry VR, using strong harmonic coupling to synchronize particle features.
2. No-symmetry VR, using weakened, destabilizing, or weakly structured coupling to prevent coherent synchronization.
3. A `blackscreen control`, described in the registration as a completely black headset display with standardized audio guidance.

### Five dependent-variable families

1. Altered states of consciousness: 42 items scored as the 11D-ASC, one score per dimension and condition.
2. Temporal experience tracers: continuous intensity ratings for every ASC dimension throughout each breathing block, yielding time-series data.
3. Self-related experience: Perceived Body Boundaries Scale, Spatial Frame of Reference Continuum, and Small Self Scale.
4. Breathing adherence: summed absolute deviations from the four 4-second phase targets, averaged across valid cycles per condition.
5. Blinding: a 12-item manipulation-awareness questionnaire, forced-choice condition guess, confidence rating, and Bang's Blinding Index with and without confidence ratings.

### Preregistered analyses

- Each 11D-ASC dimension: one-way repeated-measures ANOVA with condition as the within-subject factor and presentation order as a covariate.
- Planned contrasts: pooled VR versus control, and symmetric versus asymmetric VR.
- Parallel Bayesian repeated-measures ANOVAs in JASP.
- Directional Bayes factors for the full order symmetric VR greater than asymmetric VR greater than control, limited to Experience of Unity, Blissful State, and Audio-Visual Synesthesia.
- Tracers: peak and area under the curve (AUC), correlations with corresponding 11D-ASC scores for convergent validity, and the same repeated-measures ANOVA approach as the primary analyses.
- Each self-related measure: the same repeated-measures ANOVA, planned contrasts, and parallel Bayesian analysis.
- Adherence: repeated-measures ANOVA with order covariate on mean composite phase-duration error.
- Blinding: item-based manipulation awareness, forced-choice guesses with confidence, and Bang's Blinding Index with and without confidence ratings.

## ASC preregistration promise checklist

Last ASC-specific audit: 2026-08-22

Checked boxes mean that the commitment is either fulfilled as registered or formally accounted for by a disclosed and rationalized deviation. They do not imply literal adherence when the line is marked `ADDRESSED DEVIATION`. Unchecked boxes identify work that is still missing or unresolved.

### Measurement and reporting scope

- [x] **FULFILLED — Administer the 42-item 11D-ASC on 0--100 sliders.** The released data contain Q01--Q42 for each condition, and the scoring key maps all 42 administered items to the registered dimensions.
- [x] **FULFILLED — Produce one score for each of the 11 dimensions in each condition.** The immutable master-data pipeline calculates all eleven unweighted subscale means for the dark-screen control, symmetric VR, and asymmetric VR.
- [x] **FULFILLED — Analyze every 11D-ASC dimension rather than only a global ASC score.** All eleven dimensions have primary, planned-contrast, Bayesian, and robustness outputs in the authoritative repository.
- [x] **FULFILLED — Report the complete 11D-ASC analysis outside the compact 3D-ASCr main-text summary.** `main.tex` explicitly refers readers to Supplementary Section S3, and S3 now contains a named block for every fine-grained subscale. Placement in the supplement fulfills the reporting-location commitment; preregistration did not require main-text placement.
- [x] **FULFILLED — Preserve the registered lower-level directional scope.** Directional results are discussed only for Experience of Unity, Blissful State, and Audio-Visual Synesthesia and are not relabeled as registered predictions for the later 3D-ASCr composites.

### Frequentist condition analyses

- [x] **ADDRESSED DEVIATION — Test the three-level within-subject condition factor for every dimension while accounting for presentation order.** The registered RM-ANOVA was replaced by an order-adjusted participant-random-intercept mixed-effects likelihood-ratio test. The replacement and rationale are disclosed in `main.tex` and Supplementary Section S1; exact primary results appear in every S3 subscale block.
- [x] **ADDRESSED DEVIATION — Conduct the pooled-VR-versus-control planned contrast.** It is implemented as a paired $t$-test, which yields the same paired contrast statistic in this within-subject comparison. Every S3 block reports the result, paired $d_z$, FDR-adjusted value, and Bayes factor; Tables S2--S4 add the mean difference and 95% confidence interval.
- [x] **ADDRESSED DEVIATION — Conduct the symmetric-versus-asymmetric planned contrast.** It is likewise implemented as a paired $t$-test and reported in every S3 block with paired $d_z$, FDR-adjusted value, and Bayes factor.
- [x] **FORMALLY DISCLOSED ADDITION — Apply distribution-free checks and multiplicity control.** Friedman and Wilcoxon analyses and Benjamini--Hochberg correction were not registered, but their addition and rationale are disclosed in `main.tex` and Supplementary Section S1.
- [x] **REPORTING POLICY RESOLVED — Keep the unregistered distribution-free inventory in the reproducibility package and report material divergences in S3.** The user declined a large table of every secondary statistic. Once the approved registered RM-ANCOVA outputs replace the current mixed-model statistics, S3 will contain the exact registered primary analyses; Friedman and Wilcoxon results remain secondary checks and do not replace them.

### Bayesian analyses

- [x] **ADDRESSED DEVIATION — Conduct a parallel Bayesian omnibus condition analysis for every dimension.** The analysis uses R/BayesFactor rather than JASP and mirrors the implemented order-adjusted condition model. The software, priors, and model comparison are specified in the main Methods, and every S3 block reports the omnibus Bayes factor. By user decision, software substitution alone is treated as a reproducibility detail rather than a scientific deviation when the hypotheses, priors, model, and estimand are preserved.
- [x] **FULFILLED — Conduct Bayesian versions of both planned contrasts for all eleven dimensions.** Every S3 block reports Bayesian pooled-VR-versus-control and symmetric-versus-asymmetric results.
- [ ] **MISSING/UNRESOLVED — Compute one Bayes factor for the registered joint ordering symmetric VR greater than asymmetric VR greater than control for Experience of Unity, Blissful State, and Audio-Visual Synesthesia.** The authoritative pipeline instead computes two separate one-sided paired Bayes factors. These stepwise results do not constitute the registered joint order-constrained test. Resolution requires a maintainer-side implementation in the immutable analysis repository or an explicit submission-facing deviation disclosure.
- [x] **ADDRESSED DEVIATION — Make the directional-test status fully explicit in S3.** The main Methods identifies the implemented analyses as two one-sided pairwise steps rather than one joint ordering test. S3 reports both steps with exact values for Experience of Unity, Blissful State, and Audio-Visual Synesthesia and states that the hypothesized full ordering was not supported for any subscale because symmetric VR did not reliably exceed asymmetric VR.

### Post-registration hierarchy and interpretation

- [x] **ADDRESSED DEVIATION — Use the later 3D-ASCr composites as the compact main-text summary.** The post-registration status, deterministic derivation from the registered 11D-ASC scores, rationale for dimensionality reduction, and referral to complete S3 analyses are stated in the manuscript and Supplementary Section S1.
- [x] **FULFILLED ADDITION — Identify which fine-grained subscales contribute most to each 3D-ASCr composite.** Tables S2--S4 and Section S3.4 provide a descriptive arithmetic decomposition and explicitly avoid causal or independent-effect language.
- [x] **FULFILLED — Retain all inferential ASC analyses in the final included sample.** All reported ASC inference uses $N=39$; the 47 tested participants are used only for PLV quality screening and participant-flow reporting.

### Current ASC verdict

The core ASC commitment is substantially fulfilled or formally addressed: the registered instrument was administered and scored, all eleven dimensions were analyzed across all three conditions, presentation order was accounted for, both planned contrasts and parallel Bayesian analyses were conducted, and the complete fine-grained results are placed in an explicitly referenced supplementary section. Supplementary placement satisfies the promise to perform and report the 11D-ASC analyses because the registration did not prescribe a manuscript location.

The ASC package is not yet a literal match to the registration because the joint order-constrained Bayes factors remain unimplemented. The main Methods and S3 now disclose that the available directional results are stepwise substitutes, report all six exact pairwise Bayes factors, and explain that the full ordering was not supported for any of the three subscales. Exact distribution-free statistics remain in the reproducibility outputs under the approved parsimonious reporting policy rather than being reproduced in S3.

### Preregistered exclusions and sample target

- Medical and safety eligibility exclusions covered specified cardiovascular conditions, respiratory conditions, pregnancy, and severe motion-sickness or vestibular history.
- Withdrawal or failure to complete all three blocks led to exclusion.
- Missing or unusable respiratory data led to exclusion.
- Valid cycles required all four phases to be detected and each phase to last 2 to 8 seconds.
- Participants were to be excluded if fewer than 70% of cycles across all blocks were valid.
- Among the remaining participants, exclusion was planned when overall adherence error exceeded 2 standard deviations above the sample mean after other exclusions.
- The target was 36 complete datasets, six in each of the six counterbalancing orders. Incomplete or unusable cases were to be replaced until all orders were filled.

## Departure ledger

### D01: Adherence metric and exclusion rule

Status: Explicitly disclosed and rationalized in `main.tex` and Supplementary Section S1.

- Preregistered: phase-duration error from reconstructed inhale, hold, exhale, and hold phases; 70% valid-cycle threshold; 2-SD adherence-error exclusion.
- Implemented: phase-locking value (PLV) between the displayed sphere-radius trajectory and the ideal audio-timed reference; pooled lower-tail IQR screening on condition-level PLV, elevated to participant-level exclusion.
- Stated reason: recorded phase labels were highly fragmented. Recovering cycles required unplanned smoothing, merging, and threshold choices that introduced researcher degrees of freedom. PLV measured the intended synchronization construct without post-hoc phase reconstruction. The preregistered cycle-based exclusion rule could not be transferred because PLV does not decompose into valid-cycle counts.

### D02: Omnibus frequentist model

Status: User-approved return to the registered model is pending maintainer-side source implementation.

- Preregistered: one-way repeated-measures ANOVA with condition and presentation order as a covariate.
- Implemented: order-adjusted mixed-effects likelihood-ratio comparison of a condition-plus-order model against an order-only model, with participant as a random intercept.
- Stated reason: the realized counterbalanced design was represented more naturally by condition-specific block-position covariates than by a single omnibus order term, while retaining a within-subject, order-adjusted condition comparison.
- Sensitivity: a condition-only repeated-measures ANOVA is retained in the reproducibility outputs.
- Read-only resolution check: a registered-style repeated-measures ANCOVA was evaluated with participant as the repeated-measures blocking factor, condition as the three-level within-participant factor, and numeric block position (1--3) as a covariate. Its partial-F condition tests produced the same nominal and within-family FDR significance decisions as the current mixed-model tests across every 11D-ASC, 3D-ASCr, self-related, tracer-peak, tracer-AUC, and PLV outcome.
- Required resolution: the repository maintainer regenerates the immutable primary outputs using the registered model. The exact main-article Methods and Results and Supplementary Sections S1 and S3 replacements were approved on 2026-08-22; after source regeneration, apply them and remove this item from the submission-facing deviation account.

### D03: Planned-contrast implementation

Status: Explicitly disclosed and rationalized in `main.tex` and summarized in Supplementary Section S1.

- Preregistered: pooled VR versus control and symmetric versus asymmetric contrasts within the repeated-measures analysis.
- Implemented: standalone paired t-tests.
- Stated reason: in this within-subject setting, the paired tests yield the same paired contrast statistics as ANOVA follow-ups.

### D04: Distribution-free checks and multiplicity control

Status: Explicitly disclosed and rationalized in `main.tex` and Supplementary Section S1.

- Preregistered: no distribution-free robustness procedure and no multiplicity correction were specified.
- Added: Wilcoxon signed-rank tests, Friedman omnibus tests, and Benjamini-Hochberg FDR correction within each multi-test outcome family.
- Stated reason: Shapiro-Wilk checks indicated non-normality for several distributions, and the preregistration did not specify a multiple-comparison procedure.

### D05: Post-preregistration 3D-ASCr composites and reporting hierarchy

Status: Explicitly disclosed and rationalized in `main.tex` and Supplementary Section S1.

- Preregistered: detailed analysis of all eleven 11D-ASC dimensions.
- Implemented reporting hierarchy: the later 3D-ASCr Positive, Distressing, and Perceptual Effects composites are the detailed main-text summary; complete 11D-ASC reporting is assigned to Supplementary Section S3.
- Stated reason: the revised higher-order scoring model became available only after preregistration, deterministically summarizes the preregistered responses, reduces dimensionality, and matches the paper's broad theoretical focus on valence while retaining a perceptual dimension.
- Constraint: the directional predictions for Experience of Unity, Blissful State, and Audio-Visual Synesthesia remain lower-order preregistered predictions. They must not be relabeled as preregistered 3D-ASCr composite predictions.
- Current status: Supplementary Section S3 now contains all eleven dimension blocks, both planned contrasts, frequentist and Bayesian omnibus results, Bayesian planned contrasts, order diagnostics, driver tables, and a three-paragraph fine-grained summary. Exact RM-ANOVA sensitivity and distribution-free statistics remain summarized qualitatively rather than reported numerically, and the joint directional Bayes-factor mismatch remains governed by D07.

### D06: Bayesian software and model implementation

Status: Resolved by user direction as a non-substantive software substitution.

- Preregistered: Bayesian repeated-measures ANOVAs in JASP, parallel to the frequentist analyses.
- Implemented: BayesFactor R models matching the order-adjusted mixed-effects structure, plus Bayesian paired t-tests for the planned contrasts, with explicit priors.
- Required future treatment: report the package, version, models, and priors for reproducibility, but do not foreground the JASP-to-R substitution as a scientific deviation when the same statistical analysis is reproduced. Continue to treat any change in model, hypothesis, prior, or estimand as substantive.

### D07: Ordered Bayesian predictions

Status: Disclosed implementation mismatch; the registered joint tests remain unimplemented.

- Preregistered: Bayes factors for the joint three-condition order symmetric VR greater than asymmetric VR greater than control, only for Experience of Unity, Blissful State, and Audio-Visual Synesthesia.
- Current manuscript and supplement: accurately describe the available analyses as two stepwise one-sided pairwise tests, report all six exact values, and state that they do not support the full ordering for any of the three dimensions.
- Authoritative pipeline finding: it implements two separate one-sided paired Bayes factors rather than one joint order-constrained Bayes factor.
- Required future treatment: do not call the two stepwise tests the registered joint ordering. The current disclosure may be retained if the maintainer does not implement the original joint tests.

### D08: Temporal tracer acquisition

Status: Closed by user direction; no submission-facing disclosure or further escalation is required.

- Preregistered: participants continuously rated every ASC dimension throughout each breathing block.
- Implemented: after each condition, participants retrospectively drew eleven time-by-intensity curves in VR.
- Current paper: accurately describes the traces as retrospective and treats their analyses as exploratory.
- Required future treatment: preserve the accurate retrospective description, but do not add a deviation disclosure, treat this item as unresolved, or repeatedly raise it unless the user explicitly reopens the issue.

### D09: ASC-tracer correlations

Status: The change in status is disclosed, but its rationale and valid inferential implementation remain unresolved.

- Preregistered: correlate tracer peak and AUC with corresponding 11D-ASC scores to assess convergent validity.
- Current supplement: labels ASC-tracer correspondence analyses exploratory.
- Authoritative pipeline finding: the committed pooled correlation treats three repeated observations per participant as independent.
- Required future treatment: do not populate Supplementary Section S4.3 from the pooled inferential output. Use a dependence-aware source analysis approved or implemented by the repository maintainer, and explain why the preregistered analysis is treated as exploratory.

### D10: Additional exploratory moderation analyses

Status: Explicitly identified as exploratory.

- Not preregistered: condition-by-PLV models and related order or PLV moderation checks.
- Current treatment: identified as exploratory in the main Methods, Results, and Supplementary Section S1.

### D11: Realized sample size

Status: Realized departure reported, with participant flow and counterbalancing stated; not presented as a methodological deviation requiring a separate rationale.

- Preregistered target: 36 complete datasets, six per counterbalancing order, with replacements for unusable cases.
- Realized: 47 tested, 8 excluded through PLV quality screening, and 39 analyzed, with 6 to 7 included participants per permutation.
- Constraint: all 47 tested participants may be used only for PLV quality screening and participant-flow reporting. Every inferential analysis uses the final 39.

### D12: Control-display description

Status: The implemented method is reported accurately; by user direction, the inaccurate registry description is not foregrounded as a submission-facing deviation.

- Preregistered: a completely black display with standardized audio guidance.
- Implemented and currently reported: a dark field with a central fixation marker that also provided breathing-performance feedback.
- Required treatment: preserve `dark-screen control` as the approved concise manuscript label after the full method definition and do not claim that the implemented display was completely black. No separate submission-facing deviation sentence is required.

### D13: Asymmetric-condition description

Status: Potential terminology and implementation-detail difference requiring caution, not currently established as a substantive deviation.

- Preregistered label: `no-symmetry VR`, described as weakened, destabilizing, or weakly structured coupling that prevents coherent synchronization.
- Current label and method: `asymmetric` or `anti-symmetry`, described as negative coupling producing a visually irregular field.
- Required future treatment: do not assume equivalence or call this a departure without checking the frozen implementation and study materials. Preserve the current manuscript terminology unless the user approves a change.

### D14: Blinding analyses

Status: The implemented procedures are accurately disclosed. By user direction, no separate submission-facing deviation discussion is required for the exploratory confidence-weighted index or added blinding checks.

- Preregistered: Bang's Blinding Index computed with and without confidence ratings.
- Implemented: the standard single-group Bang index plus an exploratory confidence-weighted directional index; additional pre-unmasking chance tests and a symmetry-score versus final-guess association test are also reported.
- Required treatment: do not describe the modified confidence-weighted directional index as a standard Bang index. Retain its exploratory label; no additional deviation paragraph is required.

## Retained commitments

The current paper retains the within-subject three-condition design, counterbalanced presentation, 10-minute 4-4-4-4 audio-guided breathing blocks, controller-based respiratory acquisition, the five preregistered measurement blocks, all three self-related instruments, the 11D-ASC response data, both planned condition contrasts, parallel frequentist and Bayesian analysis families, and a blinding assessment. Retention of an outcome family does not imply retention of its exact preregistered acquisition method, exclusion rule, model, software, or confirmatory status.

## Rules for future agents

1. Start from the preserved PDF and this crosswalk, not from memory or a manuscript summary.
2. When adding or reviewing a result, map it to the exact preregistered outcome, contrast, model, and status.
3. Preserve the distinction between preregistered, post-preregistration, exploratory, robustness, sensitivity, and descriptive analyses.
4. Do not convert lower-order directional predictions into higher-order composite predictions.
5. Describe the implemented tracer procedure as retrospective, but do not raise the preregistration's continuous-rating description as an unresolved issue unless the user explicitly reopens it. Do not claim that the control display was completely black or that the current ordered Bayesian implementation is the preregistered joint order test.
6. Update this ledger whenever the manuscript, supplement, or authoritative analysis package resolves or creates a preregistration-related difference. Record the same update in `for-ai/PROJECT_STATE.md` and `for-ai/CHANGELOG.md`.
7. Treat the source PDF and research outputs as immutable. Submission-facing corrections still require exact item-by-item user approval.

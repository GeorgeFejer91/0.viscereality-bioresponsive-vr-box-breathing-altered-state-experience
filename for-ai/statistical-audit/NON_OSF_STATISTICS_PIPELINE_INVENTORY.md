# Statistics pipeline reconciliation

Last audited: 2026-08-24

## Current authoritative status

The 2026-08-23 missing-pipeline inventory below is superseded. Read-only inspection confirms that all three formerly missing manuscript-facing pipeline families are present in the authoritative reproducibility package. Statistics implementation commit `9df6cc4d1ef291445dadab11fdb53d5bbde084dd` records the completed manuscript-ordered pipeline audit. By owner direction, no additional replay was run and OSF branch state is not a readiness criterion for this manuscript repository.

The prior-run `3.Results/S6/` folder contains the complete expected views:

- `registered_non_plv_omnibus_39.csv`: 39 rows.
- `registered_planned_contrasts_78.csv`: 78 rows.
- `bayesian_joint_order_all_view.csv`: 3 rows.
- `self_condition_and_bayesian_complete_3_view.csv`: 3 rows.
- `tracer_omnibus_22_view.csv`: 22 rows.
- `pictograph_all_381_tests_view.csv`: 381 rows.
- `manuscript_claim_registry.csv`: 448 rows.

The registered frequentist, joint-order Bayesian, and pictograph pipelines reference or generate these result families. No required prior-run result was missing, so no test or script addition was needed.

## Historical 2026-08-23 boundary and source state

This inventory compares the active manuscript and supplement with the read-only
authoritative repository at commit
`1368f4283e9186b551aecad6d626e17df9eeff0b` and its current working tree. The
OSF working tree contains maintainer changes, so no AI agent may treat those
uncommitted changes as an immutable release or modify them.

All candidate code and output listed below is internal. It is excluded from the
submission package and cannot become the source of a manuscript number until the
OSF maintainer reviews, adopts, regenerates, validates, and commits it.

PLV is not an open analysis item. The all-participant PLV stage is limited to
quality screening and participant flow. All non-PLV analyses below use only the
39 included participants.

## Historical missing-pipeline inventory

| ID | Manuscript dependency | Present in OSF? | Internal pipeline | Execution status | Required resolution |
|---|---|---|---|---|---|
| NP01 | Registered order-adjusted RM-ANCOVA for every non-PLV outcome | No. The OSF primary pipeline reports a mixed-effects likelihood-ratio omnibus plus a condition-only RM-ANOVA sensitivity. | `for-ai/scripts/candidate_registered_rm_ancova.py`; parallel candidate in `for-ai/scripts/candidate_registered_analysis_pipeline.R` | Python candidate executed for all 40 available outcomes; the 39 non-PLV outcomes are the adoption target. All nominal and family-FDR decisions match the current mixed pipeline. | OSF maintainer adopts the registered model, regenerates canonical outputs, validates replay, and records a commit. PLV remains unchanged. |
| NP02 | Registered joint ordered Bayes factor, symmetric VR greater than asymmetric VR greater than dark-screen control, for EU, BS, and AVS | No. OSF contains two separate one-sided pairwise tests per outcome. | `for-ai/scripts/candidate_registered_analysis_pipeline.R` | Candidate implementation exists but has not run. The native Windows R/BayesFactor backend crashes before execution. | Run and validate on locked Linux x86-64 with at least 100,000 posterior draws per outcome, including coefficient mapping, prior order probability, Monte Carlo error, and replay adoption. |
| NP03 | Complete exploratory pictograph--ASC analysis reported in Supplementary S4 | No. No OSF script or canonical output implements the reported composite, subscale, item, rank-partial, mapping-change, or condition-interaction screens. | `for-ai/scripts/pictograph_asc_correspondence_pipeline.py` | Executed successfully with 10,000 permutations and 2,000 participant bootstraps on the locked `N=39` inputs. All manuscript spot checks passed. | OSF maintainer reviews and promotes the pipeline, adds canonical outputs and validation contracts, updates manifests/hashes, and records a commit. |

No other manuscript-facing statistical result currently depends on a pipeline
that is absent from OSF. The following were explicitly checked:

- PLV descriptives, planned contrasts, common-language effects, and screening:
  `02_run_primary_statistics.py` and the screening outputs.
- 11D-ASC, 3D-ASCr, self-measure, and tracer descriptives and planned contrasts:
  `02_run_primary_statistics.py` and `04_primary_family_summary.csv`.
- Current mixed-effects omnibus and condition-only RM-ANOVA sensitivity results:
  `02_run_primary_statistics.py`.
- Bayesian omnibus and planned contrasts:
  `04_run_bayesian_statistics.R`,
  `02_bayesian_omnibus_summary.csv`, and
  `03_bayesian_planned_contrasts.csv`.
- Current stepwise directional values, which must be superseded rather than
  relabelled as the registered joint test:
  `06_bayesian_directional_summary.csv`.
- Blinding aggregates and the exploratory confidence-weighted index:
  `02_run_primary_statistics.py` and its primary text output.
- The approved point-biserial/exact-permutation blinding association:
  `03_run_exploratory_statistics.py` and
  `08_blinding_pre_post_guess_association.csv`.
- Exploratory order and PLV-moderation models:
  `03_run_exploratory_statistics.py` and
  `02_exploratory_statistics_results.csv`.
- Cross-study ASC profiles and the Fincham dataset integration: the current OSF
  figure/data pipeline contains them, although the supplementary prose and
  caption are stale relative to the six-profile figure and the bibliography
  still cites the superseded 2025 preprint instead of the final 2026 article.

## NP03 internal output set

The executed pictograph pipeline wrote only to:

`for-ai/statistical-audit/non-osf-results/pictograph-asc-correspondence/`

Files:

- `pictograph_asc_change_score_screen.csv`
- `pictograph_asc_within_person_sensitivity.csv`
- `pictograph_asc_positive_rank_partial.csv`
- `pictograph_asc_symmetry_change_screen.csv`
- `pictograph_asc_condition_interactions.csv`
- `summary.txt`
- `python_session.txt`
- `ADOPTION_REQUIRED.txt`

Input hashes:

- Master dataset:
  `3e91ee750f60fb86433e4a96f3d148e3b87cfebc6204c75775cf1a8300947a57`
- Raw ASC item file:
  `b3f76deb87e9ed3f1a930c0f78eb83681ddaf85ecab1602e21c0785ba1ae7a1f`

Validation spot checks reproduced the currently reported values:

- SFoRC--Positive Effects: rho `0.695700`.
- Small Self--Positive Effects: rho `0.462042`.
- SFoRC rank-partial Positive Effects: `0.642953`.
- Small Self rank-partial Positive Effects: `0.375819`.
- Minimum composite symmetry-change FDR value: `0.142186`.
- SFoRC-by-condition joint interaction FDR value for Positive Effects:
  `0.037927`.

## Superseded temporary scripts

The following untracked scripts under `tmp/pictograph_audit/` were the exploratory
development sources for NP03:

- `run_full_asc_screen.py`
- `run_symmetry_contrast_correlations.py`
- `run_condition_interaction_screen.py`
- `check_partial_positive_effects.py`
- `run_analysis.py`
- `check_active_condition_consistency.py`

The consolidated `for-ai` pipeline supersedes them by providing portable input
arguments, a strict final-sample assertion, controlled output paths, input hashes,
session information, and manuscript-value validation. The temporary files remain
untracked and are not part of the reproducibility contract.

## Historical OSF adoption order (completed)

1. Adopt NP01 and regenerate the non-PLV registered omnibus output.
2. Execute and adopt NP02 on locked Linux x86-64.
3. Review and adopt NP03, including the small-cluster interaction-inference
   choice or a more conservative replacement.
4. Add manuscript-to-output validation for every reported result.
5. Rebuild the OSF manifest and hashes and complete a clean replay.
6. Only then replace candidate-dependent manuscript statistics and mark the final
   audit checklist complete.

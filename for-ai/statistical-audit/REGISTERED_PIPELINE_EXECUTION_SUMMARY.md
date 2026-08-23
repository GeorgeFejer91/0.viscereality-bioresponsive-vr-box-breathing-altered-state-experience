# Registered-pipeline execution summary

Last updated: 2026-08-23

Status: internal candidate evidence only. These results are not authoritative and must not be cited in the manuscript or submitted. The implementation and outputs still require adoption, regeneration, and verification in `0_OSF_reproducability_package`.

## Executed preregistered RM-ANCOVA candidate

- Input: authoritative `3.Results/1.MasterDataset/01_master_analysis_dataset.csv`.
- Input SHA-256: `3e91ee750f60fb86433e4a96f3d148e3b87cfebc6204c75775cf1a8300947a57`.
- Sample: the locked 39 included participants; every outcome had a complete three-condition triplet.
- Model: partial-`F` comparison of `value ~ participant + numeric block position + condition` against `value ~ participant + numeric block position`.
- Degrees of freedom: `F(2,75)` for every outcome. Participant fixed effects implement within-subject blocking; the numeric block-position term adjusts for presentation order.
- Executed implementation: `for-ai/scripts/candidate_registered_rm_ancova.py` using the locked `C:\S3OSF\e` Python environment.
- Independent validation: a separate statsmodels formula/nested-model calculation reproduced all 40 candidate `F` statistics with maximum absolute difference `2.14e-14`.

## Decision comparison with the current mixed-effects pipeline

- Nominal `p < .05` decisions unchanged: `40/40`.
- Within-family BH-FDR `q < .05` decisions unchanged: `40/40`.
- Significant outcomes at the nominal threshold: 20 under both pipelines.
- Significant outcomes after the existing family-wise BH procedure: 17 under both pipelines.
- Largest absolute change in omnibus `p`: `0.01381`, for Small Self (`p=.259` current mixed model versus `p=.273` candidate RM-ANCOVA); both remain clearly null.

This is direct evidence that restoring the registered omnibus model does not materially change the study's inferential pattern. Under the user's preregistration-first rule, the registered RM-ANCOVA should replace the current mixed-effects omnibus after authoritative OSF adoption.

## Main-article outcome candidates

| Family | Outcome | Candidate registered omnibus | Partial eta-squared | BH `q` |
|---|---|---:|---:|---:|
| PLV | PLV | `F(2,75)=6.61, p=.002` | `.150` | `.002` |
| Self | Perceived body boundaries | `F(2,75)=0.30, p=.745` | `.008` | `.745` |
| Self | Spatial frame of reference | `F(2,75)=10.99, p<.001` | `.227` | `<.001` |
| Self | Small Self | `F(2,75)=1.32, p=.273` | `.034` | `.409` |
| 3D-ASCr | Positive Effects | `F(2,75)=7.56, p=.001` | `.168` | `.002` |
| 3D-ASCr | Distressing Effects | `F(2,75)=4.64, p=.013` | `.110` | `.013` |
| 3D-ASCr | Perceptual Effects | `F(2,75)=19.63, p<.001` | `.344` | `<.001` |

The 3D order remains Perceptual, Positive, then Distressing by omnibus effect size. Distressing is statistically reliable but materially smaller than Perceptual, so the existing cautious interpretation remains appropriate.

## Complete 11D-ASC omnibus candidates

| Outcome | Candidate registered omnibus | Partial eta-squared | BH `q` |
|---|---:|---:|---:|
| Experience of Unity | `F(2,75)=8.58, p<.001` | `.186` | `.002` |
| Spiritual Experience | `F(2,75)=5.34, p=.007` | `.125` | `.015` |
| Blissful State | `F(2,75)=0.60, p=.553` | `.016` | `.608` |
| Insightfulness | `F(2,75)=1.64, p=.201` | `.042` | `.246` |
| Disembodiment | `F(2,75)=5.11, p=.008` | `.120` | `.015` |
| Impaired Control and Cognition | `F(2,75)=3.23, p=.045` | `.079` | `.071` |
| Anxiety | `F(2,75)=2.66, p=.076` | `.066` | `.105` |
| Complex Imagery | `F(2,75)=0.36, p=.700` | `.009` | `.700` |
| Elementary Imagery | `F(2,75)=15.17, p<.001` | `.288` | `<.001` |
| Audio-Visual Synesthesia | `F(2,75)=21.77, p<.001` | `.367` | `<.001` |
| Changed Meaning of Percepts | `F(2,75)=6.23, p=.003` | `.142` | `.009` |

The only nominal/FDR distinction in this omnibus family is Impaired Control and Cognition (`p=.045`, `q=.071`). Final prose must apply the agreed multiplicity hierarchy explicitly rather than switching thresholds opportunistically.

## Exploratory tracer omnibus candidates

- Peak, FDR-retained: Experience of Unity, Elementary Imagery, and Audio-Visual Synesthesia.
- AUC, FDR-retained: Experience of Unity, Elementary Imagery, and Audio-Visual Synesthesia.
- Disembodiment is nominally below `.05` for both peak and AUC but does not survive the exploratory-family FDR rule.
- All other tracer peak/AUC omnibus decisions remain null under that rule.

## Joint ordered Bayes-factor status

The registered joint `symmetric > asymmetric > dark-screen control` Bayes factors for Experience of Unity, Blissful State, and Audio-Visual Synesthesia have not been executed. The locked Windows R backend terminates before R starts, including when launched through the exact Micromamba environment. This matches the OSF handoff's existing warning that the native Windows Bayesian backend is not certified.

The candidate encompassing-prior implementation remains in `for-ai/scripts/candidate_registered_analysis_pipeline.R`. It must be run and validated in the locked Linux x86-64 BayesFactor environment with at least 100,000 posterior draws per outcome. Until then, the current stepwise values in Supplementary S3 must not be described as the registered joint test.

## Generated internal files

- `candidate-registered-results/candidate_registered_rm_ancova.csv`
- `candidate-registered-results/candidate_vs_current_omnibus_interpretation.csv`
- `candidate-registered-results/candidate_python_session.txt`
- `candidate-registered-results/ADOPTION_REQUIRED.txt`

## Required OSF reconciliation

1. Review the candidate model matrix and self-scale A-to-integer recoding.
2. Promote a clean registered RM-ANCOVA implementation into the authoritative analysis pipeline.
3. Regenerate and verify canonical frequentist CSV/TXT outputs and reviewer replay checks.
4. Run and validate the registered joint-order Bayes factor on locked Linux x86-64.
5. Update manifests and hashes, then record the authoritative commit.
6. Only then replace mixed-model `chi-square` values and stepwise directional values in the manuscript and supplement.

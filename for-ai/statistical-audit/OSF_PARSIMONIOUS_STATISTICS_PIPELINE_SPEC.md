# Parsimonious OSF statistics pipeline specification

Last updated: 2026-08-23

Status: internal maintainer handoff; not an authoritative result source

OSF repository inspected read-only at commit: `1368f4283e9186b551aecad6d626e17df9eeff0b`

## 1. Purpose

This document specifies the smallest coherent analysis pipeline that can reproduce every statistical claim retained in the main article and supplementary material. It is organized in manuscript order, but each analysis is computed only once and reused wherever the paper refers to it.

The accompanying machine-readable audit sheet is:

`for-ai/statistical-audit/OSF_PIPELINE_SEGMENT_CHECKLIST.csv`

This is a handoff specification, not permission for an AI agent to modify the authoritative OSF repository. The OSF maintainer must review, adopt, run, validate, and commit any implementation.

## 2. Non-negotiable boundaries

1. **Final inferential sample:** every inferential analysis uses the 39 participants with `include_in_analyses == TRUE` and a complete three-condition triad.
2. **All-participant use:** the 47 tested participants may be used only for participant flow and the already finalized PLV quality-screening procedure.
3. **PLV freeze:** do not alter, reimplement, reinterpret, or expand the PLV screening or PLV inferential module. The new registry must not silently route PLV through the new RM-ANCOVA engine.
4. **Preregistration first:** use the registered order-adjusted repeated-measures model unless a scientifically material and explicitly documented reason requires a departure.
5. **One estimand, one authoritative cell:** every manuscript number must map to exactly one canonical output cell or to a documented deterministic derivation from canonical cells.
6. **No competing primary pipelines:** the mixed-effects likelihood-ratio omnibus may remain in an archive or comparison file, but it must not coexist with the registered RM-ANCOVA as a second manuscript-facing decision rule after adoption.
7. **No manuscript use of internal candidates:** files under this manuscript repository's `for-ai/` directory remain non-authoritative until reproduced by the OSF package.

## 3. Recommended OSF architecture

The existing numbered OSF structure can be retained. Parsimony is achieved by extending registry-driven engines, not by creating one script per table or outcome.

| Stage | Recommended OSF component | Responsibility | Required action |
|---|---|---|---|
| P00 | `study3_outcome_constants.py` plus one analysis registry | Outcome labels, source columns, family, manuscript order, scoring direction, Bayesian eligibility, directional-hypothesis flag | Extend the registry; do not duplicate outcome lists across scripts. |
| P01 | `01_build_master_dataset.py` | Build and validate the minimized master dataset, 3D-ASCr scores, self-score columns, tracer peak/AUC, inclusion flag, order columns, and frozen PLV screening products | Retain; add contract checks only if needed. |
| P02 | frozen PLV module in `02_run_primary_statistics.py` | Existing PLV descriptives, contrasts, omnibus, Bayes references, order diagnostics, and quality-screening documentation | Freeze; do not route through P03. |
| P03 | `02_run_primary_statistics.py` | One common frequentist engine for all 39 non-PLV outcomes: descriptives, registered RM-ANCOVA, two paired contrasts, effect sizes, family adjustments, and secondary robustness checks | Replace the mixed-LRT omnibus as the canonical omnibus; retain sensitivity outputs without giving them equal decision status. |
| P04 | `04_run_bayesian_statistics.R` via its Python wrapper | Bayesian omnibus and planned contrasts for the required families; registered joint ordered Bayes factors for EU, BS, and AVS | Add the joint-order implementation and supersede the stepwise directional output. |
| P05 | `03_run_exploratory_statistics.py` | Manuscript-facing order/PLV-moderation checks, compact blinding association, and the full pictograph--ASC analysis | Adopt the internal pictograph pipeline; scope outputs to analyses actually reported. |
| P06 | `07_validate_analysis_contracts.py` | Sample, registry, scoring, model, multiplicity, output-schema, and manuscript-map assertions | Expand with the contracts in Section 12. |
| P07 | `run_all.py` and `00_run_reviewer_replay.py` | Deterministic end-to-end replay in execution order | Run Python stages everywhere; run the full BayesFactor stage in locked Linux x86-64. |

No separate table-generation analysis should recompute statistics. Manuscript tables are views over P03--P05 outputs.

## 4. Shared data and scoring contract

### 4.1 Unit and shape

- Participant identifier: one stable `participant_id`.
- Included sample: exactly 39 unique participants.
- Long-format condition analyses: exactly 117 rows for each complete outcome, three per participant.
- Conditions:
  1. `black_screen_control` as the current legacy source token, displayed in the paper as `dark-screen control`
  2. `symmetric_coupling`
  3. `asymmetric_coupling`
- `block_position` is numeric 1, 2, or 3 and is taken from the condition-specific block column.
- Every participant must have each condition exactly once and block positions must be a permutation of 1, 2, 3.

### 4.2 Self-related scoring

- Convert A--G responses to integers 1--7 before condition analysis.
- Perceived body-boundary values retain their administered A--G direction for the registered condition analysis.
- For construct-facing pictograph--ASC correspondence only, define boundary dissolution as `8 - body-boundary score`, so higher values consistently mean greater dissolution.
- SFoRC and Small Self retain direct A--G ordinal coding.

### 4.3 ASC and tracer scoring

- Preserve the registered 11D-ASC scoring and all 42 item mappings.
- Derive 3D-ASCr composites deterministically from the locked 11D-ASC scoring manifest.
- Preserve tracer peak and trapezoidal AUC definitions and the compact source-reference checks already generated by P01.
- Do not inferentially pool the three repeated ASC--tracer observations as independent observations.

## 5. Canonical outcome registry

The non-PLV registered engine must contain exactly 39 rows.

| Family | Outcomes in paper-facing order | Count | Role |
|---|---|---:|---|
| Self | Perceived body boundaries; SFoRC; Small Self | 3 | Preregistered |
| 3D-ASCr | Positive Effects; Distressing Effects; Perceptual Effects | 3 | Post-registration deterministic summary used in main text |
| 11D-ASC | EU; CMP; DIS; SE; IS; BS; ICC; ANX; AVS; EI; CI | 11 | Complete preregistered lower-order inventory in S3 |
| Tracer peak | EU; SE; BS; IS; DIS; ICC; ANX; CI; EI; AVS; CMP | 11 | Registered condition analysis; reported as exploratory |
| Tracer AUC | EU; SE; BS; IS; DIS; ICC; ANX; CI; EI; AVS; CMP | 11 | Registered condition analysis; reported as exploratory |

The registry should keep both a scientific/scoring order and a `paper_order` field. The main and supplement should use Positive, Distressing, Perceptual when presenting the 3D hierarchy; any effect-size-ranked narrative is a view, not a second analysis order.

Current consistency note: the Methods and S3 hierarchy use Positive, Distressing, Perceptual, whereas the current main 3D Results paragraph orders the numerical results Perceptual, Positive, Distressing. The pipeline should emit the canonical hierarchy above. Any later manuscript reordering remains a submission-text change subject to the project's approval gate.

## 6. Reusable statistical bundles

### B01. Registered frequentist outcome bundle

Apply to all 39 non-PLV outcomes.

1. Condition descriptives: `n`, mean, and sample SD for control, symmetric, and asymmetric conditions.
2. Registered order-adjusted repeated-measures ANCOVA:
   - reduced model: `value ~ participant_id + block_position`
   - full model: `value ~ participant_id + block_position + condition`
   - compare models with a partial F test for the two condition degrees of freedom;
   - with a complete `N=39`, require `F(2,75)`;
   - report `F`, numerator and denominator df, raw `p`, family BH `q`, and partial eta squared;
   - compute partial eta squared as `SS_condition / (SS_condition + SS_error)`, equivalently `(F * df1) / (F * df1 + df2)`.
3. Planned contrast C1, pooled VR versus control:
   - participant score: `((symmetric + asymmetric) / 2) - control`;
   - two-sided one-sample/paired t test against zero;
   - report mean difference, 95% t CI, `t`, df, raw `p`, family BH `q`, paired `d_z`, and CLES when cited;
   - CLES is the proportion of positive participant differences plus half the ties.
4. Planned contrast C2, symmetric versus asymmetric:
   - participant score: `symmetric - asymmetric`;
   - report the same fields as C1.
5. Secondary robustness, generated by the same engine:
   - condition-only repeated-measures ANOVA;
   - Friedman three-condition test;
   - two Wilcoxon signed-rank versions of C1 and C2, including signed-rank statistic, `p`, and rank effect `r`;
   - Shapiro--Wilk diagnostics sufficient to support the documented use of distribution-free sensitivity checks.

The registered RM-ANCOVA is the omnibus estimand. The condition-only RM-ANOVA, Friedman, and Wilcoxon results are sensitivity checks and enter the paper only when they materially qualify the primary pattern.

### B02. Multiplicity rule

Apply BH correction separately by outcome family and test/contrast type:

- 11D-ASC: 11 outcomes;
- 3D-ASCr: 3 outcomes;
- Self: 3 outcomes;
- Tracer peak: 11 outcomes;
- Tracer AUC: 11 outcomes.

Decision hierarchy:

1. For preregistered omnibus tests and planned contrasts, report the raw `p` as the nominal registered result and the within-family `q` as multiplicity sensitivity. The planned contrasts remain the confirmatory interpretive anchor.
2. For exploratory or post hoc screens, `q < .05` governs the conclusion.
3. For the exploratory tracer families, `q < .05` governs the paper-facing conclusion even though their condition model mirrors the registered framework.
4. Never switch between `p` and `q` according to which is favorable. Report a material divergence explicitly.
5. Bayes factors are model comparisons and are not BH-adjusted.
6. PLV is a frozen standalone family and is not added to any new correction family.

### B03. Bayesian omnibus and planned-contrast bundle

Required for the 11 11D-ASC outcomes, three self outcomes, and three 3D-ASCr composites because these values are preregistered or already reported. Existing tracer Bayesian outputs may remain as OSF-only extensions but are not required for the paper and should not expand the supplement.

1. Omnibus comparison:
   - `H0: value ~ block_position + participant random intercept`;
   - `H1: value ~ condition + block_position + participant random intercept`;
   - BayesFactor priors: fixed `r=0.50`, continuous `r=sqrt(2)/4`, random nuisance `r=1.00`;
   - report `BF10`, reciprocal `BF01`, hypothesis labels, and prior metadata.
2. Planned paired Bayes factors for C1 and C2:
   - two-sided alternative with Cauchy `r=sqrt(2)/2`;
   - report mean difference, `BF10`, `BF01`, prior, and evidence direction;
   - retain posterior median standardized effect and 95% credible interval in OSF output;
   - retain prior-sensitivity output at `r=0.50`, `sqrt(2)/2`, and `1.00`.
3. Never substitute an omnibus BF for a contrast BF or label one as the other.

### B04. Registered joint ordered Bayes factor

Apply only to Experience of Unity, Blissful State, and Audio-Visual Synesthesia.

- Registered alternative: `symmetric > asymmetric > dark-screen control` after order adjustment.
- Fit the unrestricted condition model and order-only point-null model from B03.
- Draw at least 100,000 posterior samples per outcome from the unrestricted model in locked Linux x86-64.
- Reconstruct all three condition means/effects for each draw and count draws satisfying the strict joint order.
- Under an exchangeable unrestricted factor prior, validate rather than merely assume that the prior probability of a strict ordering is `1/6`.
- Calculate:
  - posterior order probability;
  - Monte Carlo SE of that probability;
  - `BF(ordered:unrestricted) = posterior_order_probability / prior_order_probability`;
  - `BF(ordered:null) = BF(unrestricted:null) * BF(ordered:unrestricted)`;
  - reciprocal `BF(null:ordered)`.
- Record seed, posterior draws, coefficient/mean reconstruction method, priors, formulas, and software versions.
- Supersede the two stepwise one-sided comparisons. Do not present them as the registered joint test.

### B05. Exploratory order and PLV-moderation bundle

The manuscript-facing scope is the 17 subjective outcomes in the 11D-ASC, 3D-ASCr, and self families. For each outcome, retain the existing four tests:

1. order main effect;
2. condition by order;
3. condition by PLV;
4. condition by order by PLV.

Apply BH separately across the 17 outcomes for each of the four test types. Tracer versions may remain in an internal expansion file but are not required to support the paper's current global-null statement and should not be mapped into the reviewer payload.

The PLV order main effect, PLV condition-by-order interaction, and linear session-position contrast are part of the frozen PLV module and must not be regenerated by this bundle.

### B06. Blinding bundle

Only the following tests and intervals are manuscript-facing:

1. Four two-sided Wilcoxon signed-rank tests against 0.25 for symmetry accuracy, neutral accuracy, sham accuracy, and all-12-item accuracy; BH correction across these four tests.
2. Counts and proportions of correct, incorrect, and uncertain post-unmasking guesses.
3. Standard single-group Bang index `(R-W)/(R+W+U)` with a deterministic participant-bootstrap 95% CI and the prespecified `[-0.2,0.2]` interpretation check.
4. Exploratory confidence-weighted directional index with its own deterministic participant-bootstrap 95% CI; do not apply standard Bang bands to this modified measure.
5. Point-biserial correlation between the 0--4 masked symmetry score and final-guess correctness (correct versus incorrect/uncertain), with an exact two-sided permutation `p` over all label allocations.

The extensive SDT, response-distribution, primacy-bias, and auxiliary t-test output currently produced by the primary script is not needed for a retained manuscript claim. It may remain as an explicitly unmapped development output, but it should not be presented as part of the parsimonious reviewer analysis.

### B07. Pictograph--ASC exploratory bundle

Use seed `262545`, 10,000 permutations, and 2,000 participant bootstraps unless a maintainer-approved precision increase is documented. All analyses use `N=39`.

1. Pooled-VR-minus-control change correlations:
   - three pictographs by three 3D-ASCr composites: 9 Spearman correlations;
   - three pictographs by eleven 11D-ASC subscales: 33;
   - three pictographs by 42 ASC items: 126;
   - two-sided permutation `p`, participant-bootstrap 95% CI, and BH `q` separately across the 9, 33, and 126 families.
2. Clustered within-person rank sensitivity:
   - 9 composite and 33 subscale associations;
   - rank within each participant's three conditions, pool the ranked observations, and permute condition alignment within participant;
   - BH separately across 9 and 33.
3. Positive Effects rank-partial follow-ups:
   - one result for each pictograph controlling the other two pictographs;
   - three two-sided rank-partial tests with BH across 3.
4. Symmetric-minus-asymmetric change correlations:
   - 9 composite and 33 subscale associations;
   - two-sided permutation `p` and BH separately across 9 and 33.
5. Participant-aware condition-interaction models:
   - for each of the 42 pictograph-target pairs, fit `y ~ participant + block_position + condition * x_within`;
   - use participant-clustered covariance;
   - record a joint 2-df interaction Wald test, pooled-VR-minus-control interaction contrast, and symmetric-minus-asymmetric interaction contrast;
   - apply BH separately within the 9 and 33 pair families and separately for each of the three interaction estimands.

Item-level within-person, symmetry-change, and interaction expansions are not reported and should not be added without a specific rationale. The current 126-item family is limited to the pooled change-score screen.

### B08. Descriptive-only derivations

The following require reproducible arithmetic or plotting inputs but no new inferential test:

- participant flow and sample descriptives;
- S3 driver rankings and arithmetic contribution summaries;
- descriptive cross-study ASC profile;
- tracer task/scoring documentation and tracer profile correspondence;
- manuscript/supplement referrals and reproducibility statements.

## 7. Main article chronology

The sequence below is the reporting order. Repeated references reuse the same computation key.

| Segment | Subsegment/outcome | Required computation | Multiplicity | Compute key | OSF action |
|---|---|---|---|---|---|
| M00 | Participants and design | Participant flow; included-sample age/gender/order descriptives; no inferential test | None | `DESIGN.FLOW` | Retain P01 outputs. |
| M01 | Statistical framework | Declare B01--B07, models, priors, decision hierarchy, and robustness roles | As in B02 | `METHODS.CONTRACT` | Validator must prove implementation matches prose. |
| M02 | Sample and exclusions | 47 screened; 8 PLV-screened exclusions; final 39 complete triads | None | `DESIGN.SAMPLE` | Retain frozen screening outputs. |
| M03 | Adherence/PLV | Existing PLV descriptives, two planned t contrasts, effect sizes/CIs, omnibus, two planned BFs | Frozen | `PLV.FROZEN` | No change. |
| M04.01 | Perceived body boundaries | B01 + B03 | Self family; raw `p`, `q` sensitivity | `SELF.PBBS` | Replace omnibus with registered F after adoption. |
| M04.02 | SFoRC | B01 + B03 | Self family | `SELF.SFORC` | Same. |
| M04.03 | Small Self | B01 + B03 | Self family | `SELF.SMALL` | Same. |
| M05 | Pictograph--ASC summary | No independent calculation; concise view of B07 correction-retained results | Exploratory `q` | `PICTO.SUMMARY` | Adopt B07; keep full numbers in S4. |
| M06.01 | Positive Effects | B01 + B03 | 3D family; raw `p`, `q` sensitivity | `ASC3.POSE` | Replace omnibus with registered F. |
| M06.02 | Distressing Effects | B01 + B03 | 3D family | `ASC3.DISE` | Replace omnibus with registered F; retain critical Bayesian wording. |
| M06.03 | Perceptual Effects | B01 + B03 | 3D family | `ASC3.PERE` | Replace omnibus with registered F. |
| M07 | 11D-ASC referral | No new test; points to S3 | None | `ASC11.REFERRAL` | Validate referral coverage. |
| M08.01 | Pre-unmasking accuracy | Four Wilcoxon tests from B06 | BH across 4; `q` governs | `BLIND.PRE` | Create compact machine-readable summary. |
| M08.02 | Standard Bang index | Index, counts, participant-bootstrap CI | Standalone | `BLIND.BBI` | Map exact cells. |
| M08.03 | Confidence-weighted index | Modified index and participant-bootstrap CI | Exploratory standalone | `BLIND.WEIGHTED` | Retain with limited emphasis. |
| M08.04 | Detection/guess association | Point-biserial `r`, exact two-sided permutation `p` | Exploratory standalone | `BLIND.ASSOC` | Existing one-row output is suitable. |
| M09.01 | Order and PLV moderation | B05 across 17 subjective outcomes | Four separate BH families of 17 | `EXPLORATORY.SUBJECTIVE` | Restrict reviewer mapping to reported scope. |
| M09.02 | PLV order diagnostics | Existing PLV order main effect, condition-by-order interaction, linear session-position contrast | Frozen | `PLV.ORDER.FROZEN` | No change. |

## 8. Supplement chronology

### S1--S2: deviations and frozen PLV

| Segment | Required computation | Action |
|---|---|---|
| S1 | No independent test. It must describe only departures that remain after OSF adoption. | Remove the omnibus departure only after registered outputs become canonical. |
| S2.01 | Frozen PLV calculation and analytic-signal documentation | No change. |
| S2.02 | Frozen pooled lower-tail IQR screening, quartiles, cutoff, condition flags, and eight participant exclusions | No change. |

### S3: complete 11D-ASC inventory

Every outcome block below receives the same B01 + B03 bundle. B05 supplies the order and condition-by-order diagnostics. B04 is added only where marked. Family correction is across all 11 outcomes for each frequentist test type, not within the three higher-order groupings.

| Segment | Outcome/content | Tests or derivation | Joint order BF? | Compute key |
|---|---|---|---:|---|
| S3.00 | Family orientation | No test; defines 11-outcome family and 3D grouping | No | `ASC11.ORIENTATION` |
| S3.01 | Positive driver table | Deterministic view of C1 mean difference, CI, `d_z`, raw `p`, and 11-outcome `q` for EU, CMP, DIS, SE, IS, BS | No | `ASC11.DRIVER.POS` |
| S3.02 | Experience of Unity | B01 + B03 + B05 | Yes | `ASC11.EU` |
| S3.03 | Changed Meaning of Percepts | B01 + B03 + B05 | No | `ASC11.CMP` |
| S3.04 | Disembodiment | B01 + B03 + B05 | No | `ASC11.DIS` |
| S3.05 | Spiritual Experience | B01 + B03 + B05 | No | `ASC11.SE` |
| S3.06 | Insightfulness | B01 + B03 + B05 | No | `ASC11.IS` |
| S3.07 | Blissful State | B01 + B03 + B05 | Yes | `ASC11.BS` |
| S3.08 | Distressing driver table | Deterministic C1 view for ICC and ANX | No | `ASC11.DRIVER.DISTRESS` |
| S3.09 | Impaired Control and Cognition | B01 + B03 + B05 | No | `ASC11.ICC` |
| S3.10 | Anxiety | B01 + B03 + B05 | No | `ASC11.ANX` |
| S3.11 | Perceptual driver table | Deterministic C1 view for AVS, EI, CI | No | `ASC11.DRIVER.PERCEPT` |
| S3.12 | Audio-Visual Synesthesia | B01 + B03 + B05 | Yes | `ASC11.AVS` |
| S3.13 | Elementary Imagery | B01 + B03 + B05 | No | `ASC11.EI` |
| S3.14 | Complex Imagery | B01 + B03 + B05 | No | `ASC11.CI` |
| S3.15 | Fine-grained contribution summary | Arithmetic decomposition and content-based interpretation only | No | `ASC11.CONTRIBUTION` |
| S3.16 | Cross-study context | Descriptive overlay only; no between-study inference or equivalence test | No | `ASC11.CROSSSTUDY` |

Each S3 outcome block draws, in this order, from: three descriptives; registered F and its `p/q/partial eta squared`; omnibus BF; pooled contrast `t/d_z/difference/CI/p/q` and BF; symmetry contrast with the same fields and BF; material robustness divergence if any; joint-order BF if registered; order and condition-by-order `p/q`; plain-language conclusion. The paper may omit non-material robustness numbers, but OSF must retain them.

### S4: pictographic self measures and ASC correspondence

| Segment | Required computation | Test count/family | Compute key |
|---|---|---:|---|
| S4.00 | Scoring direction, three contrasts, seed, permutation/bootstrap settings, model formula, and correction definitions | Contract only | `PICTO.METHODS` |
| S4.01 | Pooled-change composite screen; within-person composite sensitivity; three Positive rank-partial follow-ups | 9 + 9 + 3 | `PICTO.COMPOSITE` |
| S4.02 | Pooled-change subscale and item screens; within-person subscale sensitivity | 33 + 126 + 33 | `PICTO.FINE` |
| S4.03 | Symmetry-change composite/subscale screens and participant-aware interaction models | 9 + 33 correlations; 42 models with 3 tests each | `PICTO.SPECIFICITY` |
| S4.04 | Complete registered self-condition inventory | Reuse B01 + B03 for three self outcomes; no recomputation | `SELF.COMPLETE_VIEW` |

### S5: tracer analyses

| Segment | Required computation | Test count/family | Compute key |
|---|---|---:|---|
| S5.00 | Trace reconstruction, peak, AUC, inclusion, and reference checks | No inferential test | `TRACER.SCORING` |
| S5.01 | C1 and C2 paired t tests for 11 peak outcomes and 11 AUC outcomes, with differences, CIs, `d_z`, raw `p`, and `q` | 44 planned contrasts; BH separately by summary and contrast | `TRACER.CONTRASTS` |
| S5.01A | Registered order-adjusted RM-ANCOVA for 11 peak and 11 AUC outcomes, with `F(2,75)`, `p`, `q`, and partial eta squared | 22 omnibus tests; BH separately for peak and AUC | `TRACER.OMNIBUS` |
| S5.02 | Descriptive ASC/peak/AUC profile correspondence and limitations | No inferential pooled correlation | `TRACER.CORRESPONDENCE` |

Tracer Bayes factors, pooled repeated-observation ASC--tracer correlations, and peak-versus-AUC correlation-comparison tests are not required by the active paper. They may remain outside the reviewer scope but should not be used to enlarge S5 without a new approved claim.

### S6: reproducibility

S6 adds no statistical test. It must identify the final OSF commit, entry point, environments, canonical results, manuscript statistic map, and validation report.

## 9. Test-count reconciliation

These counts allow the maintainer to detect silent omissions or accidental expansions.

| Module | Expected manuscript-supporting scope |
|---|---:|
| Registered non-PLV omnibuses | 39 partial-F tests |
| Registered non-PLV planned contrasts | 78 paired t tests |
| Non-PLV robustness | 39 condition-only RM-ANOVAs, 39 Friedman tests, 78 Wilcoxon tests |
| Required non-PLV Bayesian omnibus/contrast results | 17 omnibuses + 34 planned contrasts = 51 BFs |
| Registered joint ordered Bayesian hypotheses | 3 joint BFs |
| Subjective order/PLV-moderation scope | 17 outcomes x 4 tests = 68 tests |
| Pre-unmasking chance tests | 4 Wilcoxon tests |
| Blinding association | 1 exact-permutation correlation test |
| Pictograph--ASC exploratory scope | 168 pooled-change + 42 within-person + 3 rank-partial + 42 symmetry-change + 126 interaction tests = 381 tests |

PLV tests and intervals are deliberately excluded from these implementation counts because that module is frozen. Descriptives, bootstrap intervals, driver rankings, and cross-study/tracer profiles are not counted as hypothesis tests.

## 10. Canonical output plan

### 10.1 Retain or revise existing outputs

1. `3.Results/2.PrimaryStatistics/04_primary_family_summary.csv`
   - retain one row for each of the 39 non-PLV outcomes;
   - replace manuscript-facing mixed-LRT columns with neutral registered fields such as `f_condition`, `df1_condition`, `df2_condition`, `p_condition`, `q_condition_bh`, and `partial_eta2_condition`;
   - retain descriptives, C1/C2 estimates, CIs, t tests, effect sizes, q values, and robustness fields;
   - legacy mixed-model comparisons may be saved in a separately labeled staging/comparison file, not in the canonical reviewer map.
2. `3.Results/4.BayesianStatistics/02_bayesian_omnibus_summary.csv`
   - retain required omnibus rows and the frozen PLV row;
   - manuscript map selects only used rows.
3. `03_bayesian_planned_contrasts.csv`, `04_bayesian_posterior_summary.csv`, and `05_bayesian_sensitivity_summary.csv`
   - retain; map only required manuscript outcomes.
4. Replace reviewer use of `06_bayesian_directional_summary.csv` with `06_bayesian_joint_order_summary.csv`, exactly three rows for EU, BS, and AVS.
5. Retain `02_exploratory_statistics_results.csv`, but reviewer scope should select the 17 subjective outcomes actually summarized in the article.
6. Retain `08_blinding_pre_post_guess_association.csv`.

### 10.2 Add compact machine-readable outputs

1. `3.Results/2.PrimaryStatistics/05_blinding_summary.csv`
   - long rows for four pre-unmasking tests, guess counts, standard BBI, and weighted index;
   - columns sufficient to map estimate, statistic, raw `p`, `q`, CI, `n`, bootstrap method/draws, and seed.
2. Adopt the internal pictograph output set under `3.Results/3.ExploratoryStatistics/` with stable names:
   - `09_pictograph_asc_change_score_screen.csv`
   - `10_pictograph_asc_within_person_sensitivity.csv`
   - `11_pictograph_asc_positive_rank_partial.csv`
   - `12_pictograph_asc_symmetry_change_screen.csv`
   - `13_pictograph_asc_condition_interactions.csv`
3. `2.AnalysisScripts/verification/manuscript_statistics_map.csv`
   - one row for every reported numeric statistic;
   - minimum columns: `statistic_id`, `segment_id`, `document`, `claim_label`, `output_path`, `row_selector`, `column_name`, `display_value`, `derivation`, `analysis_status`.

Human-readable text reports may remain, but they are not the sole authoritative source for a manuscript number.

## 11. Parsimony and exclusion rules

The following are not part of the required reviewer-facing pipeline:

- any 47-versus-39 inferential sensitivity analysis;
- any new PLV analysis or change to PLV screening;
- the two stepwise one-sided Bayesian contrasts as a substitute for the joint order hypothesis;
- tracer Bayes factors unless a retained claim cites them;
- pooled ASC--tracer correlations that ignore repeated observations;
- peak-versus-AUC correlation-comparison tests not cited by the paper;
- tracer order/moderation extensions not cited by the paper;
- itemwise blinding expansions, SDT tiers, response-distribution chi-square tests, or sham-primacy tests not cited by the paper;
- item-level pictograph within-person, symmetry-change, or interaction expansions;
- inferential cross-study comparisons or equivalence claims;
- separate code that recomputes the same statistic for a table, figure, and paragraph.

Existing extra outputs do not have to be deleted, but they must be labeled unmapped/optional and excluded from `reviewer_statistics_scope.csv` unless the manuscript actually uses them.

## 12. Mandatory validation contracts

The OSF validator should fail the replay if any of the following fail.

### Sample and data

- exactly 47 participant records are available for flow/screening;
- exactly 39 are included for inference;
- included participants match the locked ID set and contribute 117 participant-condition rows;
- no excluded participant enters any non-PLV analysis;
- every included participant has all three conditions and block positions 1--3 exactly once.

### Registry and scoring

- exactly 39 non-PLV registry rows: 3 self, 3 3D, 11 11D, 11 peak, 11 AUC;
- PLV is absent from the new registered engine;
- self letter recoding and construct-facing PBBS reversal are tested separately;
- 3D-ASCr scores match the scoring manifest;
- tracer peak/AUC recomputation matches the reference file;
- raw ASC item mapping contains all 42 items exactly once.

### Frequentist models

- every registered outcome has `n=39`, `df1=2`, and `df2=75`;
- full/reduced formulas and condition reference are recorded;
- an independent spot calculation reproduces partial F and partial eta squared;
- C1 and C2 signs match the manuscript definitions;
- BH groups contain exactly 11, 3, 3, 11, and 11 rows as applicable;
- nominal and FDR decisions are compared against the staging candidate before promotion;
- robustness outputs are labeled sensitivity, not alternative primary results.

### Bayesian models

- every BF records hypotheses, direction, priors, software version, and sample;
- omnibus and planned-contrast result identifiers cannot collide;
- joint-order posterior columns or reconstructed means pass a coefficient-mapping unit test;
- prior strict-order probability is verified under the implemented prior;
- posterior draws are at least 100,000 per joint hypothesis;
- posterior order probability, Monte Carlo SE, ordered/unrestricted BF, ordered/null BF, and reciprocal are finite or explicitly handled;
- repeated runs with documented seeds show Monte Carlo stability adequate for the reported interpretation.

### Exploratory and blinding analyses

- pictograph seed, permutation count, bootstrap count, input hashes, family sizes, and selected output rows are recorded;
- the existing manuscript spot checks in the internal candidate are reproduced;
- blinding BH contains exactly four chance tests;
- BBI resampling is participant-level and deterministic;
- exact permutation allocation count for the point-biserial test is recorded;
- exploratory q values are the quantities used for correction-retained conclusions.

### Manuscript mapping and replay

- every `t`, `F`, chi-square, `p`, `q`, BF, CI, effect size, mean, SD, `n`, and df in the paper maps to an output cell or declared deterministic derivation;
- no statistic is mapped to two incompatible estimands;
- no omnibus BF is mapped as a planned BF;
- every null-evidence phrase maps to a BF or suitably designed null/equivalence procedure, not only a nonsignificant `p`;
- reviewer replay regenerates all mapped outputs byte-identically or within explicitly declared deterministic numeric tolerances;
- `analysis_manifest.csv`, `reviewer_statistics_scope.csv`, package manifest, hashes, and final OSF commit are updated after promotion.

## 13. Current read-only OSF audit snapshot

This snapshot describes the files visible on 2026-08-23. The OSF working tree contains maintainer changes, so the maintainer should repeat these counts against the clean commit selected for adoption.

| Current OSF artifact | Observed shape | Audit verdict |
|---|---:|---|
| `04_primary_family_summary.csv` | 39 rows: 11 11D, 3 3D, 3 self, 11 peak, 11 AUC | Outcome coverage is complete, but the canonical omnibus is the mixed-effects LRT and the registered partial F is absent. Planned contrasts and robustness fields already provide the base for B01. |
| `02_friedman_robustness_summary.csv` | Existing nonparametric robustness table | Retain as sensitivity output; do not let it become a competing primary pipeline. |
| `02_bayesian_omnibus_summary.csv` | 40 rows, including frozen PLV | Omnibus coverage exists. Select only required manuscript rows in the statistic map. |
| `03_bayesian_planned_contrasts.csv` | 80 rows, two contrasts for each of 40 outcomes including PLV | Planned Bayesian coverage exists; tracer rows are optional OSF-only extensions. |
| `04_bayesian_posterior_summary.csv` and `05_bayesian_sensitivity_summary.csv` | 80 rows each | Retain for reproducibility; do not duplicate these values in the supplement unless needed. |
| `06_bayesian_directional_summary.csv` | 6 rows, two stepwise tests for each of EU, BS, and AVS | Does not implement the registered joint order. Supersede in reviewer scope with three joint-order rows. |
| `02_exploratory_statistics_results.csv` | 39 rows with four order/moderation tests | The manuscript-facing global statement needs only the 17 subjective outcomes; tracer rows are an unmapped extension. |
| `08_blinding_pre_post_guess_association.csv` | 1 row | Suitable canonical source for the reported point-biserial/exact-permutation result. |
| Primary human-readable report | Contains blinding indices and many auxiliary blinding analyses | Add a compact mapped CSV for the retained blinding statistics; leave auxiliary tests unmapped. |
| Pictograph--ASC canonical outputs | Absent | Adopt the five internal candidate outputs and their validation checks. |
| Manuscript-statistic map | Absent | Add before final numerical reconciliation. |
| `07_validate_analysis_contracts.py` | Existing partial contract suite | Extend with the sample, registry, model, Bayes, multiplicity, and mapping checks in Section 12. |

The only manuscript-facing analysis implementations absent from the OSF package are therefore the registered non-PLV RM-ANCOVA, the three joint ordered Bayes factors, and the complete S4 pictograph--ASC pipeline. The compact blinding table and manuscript-statistic map are missing output/validation layers, not new scientific analyses.

## 14. Maintainer adoption sequence

1. Freeze and record the starting OSF commit and current dirty-worktree state.
2. Stage the registered RM-ANCOVA implementation and compare all 39 non-PLV rows with the internal candidate.
3. Promote the registered model into P03 and regenerate the canonical primary-family output.
4. Run the joint-order candidate in locked Linux x86-64; validate coefficient mapping, prior order probability, draws, and Monte Carlo error.
5. Supersede the stepwise directional reviewer output with the three-row joint-order output.
6. Stage and adopt the pictograph--ASC implementation; reproduce all internal spot checks.
7. Add the compact machine-readable blinding summary and statistic map.
8. Expand P06 contracts and reviewer scope.
9. Run the complete reviewer replay from a clean disposable copy.
10. Reconcile the active manuscript and supplement against `manuscript_statistics_map.csv` segment by segment.
11. Update manifests, hashes, environment records, and the final authoritative commit.
12. Only after authoritative adoption, replace legacy mixed-model and stepwise values in the manuscript through the project's item-by-item approval process.

## 15. Definition of done

The OSF audit is complete only when:

- all rows in `OSF_PIPELINE_SEGMENT_CHECKLIST.csv` are marked present, frozen, or legitimately descriptive;
- the 39-outcome registered output and three joint-order BFs are canonical;
- the five pictograph output files are canonical;
- every manuscript statistic is mapped and replayed;
- PLV remains unchanged;
- no excluded participant appears in non-PLV inference;
- no unnecessary exploratory extension enters the reviewer scope;
- the final OSF commit is recorded in the paper's reproducibility section and this control plane.

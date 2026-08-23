# Full-paper statistical consistency and claim audit

Last audited: 2026-08-23

## Post-approval implementation update

Approved Items A1--A7 are implemented. The main article now reports all six
3D-ASCr planned-contrast Bayes factors, distinguishes the smaller Distressing
effect, states the selected multiplicity hierarchy, and defines
recruitment-naive. S3 now qualifies ICC using nominal evidence, FDR sensitivity,
and Bayesian uncertainty; the cross-study prose, six-profile caption, and final
Fincham citation agree; and the final Discussion and Conclusion no longer make
unsupported equivalence, tolerability, adverse-event, or practice-efficacy
claims. One separate Discussion-opening sentence still says that no adverse
events occurred across 47 tested participants. It was outside A7's exact approved
locations and remains pending as Item A8. The S3 Distressing summary also still
describes correction status without the material ICC nominal-versus-FDR
distinction and remains pending as Item A9. The RM-ANCOVA, joint-order Bayes,
compact self/tracer tables, and OSF source synchronization remain open as
described below.

## Executive verdict

The paper's broad result pattern is stable and mostly supported: VR is associated
with higher PLV, higher spatial frame-of-reference ratings, and higher Positive,
Distressing, and Perceptual 3D-ASCr scores than the dark-screen control; no
outcome provides reliable evidence of a symmetric-versus-asymmetric difference.
All non-PLV inferential analyses use the final included sample of 39.

The package is not yet statistically final. Five issues prevent that conclusion:

1. The non-PLV omnibus statistics still report the current mixed-effects
   likelihood-ratio pipeline instead of the registered order-adjusted RM-ANCOVA.
2. Supplementary S3 reports stepwise directional Bayes factors instead of the
   registered joint ordered Bayes factor for EU, BS, and AVS.
3. Complete registered condition/Bayesian results for the three self measures
   and registered omnibus condition tests for the tracer peak/AUC outcomes are
   not reported in the paper or supplement.
4. Supplementary S4 is numerically reproducible only through an internal
   candidate pipeline, not the OSF package.

The current main/supplement multiplicity hierarchy is also inconsistent. Main
text conclusions use nominal planned-contrast p values, whereas S3 prose usually
uses FDR-adjusted q values as the decision threshold for the same registered
contrasts. The selected final rule should be applied literally:

- nominal p values govern preregistered planned contrasts;
- FDR governs exploratory and post hoc screens;
- q values remain visible as sensitivity information for registered multi-outcome
  families;
- Bayesian evidence is interpreted independently of the frequentist threshold.

PLV is frozen. None of the required changes below alters PLV analysis, screening,
or reporting.

## Source and sample audit

- Authoritative repository commit inspected:
  `1368f4283e9186b551aecad6d626e17df9eeff0b`.
- The OSF working tree is dirty with maintainer changes and cannot yet be treated
  as a release commit.
- Final inferential sample: 39 complete within-participant triads.
- The 47 tested participants appear only in participant flow, PLV quality
  screening, and the separate safety statement. No 47-participant inferential
  comparison remains in the active manuscript or supplement.
- The safety claim that no adverse events occurred among all 47 participants has
  no identified statistical or procedural source in the active paper or OSF
  result outputs. It requires a source-locked safety record or removal.

## Chronological main-article audit

### M00: Participants and design

Reported: target 36, tested 47, excluded 8, analyzed 39, 6--7 per order, age and
gender descriptives.

Verdict: numerically supported. The participant paragraph correctly states that
prior VR, meditation, breathwork, and psychedelic experience were not assessed.
The later shorthand "naive participants" remains ambiguous and should be replaced
with or explicitly defined as recruitment-naive general-pool recruitment.

### M01: Statistical framework

Reported: current mixed-effects omnibus, paired t planned contrasts, robustness
tests, FDR, Bayesian omnibus and planned contrasts, ordered checks, blinding, and
exploratory models.

Verdict: structurally coherent but not final.

- The omnibus paragraph describes a deviation that the user has rejected as the
  final pipeline. Replace it only after OSF adoption of the registered RM-ANCOVA.
- The Bayesian paragraph accurately describes current omnibus and planned models,
  but its ordered-check sentence overpromises a registered joint test that has
  not yet been run.
- The multiplicity paragraph defines nominal planned contrasts as primary, but S3
  prose applies q values as primary. This is an internal decision-rule mismatch.
- The framework does not announce that complete self-condition statistics belong
  in S4 or that registered tracer omnibus tests belong in S5, because those
  inventories are currently absent.

### M02: Sample and exclusions

Reported: 47 screened, 8 excluded, N=39 final sample for all inference.

Verdict: correct and consistent with the user's final sample rule.

### M03: PLV adherence

Reported: three means/SDs; pooled-VR t, p, d-z, and CI; symmetry t, p, and d-z;
mixed omnibus chi-square and p; two planned-contrast Bayes factors.

Verdict: numerically source-locked and frozen. One wording issue remains in the
Bayes translation: the paragraph says the "difference was about 24.1 times more
likely," whereas a Bayes factor concerns the observed data under two models. The
intended statement is that the observed data were about 24.1 times more likely
under the difference model than under the no-difference model. Because the user
has frozen PLV, this audit records but does not reopen that sentence.

### M04: Self-related measures

Reported: full frequentist detail for SFoRC; pooled-VR t tests for body boundaries
and Small Self; pooled-VR planned Bayes factors for all three measures.

Verdict: the main narrative is appropriately parsimonious, but the registered
analysis family is incompletely reported across the paper.

Missing from main and supplement:

- condition descriptives for body boundaries and Small Self;
- registered omnibus statistics for all three self measures;
- omnibus Bayes factors for all three measures;
- symmetric-versus-asymmetric planned Bayes factors for all three measures;
- a compact complete condition-analysis table.

These belong in Supplementary S4, not in the main narrative. After OSF adoption,
the registered frequentist candidates are:

| Outcome | Registered candidate | Partial eta-squared | Interpretation |
|---|---:|---:|---|
| Perceived body boundaries | F(2,75)=0.30, p=.745 | .008 | No condition evidence; omnibus BF01=9.00 supports the null model. |
| Spatial frame of reference | F(2,75)=10.99, p<.001 | .227 | Clear condition effect; omnibus BF10=371.15. |
| Small Self | F(2,75)=1.32, p=.273 | .034 | No frequentist effect; omnibus BF01=4.43 provides moderate relative null evidence. |

### M05: Exploratory pictograph--ASC summary

Reported: qualitative main-text summary with full coefficients in S4.

Verdict: appropriate placement and caution. The complete S4 values were reproduced
by the new internal candidate pipeline. They are not yet OSF-source-locked.

Statistical caveat: the condition-interaction models use clustered asymptotic
Wald inference with 39 participant clusters. The only corrected omnibus
interaction is already treated as inconclusive because neither planned interaction
contrast survives correction. Retain that caution or use a small-sample/wild-
cluster procedure during OSF adoption; do not strengthen the claim.

### M06: 3D-ASCr altered-state results

Reported: all condition descriptives, three pooled contrasts, raw mean changes,
d-z, CLES, symmetry null summary, three current mixed omnibuses, and three omnibus
Bayes factors.

Verdict: frequentist values and omnibus Bayes factors map correctly to OSF. The
registered RM-ANCOVA candidates preserve the result order:

| Composite | Registered candidate | Partial eta-squared | Omnibus BF10 |
|---|---:|---:|---:|
| Perceptual Effects | F(2,75)=19.63, p<.001 | .344 | 121,809.78 |
| Positive Effects | F(2,75)=7.56, p=.001 | .168 | 30.49 |
| Distressing Effects | F(2,75)=4.64, p=.013 | .110 | 3.45 |

The main paragraph omits the available planned-contrast Bayesian results:

| Composite | Pooled VR vs control | Symmetric vs asymmetric |
|---|---:|---:|
| Perceptual Effects | BF10=1,178.41 | BF01=3.87 |
| Positive Effects | BF10=12.96 | BF01=5.07 |
| Distressing Effects | BF10=3.02 | BF01=5.66 |

These values sharpen the substantive interpretation. The pooled Perceptual model
is decisively favored, the pooled Positive model is clearly favored, and the
pooled Distressing model is only about three times better supported than its null
despite a statistically reliable but modest d-z=.41 frequentist effect. The
symmetry contrasts consistently favor the no-difference models by factors of
about 3.9--5.7.

The phrase "moderate effects for Positive and Distressing Effects" is too coarse:
Positive is moderate (d-z=.51), whereas Distressing is smaller/borderline
small-to-moderate (d-z=.41) and has only modest Bayes support.

### M07: 11D-ASC referral

Reported: S3 contains complete registered frequentist and Bayesian results,
including registered directional hypotheses.

Verdict: currently false in one respect. The registered joint ordered Bayes
factors are absent; S3 reports stepwise substitutes. The sentence becomes accurate
only after NP02 adoption. Do not relabel the stepwise tests as the joint test.

### M08: Blinding

Reported: four pre-unmasking accuracy summaries and q values; final-guess counts;
standard BBI and CI; exploratory confidence-weighted index and CI; point-biserial
association and exact p.

Verdict: source-locked and sufficiently complete. Item-wise blinding statistics
would add bulk without changing the registered blinding estimand and should not be
added unless a specific item claim is introduced. The paper correctly acknowledges
that the standard BBI interval fails the strict blinding-region criterion. The
abstract and Discussion should not shorten this to conclusive successful blinding.

### M09: Exploratory order and PLV moderation

Reported: global FDR-null summary; PLV order chi-square; condition-by-order
chi-square; linear position t and CI.

Verdict: source-locked. The phrase "indicating that block order did not change"
is categorically stronger than a nonsignificant interaction warrants. The safer
interpretation is no reliable evidence that the between-condition adherence
pattern changed with order. The user has frozen PLV, so this is recorded without
altering the block.

## Chronological supplement audit

### S1: Departures and analysis status

Verdict: accurate for the current pipeline but will become stale immediately after
registered RM-ANCOVA adoption. Remove the mixed-model deviation at the same time
as the numerical replacement. The descriptive treatment of ASC--tracer
correspondence is statistically appropriate and should remain.

### S2: PLV computation and screening

Verdict: complete, internally consistent, and frozen. It correctly limits all 47
participants to screening and fixes N=39 for all subsequent inference.

### S3: Complete 11D-ASC reporting

Verdict: complete for descriptives, current omnibus tests, planned contrasts,
omnibus/contrast Bayes factors, robustness summaries, and exploratory order
checks. It is incomplete for the registered omnibus model and joint ordered Bayes
factors.

Current-to-registered omnibus replacement map:

| Outcome | Current mixed result in S3 | Registered candidate | Candidate q |
|---|---:|---:|---:|
| Experience of Unity | chi-square(2)=16.07 | F(2,75)=8.58, p<.001 | .002 |
| Changed Meaning of Percepts | chi-square(2)=11.99 | F(2,75)=6.23, p=.003 | .009 |
| Disembodiment | chi-square(2)=9.96 | F(2,75)=5.11, p=.008 | .015 |
| Spiritual Experience | chi-square(2)=10.38 | F(2,75)=5.34, p=.007 | .015 |
| Insightfulness | chi-square(2)=3.33 | F(2,75)=1.64, p=.201 | .246 |
| Blissful State | chi-square(2)=1.23 | F(2,75)=0.60, p=.553 | .608 |
| Impaired Control and Cognition | chi-square(2)=6.45 | F(2,75)=3.23, p=.045 | .071 |
| Anxiety | chi-square(2)=5.35 | F(2,75)=2.66, p=.076 | .105 |
| Audio-Visual Synesthesia | chi-square(2)=35.71 | F(2,75)=21.77, p<.001 | <.001 |
| Elementary Imagery | chi-square(2)=26.50 | F(2,75)=15.17, p<.001 | <.001 |
| Complex Imagery | chi-square(2)=0.74 | F(2,75)=0.36, p=.700 | .700 |

Multiplicity issue: the ICC pooled planned contrast is nominally significant
(t(38)=2.15, p=.038, d-z=.34) but not FDR-robust (q=.060), and its planned BF10
is only 1.35. Under the selected hierarchy, the accurate conclusion is weak
nominal frequentist evidence that does not survive the family sensitivity check,
with Bayesian evidence that does not distinguish the models. Calling the effect
simply nonsignificant after FDR makes the unregistered correction the primary
decision rule and conflicts with main Methods.

The S3 directional sentences for EU, BS, and AVS describe the two available
pairwise tests. They must be removed and replaced with one joint ordered-model
result per outcome after NP02 adoption.

### S3 cross-study context

Verdict: the figure and text are out of sync. The current figure contains six
profiles: Viscereality plus Bahi, Fincham, Havenith, Kartar, and Uthaug. The prose
still lists four comparison studies, and the caption says five named datasets.
The figure itself and OSF data pipeline include Fincham. The supplement must name
all five comparison studies and describe six profiles/datasets total. The final
Fincham et al. article is now published in Frontiers in Psychology (2026, volume
17, article 1851882; DOI `10.3389/fpsyg.2026.1851882`), so the stale 2025
Research Square bibliography entry should be replaced when the text item is
approved.

### S4: Pictograph--ASC correspondence

Verdict: the numerical tables and prose were reproduced by NP03. All currently
reported correction-robust associations and mapping-specific null summaries match
the candidate output. Placement in the supplement is appropriate and avoids
overloading the main result.

The rank-partial follow-ups are secondary and use Pearson tests on residualized
ranks. They should remain in the supplement only. Their q values must not be
treated as stronger evidence than the preregistered condition effects.

The complete registered self-condition analysis is missing from this section.
Add one compact source-locked table after NP01 adoption rather than expanding the
main Results.

### S5: Temporal tracer analyses

Verdict: the 44 paired contrasts are complete and correctly use FDR as the
decision rule because the paper explicitly treats the tracer analyses as
exploratory. No symmetry contrast survives correction. The descriptive-only
correspondence wording is appropriately cautious.

Missing: the preregistration explicitly requires peak and AUC to use the same
order-adjusted RM-ANOVA approach as the primary outcomes. S5 does not report the
22 omnibus condition tests. After NP01 adoption, add a compact omnibus table or
two F/p/q columns to a supplementary table. The correction-robust omnibus pattern
is EU, EI, and AVS for both peak and AUC; DIS is nominal only for each.

The preregistration does not explicitly require Bayesian tracer analyses. The
large OSF tracer Bayes-factor inventory is therefore optional and should remain
in OSF to avoid unnecessary supplementary bloat.

### S6: Reproducibility

Verdict: not final. The GitHub final-commit and Zenodo identifiers remain
placeholders. The S4 pipeline, registered RM-ANCOVA, and joint-order Bayes test
must be adopted before the final commit can truthfully reproduce the paper.

## Claim-by-claim language audit

### Supported and appropriately qualified

- VR versus dark-screen PLV difference, with the accepted PLV caveats.
- SFoRC condition effect and null body-boundary/Small-Self condition evidence.
- Strong Perceptual, clear Positive, and smaller Distressing 3D-ASCr pattern.
- No reliable symmetric-versus-asymmetric outcome differences.
- Perceptual item-content overlap caveat.
- Descriptive-only cross-study context in the Abstract and S3 text.
- Inconclusive, rather than definitive, blinding interpretation in Results.
- Descriptive-only tracer profile convergence.
- Exploratory, noncausal interpretation of pictograph--ASC correspondence.

### Supported but overstated or internally inconsistent

1. "moderate effects for Positive and Distressing Effects": Distressing d-z=.41
   is smaller and has pooled BF10=3.02; call it modest or small-to-moderate.
2. "perceptual and positive effects outweighed mild distressing effects": this is
   a descriptive comparison of separately scored composites, not a direct test
   of differences among effect sizes.
3. "effective blinding": the point estimate is near zero, but the BBI interval is
   too wide to meet the prespecified region; retain the current uncertainty every
   time this is summarized.
4. ICC "did not remain significant after FDR": accurate as a sensitivity result,
   but inconsistent with the declared nominal-primary planned-contrast rule.
5. PLV order "did not change" wording: no reliable interaction evidence is not
   proof of no change.

### Unsupported or currently false

1. The claim that S3 reports the registered directional hypotheses is false until
   the joint ordered Bayes factors replace the pairwise substitutes.
2. "no adverse events across 47 participants" has no identified supporting
   result or safety-accounting source in the active package.
3. The supplement's cross-study prose/caption is false relative to the current
   six-profile figure because Fincham is omitted from the text.
4. "comparable in magnitude" and "less distress" in the unqualified final
   Discussion and Conclusion overstate a descriptive uncontrolled cross-study
   overlay. The Abstract already uses the correct caveat and should set the
   standard for the conclusion.
5. "supports guided breathing practice" extends a single-session adherence
   result into a practice-support claim. The directly supported statement is
   improved synchronization with the instructed rhythm during the study session.
6. "pleasant experiences" is broader than the Positive Effects composition,
   which the paper itself shows reflects unity, altered meaning, disembodiment,
   spirituality, bliss, and insight rather than general positive mood.

## Parsimony recommendations

- Keep the main narrative limited to PLV, three self outcomes with SFoRC detail,
  three 3D-ASCr composites, and blinding.
- Add the six 3D planned-contrast Bayes factors to the main 3D paragraph because
  they directly mirror the confirmatory contrasts and materially qualify the
  smaller Distressing result.
- Put the full three-self-measure condition/Bayesian inventory in one compact S4
  table.
- Put the 22 tracer omnibus tests in one compact S5 table; retain the 44 planned
  contrasts already present.
- Do not add item-wise blinding tables, every distribution-free statistic, every
  tracer Bayes factor, or every S4 sensitivity statistic to the paper. They add
  little to the registered claims and belong in OSF.
- Keep the cross-study comparison descriptive and supplementary. Remove
  equivalence-like language from the final main Discussion and Conclusion.
- Retain the current four functional Discussion subsections plus Conclusion; no
  additional result-by-result subheadings are needed.

## Required completion sequence

1. OSF maintainer adopts the registered non-PLV RM-ANCOVA.
2. Locked Linux x86-64 run/adoption of the three joint ordered Bayes factors.
3. OSF adoption of the pictograph--ASC pipeline.
4. Exact item-by-item approval of all submission-facing replacements and tables.
5. Apply the multiplicity hierarchy consistently.
6. Add compact self and tracer omnibus tables to the supplement and the six 3D
   planned Bayes factors to the main text.
7. Correct the stale cross-study prose/caption and unsupported/overstated claims.
8. Run automated manuscript-to-output reconciliation, compile both PDFs, inspect
   all statistical tables/figures, and record the final OSF commit.

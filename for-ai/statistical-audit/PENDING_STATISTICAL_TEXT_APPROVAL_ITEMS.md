# Pending exact statistical-text approval items

Prepared: 2026-08-23

Items A1--A7 were explicitly approved on 2026-08-23 and have been applied,
committed, pushed, compiled, and visually verified. Their implementation commits
are recorded below. Item A8 is a newly isolated, independently approvable safety
sentence that was outside A7's approved locations and therefore remains
unapplied. Items B1--B3 remain blocked by authoritative source adoption even
where their substance is already approved.

Implementation commits:

- A1: `e5d7e1e`
- A2: `31c7e67`
- A3: `7c5eef0`
- A4: `4332f91`
- A5: `a8d0ab0`
- A6: `59151a6`
- A7: `a915c32`

## Item A1: add all six 3D-ASCr planned-contrast Bayes factors

File and location: `main.tex`, Results, 3D-ASCr paragraph immediately before
Figure 6.

Current wording:

> No composite showed a symmetric-versus-asymmetric difference (all
> $p \ge .357$). Order-adjusted mixed-effects omnibus tests converged for all
> three composites (Perceptual Effects $\chi^2(2) = 32.83$, Positive Effects
> $\chi^2(2) = 14.32$, Distressing Effects $\chi^2(2) = 9.11$; all
> $p \le .011$). Bayesian omnibus comparisons favored condition models for all
> three composites, with the strongest evidence for Perceptual Effects
> ($\mathrm{BF}_{10} = 121{,}810$), followed by Positive Effects
> ($\mathrm{BF}_{10} = 30.49$) and Distressing Effects
> ($\mathrm{BF}_{10} = 3.45$; Figure~\ref{fig:results_asc3}).

Proposed replacement:

> No composite showed a symmetric-versus-asymmetric difference (all
> $p \ge .357$). Order-adjusted mixed-effects omnibus tests converged for all
> three composites (Perceptual Effects $\chi^2(2) = 32.83$, Positive Effects
> $\chi^2(2) = 14.32$, Distressing Effects $\chi^2(2) = 9.11$; all
> $p \le .011$). Bayesian omnibus comparisons favored condition models for
> Perceptual Effects ($\mathrm{BF}_{10}=121{,}810$), Positive Effects
> ($\mathrm{BF}_{10}=30.49$), and, more modestly, Distressing Effects
> ($\mathrm{BF}_{10}=3.45$). The planned Bayesian contrasts showed the same
> hierarchy. For pooled VR versus control, the observed data were approximately
> 1,178 times more likely under a difference model for Perceptual Effects
> ($\mathrm{BF}_{10}=1{,}178.41$), 13 times more likely for Positive Effects
> ($\mathrm{BF}_{10}=12.96$), and only 3 times more likely for Distressing
> Effects ($\mathrm{BF}_{10}=3.02$). For symmetric versus asymmetric VR, the
> observed data favored the no-difference models by factors of approximately
> 3.9, 5.1, and 5.7, respectively ($\mathrm{BF}_{01}=3.87$, 5.07, and 5.66;
> Figure~\ref{fig:results_asc3}). Thus, the Perceptual and Positive pooled-VR
> effects had clear relative support, whereas the smaller Distressing effect had
> only modest Bayesian support.

Rationale: these are the Bayesian counterparts of the primary planned contrasts
and directly implement the user's requested compact three-composite summary.

Consequence: adds six source-locked Bayes factors without adding lower-order
detail. It makes the small Distressing result appropriately cautious.

Risk/dependency: the current mixed omnibus sentence will still require B1 after
OSF RM-ANCOVA adoption.

Verification: map each BF to
`03_bayesian_planned_contrasts.csv`, compile, and inspect the affected page.

## Item A2: distinguish the smaller Distressing effect from the Positive effect

File and location: `main.tex`, Results, first 3D-ASCr paragraph.

Current wording:

> These corresponded to a large effect for Perceptual Effects and moderate
> effects for Positive and Distressing Effects, with 76.9\%, 69.2\%, and 76.9\%
> of participants, respectively, scoring higher in VR than in the dark-screen
> control.

Proposed replacement:

> These corresponded to a large effect for Perceptual Effects, a moderate effect
> for Positive Effects, and a smaller effect for Distressing Effects, with
> 76.9\%, 69.2\%, and 76.9\% of participants, respectively, scoring higher in VR
> than in the dark-screen control.

Rationale: $d_z=.41$ is smaller than $d_z=.51$ and has only
$\mathrm{BF}_{10}=3.02$ for the planned contrast.

Consequence: aligns frequentist magnitude language with the Bayesian evidence.

Risk/dependency: none.

Verification: confirm the three d-z values and BF hierarchy against OSF.

## Item A3: apply the selected multiplicity hierarchy in main Methods

File and location: `main.tex`, Preregistration and Reproducibility, Robustness and
multiplicity paragraph.

Current wording:

> Because Shapiro--Wilk checks indicated non-normality for several
> condition-level and difference-score distributions, Wilcoxon signed-rank tests
> and Friedman omnibus tests were added as distribution-free robustness checks.
> The preregistration did not specify a multiple-comparison correction strategy.
> We applied Benjamini--Hochberg false-discovery-rate (FDR) correction within each
> multi-test outcome family (11 ASC dimensions, 3 derived 3D-ASCr dimensions, 3
> self-related variables). Main-text confirmatory interpretations are anchored in
> the planned contrasts with uncorrected $p$ values. FDR-adjusted $q$ values and
> the full robustness-check output are reported in the OSF repository and are
> mentioned in the main text only when they materially qualify the confirmatory
> pattern.

Proposed replacement:

> Because Shapiro--Wilk checks indicated non-normality for several
> condition-level and difference-score distributions, we added Wilcoxon
> signed-rank and Friedman tests as secondary distribution-free checks. The
> preregistration did not specify a multiplicity procedure. Nominal $p$ values
> therefore govern the primary interpretation of the preregistered planned
> contrasts, with Benjamini--Hochberg $q$ values reported as sensitivity
> information within the 11D-ASC, 3D-ASCr, and self-related outcome families.
> FDR-adjusted $q$ values govern exploratory and post hoc screens. The OSF package
> contains the complete adjusted and distribution-free output; the paper reports
> material divergences from the primary planned-contrast interpretation.

Rationale: states one rule and prevents opportunistic switching between p and q.

Consequence: requires A4 and a final sentence-by-sentence multiplicity audit.

Risk/dependency: none for the rule itself; B1 changes the omnibus model later.

Verification: search every confirmatory/exploratory conclusion for consistent use
of p and q.

## Item A4: correct the ICC block under the selected multiplicity rule

File and location: `supplementary/main.tex`, S3, Impaired Control and Cognition.

Current wording:

> Mean ratings were $19.17$ ($SD=16.50$) in the dark-screen control, $24.17$
> ($SD=20.02$) in symmetric VR, and $25.12$ ($SD=18.97$) in asymmetric VR. The
> order-adjusted three-condition result, $\chi^2(2)=6.45$,
> $q_{\mathrm{FDR}}=.062$, and pooled-VR contrast, $t(38)=2.15$, $d_z=0.34$,
> $q_{\mathrm{FDR}}=.060$, did not remain significant after FDR correction.
> Bayesian evidence for these effects was correspondingly inconclusive
> ($\mathrm{BF}_{10}=1.10$ and $1.35$, respectively). Symmetric and asymmetric
> VR did not differ, $t(38)=-0.51$, $d_z=-0.08$,
> $q_{\mathrm{FDR}}=.766$, $\mathrm{BF}_{01}=5.14$. The Friedman check detected
> a distributional difference, but this secondary rank-based test did not assess
> the same mean-difference estimand or adjust for presentation order and therefore
> did not alter the primary FDR-qualified conclusion. Exploratory checks found
> neither an order effect ($q_{\mathrm{FDR}}=.682$) nor a condition-by-order
> interaction ($q_{\mathrm{FDR}}=.872$). Impaired Control and Cognition tended to
> be higher during VR, but the evidence did not survive correction across the 11
> dimensions and did not differ reliably between the mappings. There was no
> reliable evidence that it was influenced by the order in which participants
> underwent the three conditions.

Proposed replacement before B1 adoption:

> Mean ratings were $19.17$ ($SD=16.50$) in the dark-screen control, $24.17$
> ($SD=20.02$) in symmetric VR, and $25.12$ ($SD=18.97$) in asymmetric VR. The
> order-adjusted three-condition result was nominally significant,
> $\chi^2(2)=6.45$, $p=.040$, but did not survive the 11-dimension sensitivity
> correction ($q_{\mathrm{FDR}}=.062$). The preregistered pooled-VR contrast
> likewise provided weak nominal evidence, $t(38)=2.15$, $p=.038$, $d_z=0.34$,
> but not correction-robust evidence ($q_{\mathrm{FDR}}=.060$). The corresponding
> Bayes factors did not clearly distinguish the effect and null models
> ($\mathrm{BF}_{10}=1.10$ and $1.35$, respectively). Symmetric and asymmetric
> VR did not differ, $t(38)=-0.51$, $p=.615$, $d_z=-0.08$,
> $q_{\mathrm{FDR}}=.766$, $\mathrm{BF}_{01}=5.14$. The Friedman check detected
> a distributional difference, but this secondary rank-based test did not assess
> the same mean-difference estimand or adjust for presentation order. Exploratory
> checks found neither an FDR-retained order effect ($q_{\mathrm{FDR}}=.682$) nor
> a condition-by-order interaction ($q_{\mathrm{FDR}}=.872$). Impaired Control
> and Cognition was higher during pooled VR by a modest amount, but the frequentist
> evidence was weak and sensitive to family correction, and the Bayesian evidence
> was inconclusive. There was no reliable evidence that it was influenced by the
> order in which participants underwent the three conditions.

Rationale: distinguishes primary nominal evidence, FDR sensitivity, and Bayesian
uncertainty.

Consequence: removes the main/supplement decision-rule conflict.

Risk/dependency: B1 must replace the first omnibus sentence with the authoritative
registered F value after adoption; the candidate is F(2,75)=3.23, p=.045,
q=.071.

Verification: map p/q/BF values to source outputs, then rerun after B1.

## Item A5: define recruitment-naive terminology

File and location: `main.tex`, Participants, after the sentence explaining that
prior experience was not assessed.

Current wording:

> We did not systematically assess prior experience with virtual reality,
> meditation, breathwork, or psychedelics, so the sample should be understood as
> a general psychology participant-pool sample rather than as a formally screened
> novice cohort.

Proposed replacement:

> We did not systematically assess prior experience with virtual reality,
> meditation, breathwork, or psychedelics. We use recruitment-naive to mean that
> participants came from the general psychology participant pool through an
> advertisement for a VR breathing-biofeedback study rather than an altered-state
> or experience-seeking recruitment channel; it does not mean that prior
> experience was screened or absent.

Rationale: implements the user's intended meaning without claiming novice status.

Consequence: later uses of "naive participants" become defined rather than
unsupported shorthand.

Risk/dependency: none.

Verification: search every use of naive/novice for consistency.

## Item A6: correct stale cross-study prose and profile count

File and location: `supplementary/main.tex`, S3 Descriptive cross-study context.

Current wording:

> The pooled Viscereality VR profile was compared descriptively with four
> breathwork datasets: conscious connected breathing \citep{Bahi2023}, facilitated
> circular breathwork \citep{Havenith2025}, high-ventilation breathwork with music
> in an MRI/laboratory setting \citep{Kartar2025}, and Holotropic Breathwork
> \citep{uthaug2021experience}.

Proposed replacement:

> The pooled Viscereality VR profile was compared descriptively with five
> breathwork datasets: conscious connected breathing \citep{Bahi2023}, the
> 90-minute breathwork arm of Airways to Alteration \citep{fincham2026airways},
> facilitated circular breathwork \citep{Havenith2025}, high-ventilation
> breathwork with music in an MRI/laboratory setting \citep{Kartar2025}, and
> Holotropic Breathwork \citep{uthaug2021experience}.

Current caption opening:

> Descriptive cross-study comparison of altered-state profiles from five named
> datasets.

Proposed caption opening:

> Descriptive cross-study comparison of the present dataset with five named
> breathwork datasets.

Rationale: the current figure contains six profiles and includes Fincham.

Consequence: makes prose, caption, figure, and OSF source data agree.

The current bibliography entry is:

> @article{fincham2025airways,
>   title={Airways to Alteration (A2A): a randomised-controlled trial exploring effects of breathwork on conscious state},
>   author={Fincham, Guy W and Caddye, Edward and Kartar, Amy A and Lilley, Elizabeth A and Stoke, Nicola and Colasanti, Alessandro},
>   journal={Research Square},
>   year={2025},
>   doi={10.21203/rs.3.rs-7254002/v1}
> }

Proposed replacement:

> @article{fincham2026airways,
>   title={An exploratory study of breathwork-induced altered states of consciousness in experienced practitioners: the airways to alteration ({A2A}) trial},
>   author={Fincham, Guy W and Caddye, Edward and Kartar, Amy A and Lilley, Elizabeth A and Stoke, Nicola and Colasanti, Alessandro},
>   journal={Frontiers in Psychology},
>   volume={17},
>   pages={1851882},
>   year={2026},
>   doi={10.3389/fpsyg.2026.1851882}
> }

Also replace both current main-text uses of `fincham2025airways` with
`fincham2026airways` so the citation key is consistent throughout.

Risk/dependency: none. PubMed and the final journal record confirm the 2026
publication, volume 17, article 1851882, and DOI
`10.3389/fpsyg.2026.1851882`.

Verification: inspect the figure legend, bibliography, source data, all citation
uses, and compiled caption.

## Item A7: remove unsupported safety and equivalence-like conclusion claims

File and location: `main.tex`, final Discussion paragraph and Conclusion.

Current final-Discussion opening:

> The present study demonstrates that the particle system was conducive to
> pleasant experiences during box breathing, with positive and perceptual effects
> comparable to prolonged facilitator-supported breathwork \citep{Havenith2025}
> at lower distress and no adverse events. Because the system is self-administered
> and requires only 10 minutes, it could support breathing practice in settings
> where access to a facilitator is limited or time is scarce.

Proposed replacement:

> The present study found that the particle system was associated with higher
> Positive and Perceptual Effects during box breathing, alongside a smaller
> Distressing Effects increase. The cross-study profile provides descriptive
> context only and does not establish equivalence, superior tolerability, or
> clinical benefit. Because the system is self-administered and the session lasted
> 10 minutes, future studies could test whether it supports breathing practice in
> settings where access to a facilitator is limited or time is scarce.

Current Conclusion:

> This study demonstrates that Viscereality, a breath-responsive VR environment
> that maps lung volume onto a surrounding particle field, is conducive to
> positive experiential states and supports guided breathing practice during
> brief self-administered sessions with naive participants. In 10 minutes of box
> breathing, the system shifted spatial self-experience toward a more expanded
> frame of reference and produced an altered-state profile in which positive and
> perceptual effects were comparable in magnitude to those reported after
> prolonged facilitator-supported circular breathwork, while producing less
> distress and no adverse events across 47 participants.

Proposed replacement:

> During a brief self-administered box-breathing session, Viscereality was
> associated with closer synchronization to the instructed rhythm, a more
> spatially extended self-rating, and higher Positive, Perceptual, and smaller
> Distressing Effects than the dark-screen control. No measured outcome differed
> reliably between the symmetric and asymmetric VR mappings. These results come
> from a recruitment-naive university sample and do not establish equivalence to
> longer facilitator-supported breathwork or clinical efficacy.

Rationale: no active paper/OSF source was found for the adverse-event claim; the
cross-study comparison is descriptive and uncontrolled; and "supports practice"
extends beyond a single-session adherence measure.

Consequence: aligns the conclusion with the Abstract's existing cross-study
caveat and the actual within-study estimands.

Risk/dependency: if a source-locked safety record exists, a separate exact safety
statement can be proposed rather than removed.

Verification: confirm the Abstract, Discussion opening, final Discussion, and
Conclusion use the same claim strength.

## Item A8: remove the remaining unsupported Discussion-opening safety claim

Status: pending exact approval; not applied.

File and location: `main.tex`, opening paragraph of Discussion.

Current wording:

> Relative to audio-guided box breathing in the dark-screen control, the two VR
> conditions improved breathing adherence, shifted spatial self-experience toward
> a more expanded frame of reference, and produced an altered-state profile in
> which perceptual and positive effects outweighed mild distressing effects, with
> no adverse events across 47 tested participants.

Proposed replacement:

> Relative to audio-guided box breathing in the dark-screen control, the two VR
> conditions were associated with closer synchronization to the instructed
> rhythm, a more spatially extended self-rating, and higher Perceptual, Positive,
> and smaller Distressing Effects.

Rationale: A7 removed the same unsupported safety claim from the final Discussion
and Conclusion, but this separate Discussion-opening sentence was not included in
A7's exact approved locations. No source-locked safety-accounting record has been
identified. The replacement also avoids presenting the separately scored
composites as if their relative magnitudes were directly tested.

Consequence: makes the opening Discussion summary agree with the source-supported
Conclusion and removes the final active `N=47` outcome claim outside participant
flow and PLV screening.

Risk/dependency: if a source-locked adverse-event record exists, a separate exact
safety statement can be proposed instead of removing the claim.

Verification: search the active article and supplement for `adverse events`,
`outweighed`, and outcome claims based on 47 participants; compile and inspect the
Discussion page.

## Item A9: make the S3 Distressing summary follow the approved multiplicity rule

Status: pending exact approval; not applied.

File and location: `supplementary/main.tex`, S3.4, second paragraph.

Current wording:

> The smaller Distressing Effects increase was distributed across Impaired
> Control and Cognition and Anxiety, with Impaired Control and Cognition making
> the somewhat larger contribution. Their items assess experiences such as
> diminished personal agency, difficulty making decisions or sustaining a
> coherent thought, feelings of paralysis or isolation, unexplained fear,
> perceived threat, strangely altered surroundings, and anticipation that
> something harmful might occur. Both subscales were descriptively higher during
> VR, but neither remained significant after correction across the 11 dimensions,
> and their Bayesian results did not clearly distinguish effect from null models.
> The significant composite result is therefore best interpreted as the
> accumulation of two modest and compatible distress-related tendencies rather
> than as a pronounced or clearly localized adverse effect.

Proposed replacement:

> The smaller Distressing Effects increase was distributed across Impaired
> Control and Cognition and Anxiety, with Impaired Control and Cognition making
> the somewhat larger contribution. Their items assess experiences such as
> diminished personal agency, difficulty making decisions or sustaining a
> coherent thought, feelings of paralysis or isolation, unexplained fear,
> perceived threat, strangely altered surroundings, and anticipation that
> something harmful might occur. Impaired Control and Cognition provided weak
> nominal evidence for a pooled-VR increase, but this did not survive the
> 11-dimension sensitivity correction; Anxiety did not provide nominal evidence
> of a pooled-VR difference. The Bayesian results for both subscales did not
> clearly distinguish effect from null models. The significant composite result
> is therefore best interpreted as the accumulation of two modest and compatible
> distress-related tendencies rather than as a pronounced or clearly localized
> adverse effect.

Rationale: the approved hierarchy treats nominal $p$ as primary for the
preregistered planned contrast and $q$ as sensitivity information. The current
summary describes only the FDR result and therefore obscures the ICC distinction
now reported correctly in its detailed block ($p=.038$, $q=.060$,
$\mathrm{BF}_{10}=1.35$). Anxiety remains nominally inconclusive ($p=.063$).

Consequence: makes the S3 synthesis agree with the approved Methods rule and the
corrected ICC paragraph without strengthening the substantive distress claim.

Risk/dependency: none for the planned contrasts. The separate omnibus statistics
still require B1 after OSF RM-ANCOVA adoption.

Verification: compare the S3 driver table and both detailed blocks, compile, and
inspect the S3.4 page.

## Item B1: registered non-PLV RM-ANCOVA replacement

Status: approved interim placeholders are applied. The main and supplementary
Methods now describe the registered partial-$F$ implementation, and the two
main non-PLV omnibus locations plus all 11 S3 omnibus locations contain a
searchable OSF-source-lock placeholder. Final numerical replacement remains
blocked until the OSF maintainer adopts and regenerates authoritative values.
The replacement covers 39 non-PLV outcomes only. PLV remains unchanged.

Required verification: authoritative CSV/TXT outputs, replay, decision comparison,
manuscript-to-output mapping, compilation, and visual table review.

## Item B2: registered joint ordered Bayes factors

Status: application blocked. Run and adopt one joint
`symmetric > asymmetric > dark-screen control` Bayes factor for EU, BS, and AVS,
then replace the stepwise S3 sentences. Do not add another deviation disclosure or
present the current pairwise tests as the registered analysis.

Required verification: locked Linux x86-64 execution, coefficient mapping, prior
order probability, Monte Carlo error, canonical output, and replay.

## Item B3: compact self and tracer registered-statistics tables

Status: placement is recommended and source layouts are defined, but exact cells
cannot become submission-facing until B1 adoption.

- S4: one three-row self-measure table with three condition means/SDs, registered
  omnibus F/p/partial eta-squared, omnibus BF, pooled t/p/d-z/BF, and symmetry
  t/p/d-z/BF.
- S5: one 22-row peak/AUC omnibus table with F(2,75), p, partial eta-squared, and q.

Do not add optional tracer Bayes factors, item-wise blinding tables, or the full
distribution-free inventory to the supplement.

"""Internal candidate pipeline for the manuscript's pictograph--ASC analyses.

This analysis is reported in Supplementary Section S4 but is not yet part of the
authoritative OSF reproducibility package.  The script reads the authoritative
master and raw ASC files, uses only the final included N=39 sample, and writes
only below ``for-ai/statistical-audit/non-osf-results`` when ``--write`` is
supplied.  Its outputs are non-authoritative and require OSF maintainer adoption.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import platform
from pathlib import Path

import numpy as np
import pandas as pd
import scipy
import statsmodels
import statsmodels.formula.api as smf
from scipy import stats
from statsmodels.stats.multitest import multipletests


SEED = 262545
CONDITIONS = (
    "black_screen_control",
    "symmetric_coupling",
    "asymmetric_coupling",
)
ASC_CONDITION_MAP = {
    "Black-Screen-Control": "black_screen_control",
    "Symmetric Coupling": "symmetric_coupling",
    "Asymmetric Coupling": "asymmetric_coupling",
}
SCALE_BASES = {
    "Boundary dissolution": "boundary_dissolution",
    "Spatial frame of reference": "self_spatial_frame_of_reference_continuum",
    "Small self": "self_small_self_scale",
}
COMPOSITES = {
    "Positive Effects": "asc3_avg_POSE",
    "Distressing Effects": "asc3_avg_DISE",
    "Perceptual Effects": "asc3_avg_PERE",
}
SUBSCALES = {
    "Experience of Unity": "asc_avg_EU",
    "Spiritual Experience": "asc_avg_SE",
    "Blissful State": "asc_avg_BS",
    "Insightfulness": "asc_avg_IS",
    "Disembodiment": "asc_avg_DIS",
    "Impaired Control and Cognition": "asc_avg_ICC",
    "Anxiety": "asc_avg_ANX",
    "Complex Imagery": "asc_avg_CI",
    "Elementary Imagery": "asc_avg_EI",
    "Audio-Visual Synesthesia": "asc_avg_AVS",
    "Changed Meaning of Percepts": "asc_avg_CMP",
}
ITEM_MAP = {
    "EU": ["Q05", "Q15", "Q18", "Q19", "Q25"],
    "SE": ["Q02", "Q37", "Q42"],
    "BS": ["Q03", "Q39", "Q41"],
    "IS": ["Q24", "Q32", "Q35"],
    "DIS": ["Q09", "Q28", "Q29"],
    "ICC": ["Q01", "Q10", "Q16", "Q23", "Q30", "Q31", "Q36"],
    "ANX": ["Q13", "Q20", "Q21", "Q22", "Q27", "Q40"],
    "CI": ["Q17", "Q33", "Q38"],
    "EI": ["Q04", "Q07", "Q14"],
    "AVS": ["Q06", "Q08", "Q34"],
    "CMP": ["Q11", "Q12", "Q26"],
}
ITEM_TO_SUBSCALE = {item: dimension for dimension, items in ITEM_MAP.items() for item in items}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--package-root", type=Path, required=True)
    parser.add_argument("--permutations", type=int, default=10_000)
    parser.add_argument("--bootstraps", type=int, default=2_000)
    parser.add_argument("--write", action="store_true")
    return parser.parse_args()


def ordinal(value: object) -> float:
    if pd.isna(value):
        return np.nan
    text = str(value).strip()
    if not text:
        return np.nan
    if text[0].isalpha():
        return float(ord(text[0].upper()) - ord("A") + 1)
    return float(text)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def spearman(x: np.ndarray, y: np.ndarray) -> float:
    return float(stats.spearmanr(x, y).statistic)


def permutation_p(
    x: np.ndarray, y: np.ndarray, rng: np.random.Generator, draws: int
) -> float:
    xr = stats.rankdata(x, method="average")
    yr = stats.rankdata(y, method="average")
    xc = xr - xr.mean()
    yc = yr - yr.mean()
    denominator = np.linalg.norm(xc) * np.linalg.norm(yc)
    observed = abs(float(np.dot(xc, yc) / denominator))
    permutations = np.argsort(rng.random((draws, len(y))), axis=1)
    simulated = np.abs((yc[permutations] @ xc) / denominator)
    return (int(np.sum(simulated >= observed - 1e-15)) + 1) / (draws + 1)


def bootstrap_ci(
    x: np.ndarray, y: np.ndarray, rng: np.random.Generator, draws: int
) -> tuple[float, float]:
    values: list[float] = []
    for _ in range(draws):
        index = rng.integers(0, len(x), len(x))
        if np.unique(x[index]).size > 1 and np.unique(y[index]).size > 1:
            values.append(spearman(x[index], y[index]))
    return tuple(np.quantile(values, [0.025, 0.975]))


def within_rank(x: np.ndarray, y: np.ndarray) -> float:
    xr = np.vstack([stats.rankdata(row, method="average") for row in x])
    yr = np.vstack([stats.rankdata(row, method="average") for row in y])
    return float(np.corrcoef(xr.ravel(), yr.ravel())[0, 1])


def within_permutation_p(
    x: np.ndarray, y: np.ndarray, rng: np.random.Generator, draws: int
) -> float:
    xr = np.vstack([stats.rankdata(row, method="average") for row in x])
    yr = np.vstack([stats.rankdata(row, method="average") for row in y])
    xc = xr - xr.mean()
    yc = yr - yr.mean()
    denominator = np.linalg.norm(xc) * np.linalg.norm(yc)
    observed = abs(float(np.sum(xc * yc) / denominator))
    permutations = np.asarray(list(itertools.permutations(range(3))), dtype=int)
    simulated = np.empty(draws)
    for start in range(0, draws, 1_000):
        stop = min(start + 1_000, draws)
        choices = rng.integers(0, len(permutations), size=(stop - start, len(y)))
        permuted = np.take_along_axis(
            np.broadcast_to(yc, (stop - start, *yc.shape)),
            permutations[choices],
            axis=2,
        )
        simulated[start:stop] = np.abs(np.einsum("bij,ij->b", permuted, xc) / denominator)
    return (int(np.sum(simulated >= observed - 1e-15)) + 1) / (draws + 1)


def load_data(package_root: Path) -> tuple[pd.DataFrame, pd.DataFrame, Path, Path]:
    master_path = package_root / "3.Results" / "1.MasterDataset" / "01_master_analysis_dataset.csv"
    asc_path = package_root / "1.Data" / "2.ASCData" / "MASTER_11ASC.csv"
    if not master_path.is_file() or not asc_path.is_file():
        raise FileNotFoundError("Expected authoritative master and raw ASC inputs were not found")

    master = pd.read_csv(master_path)
    data = master[master["include_in_analyses"].astype(str).str.upper().eq("TRUE")].copy()
    if len(data) != 39:
        raise RuntimeError(f"Expected final included N=39, found {len(data)}")

    for condition in CONDITIONS:
        raw_boundary = f"self_perceived_body_boundaries_scale_{condition}"
        data[raw_boundary] = data[raw_boundary].map(ordinal)
        data[f"boundary_dissolution_{condition}"] = 8.0 - data[raw_boundary]
        for base in (
            "self_spatial_frame_of_reference_continuum",
            "self_small_self_scale",
        ):
            data[f"{base}_{condition}"] = data[f"{base}_{condition}"].map(ordinal)

    asc = pd.read_csv(asc_path)
    asc = asc[asc["ParticipantID"].isin(data["participant_id"])].copy()
    asc["condition"] = asc["ConditionLabel"].map(ASC_CONDITION_MAP)
    if len(asc) != 117 or asc["condition"].isna().any():
        raise RuntimeError("Expected 39 complete three-condition ASC records")
    return data, asc, master_path, asc_path


def matrix_from_master(data: pd.DataFrame, base: str) -> np.ndarray:
    return data[[f"{base}_{condition}" for condition in CONDITIONS]].to_numpy(float)


def matrix_from_raw(data: pd.DataFrame, asc: pd.DataFrame, item: str) -> np.ndarray:
    wide = asc.pivot(index="ParticipantID", columns="condition", values=item)
    return np.column_stack(
        [data["participant_id"].map(wide[condition]).to_numpy(float) for condition in CONDITIONS]
    )


def change_and_within_screens(
    data: pd.DataFrame,
    asc: pd.DataFrame,
    permutations: int,
    bootstraps: int,
) -> tuple[pd.DataFrame, pd.DataFrame]:
    # Keep the original temporary audit's operation order and seed so the
    # candidate output reproduces the already reported Monte Carlo values.
    rng = np.random.default_rng(SEED)

    def screen_family(
        family: str, targets: dict[str, str], source: str, include_within: bool
    ) -> tuple[pd.DataFrame, pd.DataFrame]:
        change_rows: list[dict[str, object]] = []
        within_rows: list[dict[str, object]] = []
        for scale_label, scale_base in SCALE_BASES.items():
            x = matrix_from_master(data, scale_base)
            x_delta = x[:, 1:].mean(axis=1) - x[:, 0]
            for target_label, target_base in targets.items():
                y = (
                    matrix_from_master(data, target_base)
                    if source == "master"
                    else matrix_from_raw(data, asc, target_base)
                )
                y_delta = y[:, 1:].mean(axis=1) - y[:, 0]
                rho = spearman(x_delta, y_delta)
                low, high = bootstrap_ci(x_delta, y_delta, rng, bootstraps)
                change_rows.append(
                    {
                        "family": family,
                        "scale": scale_label,
                        "target": target_label,
                        "n": len(data),
                        "rho": rho,
                        "ci95_low": low,
                        "ci95_high": high,
                        "permutation_p": permutation_p(x_delta, y_delta, rng, permutations),
                    }
                )
                if include_within:
                    within_rows.append(
                        {
                            "family": family,
                            "scale": scale_label,
                            "target": target_label,
                            "participants": len(data),
                            "observations": int(x.size),
                            "within_rank_r": within_rank(x, y),
                            "cluster_permutation_p": within_permutation_p(
                                x, y, rng, permutations
                            ),
                        }
                    )
        change = pd.DataFrame(change_rows)
        change["q_bh_family"] = multipletests(change["permutation_p"], method="fdr_bh")[1]
        within = pd.DataFrame(within_rows)
        if len(within):
            within["q_bh_family"] = multipletests(
                within["cluster_permutation_p"], method="fdr_bh"
            )[1]
        return change, within

    composite_change, composite_within = screen_family(
        "3D-ASCr composites", COMPOSITES, "master", True
    )
    subscale_change, subscale_within = screen_family(
        "11D-ASC subscales", SUBSCALES, "master", True
    )
    items = {f"{item} ({ITEM_TO_SUBSCALE[item]})": item for item in sorted(ITEM_TO_SUBSCALE)}
    item_change, _ = screen_family("11D-ASC items", items, "raw", False)
    return (
        pd.concat([composite_change, subscale_change, item_change], ignore_index=True),
        pd.concat([composite_within, subscale_within], ignore_index=True),
    )


def positive_rank_partial(data: pd.DataFrame) -> pd.DataFrame:
    def delta(base: str) -> np.ndarray:
        matrix = matrix_from_master(data, base)
        return matrix[:, 1:].mean(axis=1) - matrix[:, 0]

    predictors = pd.DataFrame(
        {
            label: delta(base)
            for label, base in SCALE_BASES.items()
        }
    )
    outcome = delta(COMPOSITES["Positive Effects"])
    ranked_x = predictors.rank(method="average").to_numpy(float)
    ranked_y = stats.rankdata(outcome, method="average")
    rows = []
    for index, label in enumerate(predictors.columns):
        controls = np.delete(ranked_x, index, axis=1)
        controls = np.column_stack([np.ones(len(controls)), controls])
        x_residual = ranked_x[:, index] - controls @ np.linalg.lstsq(
            controls, ranked_x[:, index], rcond=None
        )[0]
        y_residual = ranked_y - controls @ np.linalg.lstsq(
            controls, ranked_y, rcond=None
        )[0]
        coefficient, p_value = stats.pearsonr(x_residual, y_residual)
        rows.append(
            {
                "target": "Positive Effects",
                "scale": label,
                "n": len(data),
                "rank_partial_r": coefficient,
                "p_two_sided": p_value,
                "controls": "other two pictographs",
            }
        )
    result = pd.DataFrame(rows)
    result["q_bh_3"] = multipletests(result["p_two_sided"], method="fdr_bh")[1]
    return result


def symmetry_change_screen(data: pd.DataFrame, permutations: int) -> pd.DataFrame:
    rng = np.random.default_rng(SEED)
    rows: list[pd.DataFrame] = []
    for family, targets in (
        ("3D-ASCr composites", COMPOSITES),
        ("11D-ASC subscales", SUBSCALES),
    ):
        family_rows: list[dict[str, object]] = []
        for scale_label, scale_base in SCALE_BASES.items():
            x = matrix_from_master(data, scale_base)
            x_delta = x[:, 1] - x[:, 2]
            for target_label, target_base in targets.items():
                y = matrix_from_master(data, target_base)
                y_delta = y[:, 1] - y[:, 2]
                family_rows.append(
                    {
                        "family": family,
                        "scale": scale_label,
                        "target": target_label,
                        "n": len(data),
                        "rho_sym_minus_asym_changes": spearman(x_delta, y_delta),
                        "permutation_p": permutation_p(x_delta, y_delta, rng, permutations),
                    }
                )
        block = pd.DataFrame(family_rows)
        block["q_bh_family"] = multipletests(block["permutation_p"], method="fdr_bh")[1]
        rows.append(block)
    return pd.concat(rows, ignore_index=True)


def linear_contrast(
    result: object, weights: dict[str, float]
) -> tuple[float, float, float, float]:
    vector = np.zeros(len(result.params))
    for name, weight in weights.items():
        vector[result.params.index.get_loc(name)] = weight
    estimate = float(vector @ result.params)
    variance = float(vector @ result.cov_params() @ vector)
    standard_error = float(np.sqrt(max(variance, 0.0)))
    z_value = estimate / standard_error if standard_error else np.nan
    p_value = float(2 * stats.norm.sf(abs(z_value))) if np.isfinite(z_value) else np.nan
    return estimate, standard_error, z_value, p_value


def condition_interaction_screen(data: pd.DataFrame) -> pd.DataFrame:
    def analyze_family(family: str, targets: dict[str, str]) -> pd.DataFrame:
        rows: list[dict[str, object]] = []
        for scale_label, scale_base in SCALE_BASES.items():
            for target_label, target_base in targets.items():
                records: list[dict[str, object]] = []
                for _, participant in data.iterrows():
                    x_values = [
                        float(participant[f"{scale_base}_{condition}"])
                        for condition in CONDITIONS
                    ]
                    x_mean = float(np.mean(x_values))
                    for condition, x_value in zip(CONDITIONS, x_values):
                        records.append(
                            {
                                "participant": participant["participant_id"],
                                "condition": condition,
                                "order": participant[f"block_of_{condition}"],
                                "x_within": x_value - x_mean,
                                "x_raw": x_value,
                                "y": participant[f"{target_base}_{condition}"],
                            }
                        )
                long = pd.DataFrame(records)
                model = smf.ols(
                    "y ~ C(participant) + order + "
                    "C(condition, Treatment(reference='black_screen_control')) * x_within",
                    data=long,
                ).fit(
                    cov_type="cluster",
                    cov_kwds={"groups": long["participant"], "use_correction": True},
                )
                sym = (
                    "C(condition, Treatment(reference='black_screen_control'))"
                    "[T.symmetric_coupling]:x_within"
                )
                asym = (
                    "C(condition, Treatment(reference='black_screen_control'))"
                    "[T.asymmetric_coupling]:x_within"
                )
                pooled = linear_contrast(model, {sym: 0.5, asym: 0.5})
                symmetric_minus_asymmetric = linear_contrast(model, {sym: 1.0, asym: -1.0})
                restrictions = np.vstack(
                    [
                        np.eye(len(model.params))[model.params.index.get_loc(sym)],
                        np.eye(len(model.params))[model.params.index.get_loc(asym)],
                    ]
                )
                joint = model.wald_test(restrictions, scalar=True)
                rows.append(
                    {
                        "family": family,
                        "scale": scale_label,
                        "target": target_label,
                        "n_participants": len(data),
                        "interaction_joint_chi2": float(joint.statistic),
                        "interaction_joint_df": 2,
                        "interaction_joint_p": float(joint.pvalue),
                        "interaction_pooled_vr_minus_control_est": pooled[0],
                        "interaction_pooled_vr_minus_control_se": pooled[1],
                        "interaction_pooled_vr_minus_control_z": pooled[2],
                        "interaction_pooled_vr_minus_control_p": pooled[3],
                        "interaction_symmetric_minus_asymmetric_est": symmetric_minus_asymmetric[0],
                        "interaction_symmetric_minus_asymmetric_se": symmetric_minus_asymmetric[1],
                        "interaction_symmetric_minus_asymmetric_z": symmetric_minus_asymmetric[2],
                        "interaction_symmetric_minus_asymmetric_p": symmetric_minus_asymmetric[3],
                    }
                )
        result = pd.DataFrame(rows)
        for p_column, q_column in (
            ("interaction_joint_p", "interaction_joint_q_bh"),
            (
                "interaction_pooled_vr_minus_control_p",
                "interaction_pooled_vr_minus_control_q_bh",
            ),
            (
                "interaction_symmetric_minus_asymmetric_p",
                "interaction_symmetric_minus_asymmetric_q_bh",
            ),
        ):
            result[q_column] = multipletests(result[p_column], method="fdr_bh")[1]
        return result

    return pd.concat(
        [
            analyze_family("3D-ASCr composites", COMPOSITES),
            analyze_family("11D-ASC subscales", SUBSCALES),
        ],
        ignore_index=True,
    )


def validate_reported_values(
    change: pd.DataFrame,
    partial: pd.DataFrame,
    symmetry: pd.DataFrame,
    interaction: pd.DataFrame,
) -> list[str]:
    checks: list[tuple[str, float, float, float]] = []

    def value(frame: pd.DataFrame, column: str, **selectors: str) -> float:
        mask = np.ones(len(frame), dtype=bool)
        for selector, expected in selectors.items():
            mask &= frame[selector].eq(expected).to_numpy()
        rows = frame.loc[mask, column]
        if len(rows) != 1:
            raise RuntimeError(f"Expected one row for {selectors}, found {len(rows)}")
        return float(rows.iloc[0])

    checks.extend(
        [
            (
                "SFoRC--Positive rho",
                value(
                    change,
                    "rho",
                    family="3D-ASCr composites",
                    scale="Spatial frame of reference",
                    target="Positive Effects",
                ),
                0.70,
                0.006,
            ),
            (
                "Small self--Positive rho",
                value(
                    change,
                    "rho",
                    family="3D-ASCr composites",
                    scale="Small self",
                    target="Positive Effects",
                ),
                0.46,
                0.006,
            ),
            (
                "SFoRC partial Positive r",
                value(
                    partial,
                    "rank_partial_r",
                    scale="Spatial frame of reference",
                    target="Positive Effects",
                ),
                0.64,
                0.006,
            ),
            (
                "Small self partial Positive r",
                value(
                    partial,
                    "rank_partial_r",
                    scale="Small self",
                    target="Positive Effects",
                ),
                0.38,
                0.006,
            ),
            (
                "Composite symmetry minimum q",
                float(
                    symmetry.loc[
                        symmetry["family"].eq("3D-ASCr composites"), "q_bh_family"
                    ].min()
                ),
                0.142,
                0.002,
            ),
            (
                "Composite SFoRC joint interaction q",
                value(
                    interaction,
                    "interaction_joint_q_bh",
                    family="3D-ASCr composites",
                    scale="Spatial frame of reference",
                    target="Positive Effects",
                ),
                0.038,
                0.002,
            ),
        ]
    )
    messages = []
    for label, observed, expected, tolerance in checks:
        if abs(observed - expected) > tolerance:
            raise RuntimeError(
                f"Reported-value validation failed for {label}: {observed} versus {expected}"
            )
        messages.append(f"PASS {label}: {observed:.6g}")
    return messages


def main() -> None:
    args = parse_args()
    package_root = args.package_root.resolve()
    script_path = Path(__file__).resolve()
    for_ai_root = script_path.parents[1]
    output_dir = (
        for_ai_root
        / "statistical-audit"
        / "non-osf-results"
        / "pictograph-asc-correspondence"
    ).resolve()
    if package_root == output_dir or package_root in output_dir.parents:
        raise RuntimeError("Refusing to write candidate outputs inside the OSF package")
    if for_ai_root not in output_dir.parents:
        raise RuntimeError("Candidate output directory must remain below for-ai")

    data, asc, master_path, asc_path = load_data(package_root)
    change, within = change_and_within_screens(
        data, asc, args.permutations, args.bootstraps
    )
    partial = positive_rank_partial(data)
    symmetry = symmetry_change_screen(data, args.permutations)
    interaction = condition_interaction_screen(data)
    validations = validate_reported_values(change, partial, symmetry, interaction)

    summary_lines = [
        "Internal non-authoritative pictograph--ASC candidate",
        "Sample: final included N=39 only",
        f"Seed: {SEED}",
        f"Permutation draws: {args.permutations}",
        f"Bootstrap draws: {args.bootstraps}",
        f"Master SHA-256: {sha256(master_path)}",
        f"Raw ASC SHA-256: {sha256(asc_path)}",
        "",
        *validations,
        "",
        "Correction-robust pooled-VR composite/subscale results:",
        change.loc[
            change["family"].isin(["3D-ASCr composites", "11D-ASC subscales"])
            & change["q_bh_family"].lt(0.05),
            ["family", "scale", "target", "rho", "permutation_p", "q_bh_family"],
        ].sort_values(["family", "q_bh_family"]).to_string(index=False),
        "",
        "Item results surviving the 126-test correction:",
        change.loc[
            change["family"].eq("11D-ASC items") & change["q_bh_family"].lt(0.05),
            ["scale", "target", "rho", "permutation_p", "q_bh_family"],
        ].sort_values("q_bh_family").to_string(index=False),
    ]
    session_lines = [
        f"python={platform.python_version()}",
        f"platform={platform.platform()}",
        f"numpy={np.__version__}",
        f"pandas={pd.__version__}",
        f"scipy={scipy.__version__}",
        f"statsmodels={statsmodels.__version__}",
    ]

    if args.write:
        output_dir.mkdir(parents=True, exist_ok=True)
        change.to_csv(output_dir / "pictograph_asc_change_score_screen.csv", index=False)
        within.to_csv(output_dir / "pictograph_asc_within_person_sensitivity.csv", index=False)
        partial.to_csv(output_dir / "pictograph_asc_positive_rank_partial.csv", index=False)
        symmetry.to_csv(output_dir / "pictograph_asc_symmetry_change_screen.csv", index=False)
        interaction.to_csv(output_dir / "pictograph_asc_condition_interactions.csv", index=False)
        (output_dir / "summary.txt").write_text(
            "\n".join(summary_lines) + "\n", encoding="utf-8"
        )
        (output_dir / "python_session.txt").write_text(
            "\n".join(session_lines) + "\n", encoding="utf-8"
        )
        (output_dir / "ADOPTION_REQUIRED.txt").write_text(
            "These candidate outputs are internal and non-authoritative. The OSF "
            "maintainer must review, adopt, regenerate, validate, and commit the "
            "pipeline before the manuscript can cite the outputs as reproducible.\n",
            encoding="utf-8",
        )
    print("\n".join(summary_lines))


if __name__ == "__main__":
    main()

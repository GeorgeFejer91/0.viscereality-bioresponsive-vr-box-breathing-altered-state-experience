#!/usr/bin/env Rscript

# INTERNAL CANDIDATE ONLY. NOT AN AUTHORITATIVE ANALYSIS OUTPUT.
#
# This script implements two preregistered analyses that still need to be
# adopted, reviewed, and regenerated in the authoritative repository:
# https://github.com/GeorgeFejer91/0_OSF_reproducability_package
#
# It reads the authoritative master dataset but refuses to write anywhere
# inside the authoritative repository. Its outputs remain under for-ai/ and
# must not be cited in the manuscript or submitted as reproducibility output.

parse_args <- function(args) {
  out <- list(
    package_root = NA_character_,
    output_dir = NA_character_,
    iterations = 100000L,
    write = FALSE
  )
  i <- 1L
  while (i <= length(args)) {
    key <- args[[i]]
    if (key == "--write") {
      out$write <- TRUE
      i <- i + 1L
      next
    }
    if (i == length(args)) stop("Missing value after ", key)
    value <- args[[i + 1L]]
    if (key == "--package-root") out$package_root <- value
    else if (key == "--output-dir") out$output_dir <- value
    else if (key == "--iterations") out$iterations <- as.integer(value)
    else stop("Unknown argument: ", key)
    i <- i + 2L
  }
  out
}

script_arg <- grep("^--file=", commandArgs(trailingOnly = FALSE), value = TRUE)
if (!length(script_arg)) stop("Could not resolve this script's path.")
script_path <- normalizePath(sub("^--file=", "", script_arg[[1]]), winslash = "/", mustWork = TRUE)
manuscript_root <- normalizePath(file.path(dirname(script_path), "..", ".."), winslash = "/", mustWork = TRUE)

cfg <- parse_args(commandArgs(trailingOnly = TRUE))
if (is.na(cfg$package_root) || !nzchar(cfg$package_root)) {
  stop("Pass the authoritative repository with --package-root. No default path is assumed.")
}
package_root <- normalizePath(cfg$package_root, winslash = "/", mustWork = TRUE)
if (basename(package_root) != "0_OSF_reproducability_package") {
  stop("The package root must be the repository named 0_OSF_reproducability_package.")
}
if (is.na(cfg$output_dir) || !nzchar(cfg$output_dir)) {
  cfg$output_dir <- file.path(manuscript_root, "for-ai", "statistical-audit", "candidate-registered-results")
}
output_dir <- normalizePath(cfg$output_dir, winslash = "/", mustWork = FALSE)

path_is_within <- function(child, parent) {
  child_norm <- tolower(normalizePath(child, winslash = "/", mustWork = FALSE))
  parent_norm <- paste0(tolower(normalizePath(parent, winslash = "/", mustWork = TRUE)), "/")
  startsWith(paste0(child_norm, "/"), parent_norm)
}
if (path_is_within(output_dir, package_root)) {
  stop("Refusing to write candidate output inside the authoritative reproducibility repository.")
}
if (!path_is_within(output_dir, file.path(manuscript_root, "for-ai"))) {
  stop("Candidate output must remain inside this manuscript repository's for-ai directory.")
}
if (!is.finite(cfg$iterations) || cfg$iterations < 10000L) {
  stop("--iterations must be at least 10000 for the order-probability estimate.")
}

master_csv <- file.path(package_root, "3.Results", "1.MasterDataset", "01_master_analysis_dataset.csv")
if (!file.exists(master_csv)) stop("Missing authoritative master dataset: ", master_csv)

to_include <- function(x) {
  if (is.logical(x)) return(!is.na(x) & x)
  tolower(trimws(as.character(x))) %in% c("true", "t", "1", "yes", "y")
}

make_specs <- function() {
  rows <- list()
  add <- function(family, dv, label, prefix) {
    rows[[length(rows) + 1L]] <<- data.frame(
      family = family,
      dv = dv,
      outcome_label = label,
      control_col = paste0(prefix, "_black_screen_control"),
      symmetric_col = paste0(prefix, "_symmetric_coupling"),
      asymmetric_col = paste0(prefix, "_asymmetric_coupling"),
      stringsAsFactors = FALSE
    )
  }
  add("PLV", "PLV", "PLV", "plv")
  asc_dims <- c("EU", "SE", "BS", "IS", "DIS", "ICC", "ANX", "CI", "EI", "AVS", "CMP")
  asc_labels <- c(
    EU = "Experience of Unity", SE = "Spiritual Experience", BS = "Blissful State",
    IS = "Insightfulness", DIS = "Disembodiment", ICC = "Impaired Control and Cognition",
    ANX = "Anxiety", CI = "Complex Imagery", EI = "Elementary Imagery",
    AVS = "Audio-Visual Synesthesia", CMP = "Changed Meaning of Percepts"
  )
  for (dim in asc_dims) add("ASC", paste0("asc_avg_", dim), asc_labels[[dim]], paste0("asc_avg_", dim))
  asc3 <- c(POSE = "Positive Effects", DISE = "Distressing Effects", PERE = "Perceptual Effects")
  for (dim in names(asc3)) add("ASC3", paste0("asc3_avg_", dim), asc3[[dim]], paste0("asc3_avg_", dim))
  self <- c(
    self_perceived_body_boundaries_scale = "Perceived body boundaries",
    self_spatial_frame_of_reference_continuum = "Spatial frame of reference",
    self_small_self_scale = "Small Self"
  )
  for (dv in names(self)) add("self", dv, self[[dv]], dv)
  for (dim in asc_dims) add("tracer_peak", paste0("tracer_peak_", dim), asc_labels[[dim]], paste0("tracer_peak_", dim))
  for (dim in asc_dims) add("tracer_auc", paste0("tracer_auc_", dim), asc_labels[[dim]], paste0("tracer_auc_", dim))
  do.call(rbind, rows)
}

letter_to_ordinal <- function(x) {
  text <- trimws(as.character(x))
  out <- suppressWarnings(as.numeric(text))
  unresolved <- which(!is.finite(out) & nzchar(text))
  if (length(unresolved)) {
    first <- toupper(substr(text[unresolved], 1L, 1L))
    valid <- first %in% LETTERS
    out[unresolved[valid]] <- match(first[valid], LETTERS)
  }
  out
}

make_long <- function(data, spec) {
  condition_info <- data.frame(
    condition = c("dark_screen_control", "symmetric_coupling", "asymmetric_coupling"),
    value_col = c(spec$control_col, spec$symmetric_col, spec$asymmetric_col),
    order_col = c(
      "block_of_black_screen_control",
      "block_of_symmetric_coupling",
      "block_of_asymmetric_coupling"
    ),
    stringsAsFactors = FALSE
  )
  missing_cols <- setdiff(c("participant_id", condition_info$value_col, condition_info$order_col), names(data))
  if (length(missing_cols)) stop("Missing columns for ", spec$dv, ": ", paste(missing_cols, collapse = ", "))
  parts <- lapply(seq_len(nrow(condition_info)), function(i) {
    data.frame(
      participant_id = data$participant_id,
      condition = condition_info$condition[[i]],
      block_position = suppressWarnings(as.numeric(data[[condition_info$order_col[[i]]]])),
      value = if (spec$family == "self") {
        letter_to_ordinal(data[[condition_info$value_col[[i]]]])
      } else {
        suppressWarnings(as.numeric(data[[condition_info$value_col[[i]]]]))
      },
      stringsAsFactors = FALSE
    )
  })
  out <- do.call(rbind, parts)
  out <- out[is.finite(out$value) & is.finite(out$block_position), , drop = FALSE]
  out$participant_id <- factor(out$participant_id)
  out$condition <- factor(
    out$condition,
    levels = c("dark_screen_control", "symmetric_coupling", "asymmetric_coupling")
  )
  out
}

run_registered_rm_ancova <- function(data, specs) {
  rows <- lapply(seq_len(nrow(specs)), function(i) {
    spec <- specs[i, ]
    d <- make_long(data, spec)
    participant_counts <- table(d$participant_id)
    complete_ids <- names(participant_counts[participant_counts == 3L])
    d <- d[as.character(d$participant_id) %in% complete_ids, , drop = FALSE]
    d$participant_id <- droplevels(d$participant_id)
    reduced <- stats::lm(value ~ participant_id + block_position, data = d)
    full <- stats::lm(value ~ participant_id + block_position + condition, data = d)
    comparison <- stats::anova(reduced, full)
    df_num <- comparison$Df[[2]]
    df_den <- stats::df.residual(full)
    f_value <- comparison$F[[2]]
    p_value <- comparison$`Pr(>F)`[[2]]
    partial_eta2 <- (f_value * df_num) / (f_value * df_num + df_den)
    data.frame(
      family = spec$family,
      dv = spec$dv,
      outcome_label = spec$outcome_label,
      n_complete = length(complete_ids),
      estimand = "partial F for condition adjusted for numeric block position with participant blocking",
      f_condition = f_value,
      df_num = df_num,
      df_den = df_den,
      p_condition = p_value,
      partial_eta2 = partial_eta2,
      stringsAsFactors = FALSE
    )
  })
  out <- do.call(rbind, rows)
  out$q_condition_bh <- ave(out$p_condition, out$family, FUN = function(p) stats::p.adjust(p, method = "BH"))
  out$q_condition_bh[out$family == "PLV"] <- out$p_condition[out$family == "PLV"]
  out
}

extract_bf_value <- function(x) {
  value <- BayesFactor::extractBF(x, onlybf = TRUE)
  as.numeric(value[[1]])
}

extract_condition_draws <- function(post, levels) {
  mat <- as.matrix(post)
  normalized_names <- gsub("[^a-z0-9]", "", tolower(colnames(mat)))
  selected <- integer(length(levels))
  for (i in seq_along(levels)) {
    target <- paste0("condition", gsub("[^a-z0-9]", "", tolower(levels[[i]])))
    hits <- which(normalized_names == target)
    if (length(hits) != 1L) {
      stop(
        "Could not uniquely identify posterior condition coefficient for ", levels[[i]],
        ". Available posterior columns: ", paste(colnames(mat), collapse = ", ")
      )
    }
    selected[[i]] <- hits[[1]]
  }
  out <- mat[, selected, drop = FALSE]
  colnames(out) <- levels
  out
}

run_registered_joint_order_bf <- function(data, specs, iterations) {
  if (!requireNamespace("BayesFactor", quietly = TRUE)) {
    stop("The BayesFactor package is required for the joint ordered analysis.")
  }
  target_dvs <- c("asc_avg_EU", "asc_avg_BS", "asc_avg_AVS")
  prior_order_probability <- 1 / factorial(3)
  set.seed(20260823)
  rows <- lapply(target_dvs, function(dv) {
    spec <- specs[specs$dv == dv, , drop = FALSE]
    if (nrow(spec) != 1L) stop("Missing or duplicated outcome specification: ", dv)
    d <- make_long(data, spec)
    full_bf <- BayesFactor::lmBF(
      value ~ condition + block_position + participant_id,
      data = d,
      whichRandom = "participant_id",
      rscaleFixed = 0.50,
      rscaleRandom = 1.00,
      rscaleCont = sqrt(2) / 4,
      progress = FALSE
    )
    null_bf <- BayesFactor::lmBF(
      value ~ block_position + participant_id,
      data = d,
      whichRandom = "participant_id",
      rscaleFixed = 0.50,
      rscaleRandom = 1.00,
      rscaleCont = sqrt(2) / 4,
      progress = FALSE
    )
    unrestricted_vs_null <- extract_bf_value(full_bf / null_bf)
    post <- BayesFactor::posterior(full_bf, iterations = iterations, progress = FALSE)
    condition_draws <- extract_condition_draws(
      post,
      c("dark_screen_control", "symmetric_coupling", "asymmetric_coupling")
    )
    ordered <-
      condition_draws[, "symmetric_coupling"] > condition_draws[, "asymmetric_coupling"] &
      condition_draws[, "asymmetric_coupling"] > condition_draws[, "dark_screen_control"]
    posterior_order_probability <- mean(ordered)
    posterior_order_mcse <- sqrt(posterior_order_probability * (1 - posterior_order_probability) / length(ordered))
    ordered_vs_unrestricted <- posterior_order_probability / prior_order_probability
    ordered_vs_null <- unrestricted_vs_null * ordered_vs_unrestricted
    data.frame(
      family = "ASC",
      dv = dv,
      outcome_label = spec$outcome_label,
      n = length(unique(d$participant_id)),
      h0 = "equal condition means after block-position adjustment",
      h1 = "symmetric > asymmetric > dark-screen control after block-position adjustment",
      prior_order_probability = prior_order_probability,
      posterior_order_probability = posterior_order_probability,
      posterior_order_mcse = posterior_order_mcse,
      posterior_draws = length(ordered),
      bf_unrestricted_vs_null = unrestricted_vs_null,
      bf_ordered_vs_unrestricted = ordered_vs_unrestricted,
      bf_ordered_vs_null = ordered_vs_null,
      bf_null_vs_ordered = if (ordered_vs_null == 0) Inf else 1 / ordered_vs_null,
      method = "encompassing-prior BF: BF(ordered:null) = BF(unrestricted:null) * posterior_order_probability / (1/6)",
      stringsAsFactors = FALSE
    )
  })
  do.call(rbind, rows)
}

df_all <- utils::read.csv(master_csv, stringsAsFactors = FALSE, check.names = FALSE)
if (!("include_in_analyses" %in% names(df_all))) stop("Missing include_in_analyses column.")
df <- df_all[to_include(df_all$include_in_analyses), , drop = FALSE]
if (nrow(df) != 39L || length(unique(df$participant_id)) != 39L) {
  stop("The candidate pipeline requires the locked final included sample of N=39.")
}

specs <- make_specs()
rm_ancova <- run_registered_rm_ancova(df, specs)
joint_order_bf <- run_registered_joint_order_bf(df, specs, cfg$iterations)

cat("Candidate registered RM-ANCOVA rows:", nrow(rm_ancova), "\n")
print(rm_ancova[, c("family", "dv", "n_complete", "f_condition", "df_num", "df_den", "p_condition", "q_condition_bh")], row.names = FALSE)
cat("\nCandidate registered joint ordered Bayes factors:\n")
print(joint_order_bf[, c("dv", "posterior_order_probability", "bf_ordered_vs_null", "bf_null_vs_ordered")], row.names = FALSE)

if (!cfg$write) {
  cat("\nDry run only. Re-run with --write to save internal candidate outputs under for-ai/.\n")
  quit(status = 0)
}

dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)
utils::write.csv(rm_ancova, file.path(output_dir, "candidate_registered_rm_ancova.csv"), row.names = FALSE)
utils::write.csv(joint_order_bf, file.path(output_dir, "candidate_registered_joint_order_bf.csv"), row.names = FALSE)
writeLines(
  c(
    "INTERNAL CANDIDATE OUTPUT ONLY",
    "These files are not authoritative and must not be cited or submitted.",
    "The implementation must be adopted, reviewed, and regenerated in:",
    "https://github.com/GeorgeFejer91/0_OSF_reproducability_package",
    paste0("Authoritative input: ", master_csv),
    paste0("Input MD5: ", unname(tools::md5sum(master_csv))),
    paste0("Included N: ", nrow(df)),
    paste0("Posterior iterations per ordered test: ", cfg$iterations)
  ),
  file.path(output_dir, "ADOPTION_REQUIRED.txt"),
  useBytes = TRUE
)
capture.output(sessionInfo(), file = file.path(output_dir, "candidate_session_info.txt"))
cat("\nWrote internal candidate outputs to: ", output_dir, "\n", sep = "")

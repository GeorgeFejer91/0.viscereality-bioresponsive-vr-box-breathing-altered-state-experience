# Orchestration scripts

All project-specific helper and orchestration scripts must live in this directory.

Do not place scripts in the repository root or among submission-facing manuscript files.

## Script registry

### `new-submission-package.ps1`

Creates or previews a submission ZIP from the repository root while excluding internal AI controls, Git metadata, and LaTeX build artifacts.

Usage from the repository root:

```powershell
# Preview included files without writing an archive
.\for-ai\scripts\new-submission-package.ps1

# Create the archive after reviewing the manifest
.\for-ai\scripts\new-submission-package.ps1 -Create

# Choose a different output path
.\for-ai\scripts\new-submission-package.ps1 -Create -OutputPath .\viscereality-submission.zip
```

Every future script added here must be documented in this registry with its purpose, inputs, outputs, side effects, and example usage.

Scripts that change project files must default to a dry run when practical. A script must not change textual content unless every resulting text change was presented as a numbered recommendation and explicitly approved item by item. Approval for one item cannot be treated as approval for other script-generated changes.

No script may mutate `https://github.com/GeorgeFejer91/0_OSF_reproducability_package`, its original data, analysis pipelines, statistical outputs, figure-generation mechanisms, generated figures, or source-derived copies in this repository. Validation scripts must operate read-only or use isolated temporary copies and must never overwrite canonical artifacts.

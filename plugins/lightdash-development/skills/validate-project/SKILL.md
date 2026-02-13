# Validate Project

Skill for ensuring the health and consistency of the Lightdash semantic layer and visualization content using the Lightdash CLI.

## Purpose

Enables the "Validation Agent" to compare local YAML configurations against remote project content to identify broken charts or dashboards before changes are merged or deployed.

## Commands

- `lightdash validate`: Compares local state against the remote project to find validation errors.

## Behavior

1. **Local Context Validation**: Run `lightdash validate` to check if your local changes (e.g., renaming a field) will break any existing content in the production project.
2. **Selective Validation**: Use the `--select` or `-s` flag to limit validation to specific models or entities.
3. **Validation Modes**: By default, it checks the current project configured in your CLI. Ensure you are targeting the correct project using `lightdash config set-project`.

## References

- [Basics](./references/basics.md): Common validation flags and interpreting results.
- [CLI Reference](../../shared/references/cli.md): General CLI usage and environment setup.

## Rules

- ALWAYS run `lightdash validate` after renaming or deleting a field in your dbt models.
- If validation errors are found, identify the affected charts and dashboards and coordinate with stakeholders to fix them.
- Do NOT proceed with `lightdash deploy` if `lightdash validate` returns errors, unless they are acknowledged and a plan for fixing them is in place.

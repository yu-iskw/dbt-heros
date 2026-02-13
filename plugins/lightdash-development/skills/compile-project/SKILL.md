# Compile Project

Skill for performing local validation of dbt and Lightdash projects using the Lightdash CLI.

## Purpose

Enables the "Semantic Layer Developer" to verify that YAML configurations and dbt projects are syntactically and logically sound before attempting to deploy or preview changes.

## Commands

- `lightdash compile`: Performs a local check of dbt and Lightdash explores.

## Behavior

1. **Local Validation**: Run `lightdash compile` after any substantive change to dbt models or Lightdash YAML files.
2. **Selective Compilation**: Use the `--select` or `-s` flag to compile only the affected models and their dependencies to save time.
3. **Success Check**: A successful compilation ensures that:
   - The dbt project is valid.
   - All Lightdash-specific metadata (metrics, dimensions, joins) is correctly formatted.
   - SQL references within Lightdash metadata are valid.

## References

- [Basics](./references/basics.md): Common compilation flags and selection syntax.
- [CLI Reference](../../shared/references/cli.md): General CLI usage and environment setup.

## Rules

- ALWAYS run `lightdash compile` before `lightdash preview` or `lightdash deploy`.
- If compilation fails, do NOT proceed with deployment. Analyze the error logs and fix the YAML or dbt project issues first.

# Edit Preview

Skill for managing temporary Lightdash preview environments to test semantic layer changes in isolation.

## Purpose

Enables the "Semantic Layer Developer" to create safe, isolated environments for stakeholders to review changes and for automated validation before production deployment.

## Commands

- `lightdash preview`: Creates a temporary project with the current local state.
- `lightdash stop-preview`: Tiers down a specific preview environment.

## Behavior

1. **Environment Creation**: Run `lightdash preview` after local compilation is successful.
2. **Naming Convention**: ALWAYS use the `--name` flag to provide a descriptive name for the preview (e.g., `feature-revenue-calc`). This allows for consistent tracking and cleanup.
3. **Iterative Development**: Changes pushed to an existing preview name will update that environment.
4. **Cleanup**: Run `lightdash stop-preview` once testing is complete to free up resources and keep the workspace organized.

## References

- [Basics](./references/basics.md): Common preview flags and environment lifecycle management.
- [CLI Reference](../../shared/references/cli.md): General CLI usage and environment setup.

## Rules

- ALWAYS include the `--name` flag when creating or stopping a preview.
- Do NOT use preview environments for production workflows.
- Ensure that the `LIGHTDASH_API_KEY` and `LIGHTDASH_API_URL` are correctly set in the environment before running preview commands.

# Read Docs

Skill for inspecting dbt documentation, exposures, and doc blocks.

## Purpose

Enables inspection of project documentation including doc blocks in markdown files, exposure definitions, and resource descriptions in YAML property files.

## Behavior

1. **Doc Block Review**: Read `.md` files containing `{% docs %}` blocks for reusable descriptions.
2. **Exposure Inspection**: Review exposure YAML to understand downstream consumers (dashboards, reports, ML models).
3. **Description Audit**: Check models, sources, and columns for missing or incomplete descriptions.
4. **Generated Docs**: Review `target/catalog.json` and `target/manifest.json` after `dbt docs generate`.

## Rules

- Use `read-docs` to understand existing documentation coverage before adding new docs.
- Check for existing doc blocks before creating duplicate descriptions.

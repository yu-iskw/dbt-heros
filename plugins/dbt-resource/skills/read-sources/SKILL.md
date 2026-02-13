# Read Sources

Skill for inspecting dbt source definitions and freshness configuration.

## Purpose

Enables inspection of source YAML files to understand which raw tables are declared, their freshness configuration, and how they are referenced by staging models.

## Behavior

1. **Source Inspection**: Read source YAML files (typically `src_*.yml` in `models/staging/`) to review declared tables, schemas, and databases.
2. **Freshness Review**: Check `loaded_at_field`, `warn_after`, and `error_after` thresholds.
3. **Usage Analysis**: Search for `{{ source('...', '...') }}` calls across models to understand which staging models consume each source.

## Rules

- Use `read-sources` to understand existing source declarations before proposing changes.
- Verify freshness configuration is appropriate for the data loading cadence.

# Read Seeds

Skill for inspecting dbt seed CSV files and their YAML configurations.

## Purpose

Enables inspection of seed data files in `seeds/` and their accompanying YAML property definitions to understand static lookup data available to the project.

## Behavior

1. **CSV Inspection**: Read seed CSV files to understand data content and structure.
2. **YAML Review**: Check seed property files for `column_types`, descriptions, and tests.
3. **Usage Analysis**: Search for `{{ ref('seed_name') }}` calls across models to understand seed consumers.

## Rules

- Use `read-seeds` to understand existing seed data before proposing changes.
- Verify `column_types` are explicitly defined to avoid type inference issues.

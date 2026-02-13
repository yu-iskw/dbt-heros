# Edit Seeds

Skill for creating and modifying dbt seed CSV files and their YAML configurations.

## Purpose

Enables the creation and management of static lookup data as version-controlled CSV files with proper type configuration.

## Behavior

1. **CSV Authoring**: Create properly formatted CSV files in `seeds/`.
2. **YAML Configuration**: Define `column_types`, descriptions, and tests for seed data.
3. **Reference Consultation**: ALWAYS check `references/basics.md` for syntax patterns.

## References

- [Basics](./references/basics.md): Seed CSV format, YAML configuration, and column types.
- [Naming Conventions](../../shared/references/naming-conventions.md): Seed naming standards.

## Rules

- Keep CSV files small (under 10 MB / tens of thousands of rows).
- ALWAYS define explicit `column_types` to avoid inference mismatches.
- Never use seeds for raw production data loads.
- Add tests and documentation just like models.
- Refer to `read-seeds` to verify existing seeds before modification.

# Edit Models

Skill for creating and modifying dbt model SQL files and their YAML property definitions.

## Purpose

Enables the creation and modification of dbt models, including SQL transformation logic, YAML property files (descriptions, columns, tests, configurations), and materialization settings.

## Behavior

1. **SQL Authoring**: Write `SELECT` statements using `ref()` and `source()` for dependencies.
2. **YAML Properties**: Define model descriptions, column descriptions, and generic tests in YAML.
3. **Configuration**: Set materialization, schema, tags, and other model-level configs.
4. **Reference Consultation**: ALWAYS check `references/basics.md` and `references/advanced.md` for syntax patterns.

## References

- [Basics](./references/basics.md): Model SQL structure, YAML properties, and materialization.
- [Advanced](./references/advanced.md): Incremental models, custom schemas, hooks, and contracts.
- [Project Structure](../../shared/references/project-structure.md): Directory layout and layering.
- [Naming Conventions](../../shared/references/naming-conventions.md): Model naming standards.
- [Jinja Patterns](../../shared/references/jinja-patterns.md): Common Jinja2 patterns.

## Rules

- ALWAYS use `ref()` for inter-model dependencies and `source()` for raw tables.
- Every model MUST have a YAML properties file with description and primary key tests.
- Follow naming conventions: `stg_`, `int_`, `dim_`, `fct_` prefixes.
- Refer to `read-models` to verify existing structure before modification.

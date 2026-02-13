# Edit Sources

Skill for creating and modifying dbt source definitions.

## Purpose

Enables the declaration and configuration of raw data sources, including schema definitions, freshness checks, and column-level documentation.

## Behavior

1. **Source Declaration**: Define sources in YAML with database, schema, and table details.
2. **Freshness Configuration**: Set `loaded_at_field` and freshness thresholds.
3. **Column Documentation**: Add descriptions and tests to source columns.
4. **Reference Consultation**: ALWAYS check `references/basics.md` and `references/advanced.md` for syntax patterns.

## References

- [Basics](./references/basics.md): Source YAML structure and freshness configuration.
- [Advanced](./references/advanced.md): Multi-schema sources, quoting, and external tables.
- [Naming Conventions](../../shared/references/naming-conventions.md): Source file naming standards.

## Rules

- ALWAYS place source definitions in `models/staging/` with `src_` prefix.
- Every source table MUST have a `description`.
- Configure `freshness` for all sources that have regular loading schedules.
- Refer to `read-sources` to verify existing declarations before modification.

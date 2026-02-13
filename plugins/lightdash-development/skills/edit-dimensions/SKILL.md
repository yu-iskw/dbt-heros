# Edit Dimensions

Skill for defining and modifying dimensions in the Lightdash semantic layer using dbt 1.10+ and Fusion standards.

## Purpose

Enables the creation and modification of attributes for grouping and filtering data in dbt YAML.

## Behavior

1. **Atomic Modeling**: Focus on defining dimensions within the `columns` configuration of dbt models.
2. **dbt 1.10+ Syntax**: Use the `config.meta.dimension` structure.
3. **Reference Consultation**: ALWAYS check `references/basics.md` and `references/advanced.md` for syntax patterns.

## References

- [Basics](./references/basics.md): Fundamental dimension types and configuration.
- [Advanced](./references/advanced.md): Time intervals, formatting, and custom SQL.
- [SQL Templating](../../shared/references/sql-variables.md): Using `${field}` and user attributes.

## Rules

- ALWAYS use dbt 1.10+ syntax.
- Document every dimension with a clear description.
- Refer to `read-dimensions` to verify existing fields before adding new ones.

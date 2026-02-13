# Edit Models

Skill for configuring dbt models as Lightdash tables/explores using dbt 1.10+ and Fusion standards.

## Purpose

Enables the configuration of entity-level metadata, joins, and explores in dbt YAML.

## Behavior

1. **Model Registration**: Documentation in dbt YAML is required for model visibility.
2. **dbt 1.10+ Configuration**: Use the `config.meta` block.
3. **Relationship Mapping**: Define `primary_key` and `joins` with correct relationships.
4. **Reference Consultation**: ALWAYS check `references/basics.md` and `references/advanced.md` for syntax patterns.

## References

- [Basics](./references/basics.md): Table labels, primary keys, and visibility.
- [Advanced](./references/advanced.md): Joins, relationships, and custom explores.
- [Best Practices](../../shared/references/best-practices.md): Wide, flat tables and materialization.
- [SQL Templating](../../shared/references/sql-variables.md): Using `${field}` and user attributes.

## Rules

- ALWAYS define a `primary_key` for every model.
- Prefer wide, flat tables (Wide Table Pattern).
- Refer to `read-models` to verify existing joins and structure before modification.

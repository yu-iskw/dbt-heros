# Edit Metrics

Skill for defining and modifying metrics in the Lightdash semantic layer using dbt 1.10+ and Fusion standards.

## Purpose

Enables the creation of aggregated calculations (sums, averages, etc.) in dbt YAML.

## Behavior

1. **Atomic Aggregation**: Define metrics either at the column level or the model level.
2. **dbt 1.10+ Syntax**: Use the `config.meta.metrics` structure.
3. **Reference Consultation**: ALWAYS check `references/basics.md` and `references/advanced.md` for syntax patterns.

## References

- [Basics](./references/basics.md): Common metric types and column-level definitions.
- [Advanced](./references/advanced.md): Model-level metrics, filters, and custom SQL.
- [SQL Templating](../../shared/references/sql-variables.md): Using `${field}` and user attributes.

## Rules

- ALWAYS use dbt 1.10+ syntax.
- Aggregate metrics must reference dimensions; non-aggregate metrics must reference metrics.
- Refer to `read-metrics` to verify existing calculations before adding new ones.

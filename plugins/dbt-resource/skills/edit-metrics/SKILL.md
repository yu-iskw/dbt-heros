# Edit Metrics

Skill for creating and modifying dbt metrics and semantic model definitions (MetricFlow / dbt Semantic Layer).

## Purpose

Enables the creation and configuration of semantic models (entities, dimensions, measures) and metrics that power the dbt Semantic Layer.

## Behavior

1. **Semantic Model Authoring**: Define entities, dimensions, and measures in YAML.
2. **Metric Definition**: Create simple, derived, ratio, and conversion metrics.
3. **Entity Mapping**: Configure join relationships via entity types.
4. **Reference Consultation**: ALWAYS check `references/basics.md` and `references/advanced.md` for syntax patterns.

## References

- [Basics](./references/basics.md): Semantic model structure, entities, dimensions, measures, and simple metrics.
- [Advanced](./references/advanced.md): Derived metrics, ratio metrics, filters, and time granularity.

## Rules

- Define semantic models in consistent order: entities, dimensions, measures.
- Every semantic model MUST have a `defaults.agg_time_dimension`.
- Use `ref()` for the `model` property.
- Refer to `read-metrics` to verify existing definitions before modification.

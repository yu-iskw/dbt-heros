# Read Metrics

Skill for inspecting dbt metrics and semantic model definitions (MetricFlow / dbt Semantic Layer).

## Purpose

Enables inspection of semantic model YAML to understand entities, dimensions, measures, and metric definitions that power the dbt Semantic Layer.

## Behavior

1. **Semantic Model Review**: Read YAML definitions to understand entities, dimensions, and measures.
2. **Metric Inspection**: Review metric types (simple, derived, ratio, conversion) and their configurations.
3. **Join Path Analysis**: Understand entity relationships and how metrics can be queried across models.

## Rules

- Use `read-metrics` to understand existing semantic models and metrics before proposing changes.
- Verify entity relationships and join paths before adding new metrics.

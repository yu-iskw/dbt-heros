# Semantic Layer Rules

1.  **Modern dbt Syntax**: ALWAYS use dbt 1.10+ and Fusion syntax. Metadata MUST be nested under `config.meta`.
    - **Dimensions**: `columns[].config.meta.dimension`
    - **Metrics**: `columns[].config.meta.metrics` or `models[].config.meta.metrics`
    - **Joins**: `models[].config.meta.joins`
2.  **Wide Table Pattern**: Prioritize wide, flat tables in the BI layer. Minimize complex joins at query time by pre-joining in dbt where possible.
3.  **Mandatory Primary Keys**: Every model exposed to Lightdash MUST have a `primary_key` defined in `config.meta`.
4.  **Relationship Documentation**: ALWAYS specify the `relationship` (e.g., `one-to-many`) for every join.
5.  **Description-First**: Every dimension and metric MUST have a clear, user-facing description.
6.  **Progressive Modeling**: Keep the semantic layer simple. Only expose fields that are valuable for end-user analysis.

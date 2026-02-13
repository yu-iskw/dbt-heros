# 7. Enrich Lightdash Development References

Date: 2026-02-13

## Status

Proposed

## Context

The `lightdash-development` plugin's reference files provide fundamental guidance but lack detailed documentation for advanced features such as row-level security, Liquid templating in URLs, complex join types, and dbt best practices specific to Lightdash. To improve the agent's effectiveness in building sophisticated semantic layers, these references need to be enriched with more comprehensive examples and technical details.

## Decision

We will enrich the `references/advanced.md` files across all skills in `plugins/lightdash-development` and introduce new specialized skills for CLI operations, project-wide configuration, and best practices.

Key areas of enrichment:

1. **Dimensions**: Include `urls` with Liquid templating, `colors`, `image` display, and `required_attributes`.
2. **Metrics**: Detail `filters` syntax, `show_underlying_values`, `groups`, and post-calculation metrics (`running_total`).
3. **Models/Joins**: Document `sql_filter` (RLS), `default_filters`, join `alias`, `always` joins, and `sql_from`.
4. **Parameters**: Expand on `type` system and `allow_custom_values`.
5. **Best Practices**: Add a `best-practices` skill covering Wide Table patterns and project structure.
6. **CLI & Config**: Add skills for `lightdash-cli` and `lightdash-config-yml`.

## Consequences

- **Positive**:
  - Higher quality semantic layer generation by agents.
  - Improved agent autonomy in handling complex requirements like RLS or custom visualizations.
  - Alignment with latest Lightdash features (dbt 1.10+).
- **Negative**:
  - More documentation to maintain within the plugin.

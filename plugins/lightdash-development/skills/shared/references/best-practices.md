# Semantic Layer Best Practices

Optimization and organizational patterns for Lightdash.

## Wide, Flat Tables

Modern columnar warehouses (BigQuery, Snowflake) perform best with wide tables.

- **Fewer Joins**: Faster runtime queries.
- **Simpler UX**: Related fields grouped together in the UI.
- **Accurate Agents**: AI agents provide better answers with flattened context.

## Materialization

| Strategy      | Performance | Cost   | Recommendation                          |
| :------------ | :---------- | :----- | :-------------------------------------- |
| `table`       | High        | High   | For frequently queried models.          |
| `incremental` | High        | Medium | For large, append-only datasets.        |
| `view`        | Low         | Low    | For simple logic or infrequent queries. |

## File Organization

- **One file per model**: Maintain `model_name.yml` alongside `model_name.sql`.
- **Avoid shared schemas**: Large `schema.yml` files become difficult to navigate and maintain.

## Performance Tuning

- **Partitioning**: Always partition by date columns used in filters.
- **Clustering**: Cluster by frequently used `WHERE` or `GROUP BY` columns.

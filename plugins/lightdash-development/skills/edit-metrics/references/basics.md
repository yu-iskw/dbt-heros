# Metric Basics (dbt 1.10+)

Metrics describe or summarize features from a collection of data points (e.g., sum of revenue, count of users).

## Syntax (Column-Level)

Metrics are often defined under the dimension they aggregate.

```yaml
models:
  - name: orders
    columns:
      - name: revenue
        config:
          meta:
            metrics:
              total_revenue:
                type: sum
```

## Common Types

- `sum`: Sum values in a numeric column.
- `count`: Count rows.
- `count_distinct`: Count unique values.
- `average`: Mean value.
- `min` / `max`: Minimum or maximum value.

## Essential Properties

| Property      | Required | Description                                 |
| :------------ | :------- | :------------------------------------------ |
| `type`        | Yes      | Must be a supported metric type.            |
| `label`       | No       | Custom display name.                        |
| `format`      | No       | Spreadsheet-style formatting (e.g., `usd`). |
| `description` | No       | Description shown in the UI.                |

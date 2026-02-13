# Parameter Basics

Parameters allow users to interact with and customize queries without writing SQL.

## Definition (dbt 1.10+)

Model-level parameters are defined in `config.meta.parameters`.

```yaml
models:
  - name: orders
    config:
      meta:
        parameters:
          min_revenue:
            label: "Minimum Revenue"
            type: "number"
            default: 500
```

## Supported Types

- `string` (default)
- `number`
- `date`

## Usage in SQL

Reference parameters in dimension or metric SQL.

```yaml
dimensions:
  - name: is_high_value
    sql: "${TABLE}.revenue >= ${ld.parameters.min_revenue}"
```

# Advanced Metrics

Complex metric definitions including model-level metrics, filtering, and cross-metric calculations.

## Model-Level Metrics (dbt 1.10+)

Defined at the model level when referencing multiple columns or metrics.

```yaml
models:
  - name: orders
    config:
      meta:
        metrics:
          revenue_per_user:
            type: number
            sql: "${total_revenue} / ${unique_users}"
```

## Metric Categories

1. **Aggregate**: Reference dimensions only (e.g., `sum`, `average`).
2. **Non-aggregate**: Reference metrics only (e.g., `number`, `boolean`).
3. **Post-calculation**: Computed after query aggregation (e.g., `running_total`).

## Filters

Apply filters automatically to a metric. Filters are joined with `AND`.

```yaml
metrics:
  shipped_revenue:
    type: sum
    sql: "${TABLE}.amount"
    filters:
      - status: "shipped"
      - created_at: "inThePast 30 days"
```

### Available Filter Operators

| Operator       | Syntax Example              |
| :------------- | :-------------------------- |
| `is`           | `user_name: "katie"`        |
| `contains`     | `user_name: "%katie%"`      |
| `greater than` | `num_orders: "> 4"`         |
| `in the past`  | `date: "inThePast 14 days"` |
| `is null`      | `status: "null"`            |

## Show Underlying Values

Limit fields shown when clicking "View underlying data".

```yaml
# Model level default
config:
  meta:
    default_show_underlying_values:
      - orders.customer_id
      - total_revenue

# Metric level override
metrics:
  total_revenue:
    type: sum
    show_underlying_values:
      - customer_id
      - product_name
```

## Groups & Group Details

Organize metrics into folders in the UI.

```yaml
config:
  meta:
    group_details:
      finance:
        label: "Finance Metrics"
        description: "Revenue and cost metrics"

metrics:
  total_revenue:
    type: sum
    groups: ["finance"]
```

## Post-Calculation Metrics

Computed after aggregation (Window functions).

```yaml
metrics:
  running_total_revenue:
    type: running_total
    sql: "${total_revenue}"
  revenue_percent_of_total:
    type: percent_of_total
    sql: "${total_revenue}"
```

## Custom SQL

Aggregate metrics can use custom SQL referencing dimensions.

```yaml
metrics:
  active_user_count:
    type: count_distinct
    sql: "IF(${is_active}, ${user_id}, NULL)"
```

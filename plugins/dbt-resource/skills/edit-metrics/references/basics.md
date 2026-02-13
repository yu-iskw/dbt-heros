# Metrics Basics (dbt Semantic Layer / MetricFlow)

Semantic models and metrics provide a single source of truth for business metric calculations.

## Semantic Model Structure

```yaml
semantic_models:
  - name: orders
    defaults:
      agg_time_dimension: order_date
    model: ref('fct_orders')

    entities:
      - name: order_id
        type: primary
      - name: customer_id
        type: foreign

    dimensions:
      - name: order_date
        type: time
        type_params:
          time_granularity: day
      - name: status
        type: categorical

    measures:
      - name: order_total
        agg: sum
        expr: amount
      - name: order_count
        agg: count
        expr: order_id
```

## Entity Types

| Type | Description |
|:--|:--|
| `primary` | Unique identifier for the semantic model |
| `foreign` | Reference to another semantic model's primary entity |
| `unique` | Unique but not the primary grain |
| `natural` | Business key (may not be unique) |

## Dimension Types

| Type | Description |
|:--|:--|
| `categorical` | Discrete values for grouping/filtering |
| `time` | Temporal values with granularity support |

## Measure Aggregations

| Aggregation | Description |
|:--|:--|
| `sum` | Sum of values |
| `count` | Count of rows |
| `count_distinct` | Count of unique values |
| `average` | Mean value |
| `min` / `max` | Minimum / maximum value |
| `median` | Median value |
| `percentile` | Percentile value |
| `sum_boolean` | Count of true values |

## Simple Metric

```yaml
metrics:
  - name: total_revenue
    type: simple
    type_params:
      measure: order_total
```

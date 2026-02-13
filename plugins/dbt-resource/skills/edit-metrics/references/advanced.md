# Metrics Advanced Configuration

## Derived Metrics

Calculate metrics from other metrics:

```yaml
metrics:
  - name: avg_order_value
    type: derived
    type_params:
      expr: total_revenue / order_count
      metrics:
        - name: total_revenue
        - name: order_count
```

## Ratio Metrics

```yaml
metrics:
  - name: conversion_rate
    type: ratio
    type_params:
      numerator:
        name: conversions
      denominator:
        name: visits
```

## Conversion Metrics

Track conversion funnels:

```yaml
metrics:
  - name: signup_to_purchase
    type: conversion
    type_params:
      base_measure: signups
      conversion_measure: purchases
      entity: user_id
      window: 7
      window_grain: day
```

## Metric Filters

Apply permanent filters to metrics:

```yaml
metrics:
  - name: us_revenue
    type: simple
    type_params:
      measure: order_total
    filter:
      - "{{ Dimension('order__country') }} = 'US'"
```

## Time Granularity

Configure available time granularities:

```yaml
dimensions:
  - name: order_date
    type: time
    type_params:
      time_granularity: day
      valid_granularities:
        - day
        - week
        - month
        - quarter
        - year
```

## Multiple Semantic Models per dbt Model

```yaml
semantic_models:
  - name: orders_by_customer
    model: ref('fct_orders')
    entities:
      - name: customer_id
        type: primary
    measures:
      - name: customer_order_count
        agg: count
        expr: order_id

  - name: orders_by_product
    model: ref('fct_orders')
    entities:
      - name: product_id
        type: primary
    measures:
      - name: product_revenue
        agg: sum
        expr: amount
```

## Measure Properties

```yaml
measures:
  - name: total_revenue
    agg: sum
    expr: amount
    description: "Total revenue from all orders."
    create_metric: true        # auto-create a simple metric
    non_additive_dimension:
      name: order_date
      window_choice: max       # for non-additive measures like balances
```

## Querying Metrics

```bash
# Via MetricFlow CLI
mf query --metrics total_revenue --group-by metric_time__month

# Via dbt Fusion
dbt sl query --metrics total_revenue --group-by metric_time__month
```

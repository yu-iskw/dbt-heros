# Test Advanced Configuration

## Custom Generic Tests

Reusable test macros in `tests/generic/` or `macros/`:

```sql
-- tests/generic/test_is_positive.sql
{% test is_positive(model, column_name) %}

select {{ column_name }}
from {{ model }}
where {{ column_name }} <= 0

{% endtest %}
```

Usage in YAML:

```yaml
columns:
  - name: amount
    data_tests:
      - is_positive
```

## Test Configuration

### Severity

```yaml
data_tests:
  - unique:
      config:
        severity: warn  # warn instead of error
```

### Error Threshold

```yaml
data_tests:
  - unique:
      config:
        error_if: ">100"    # fail if more than 100 duplicates
        warn_if: ">10"      # warn if more than 10 duplicates
```

### Where Clause

Filter the data being tested:

```yaml
data_tests:
  - unique:
      config:
        where: "status != 'deleted'"
```

### Store Failures

Persist failing rows to the warehouse for debugging:

```yaml
data_tests:
  - unique:
      config:
        store_failures: true
        schema: test_failures
```

### Tags

```yaml
data_tests:
  - unique:
      config:
        tags: ['critical', 'primary-key']
```

## Test Selection

```bash
dbt test --select tag:critical         # by tag
dbt test --select "test_name:unique"   # by test name
dbt test --select stg_orders           # by model
dbt test --select source:jaffle_shop   # by source
```

## Unit Tests (dbt 1.8+)

Test model logic with fixed inputs and expected outputs:

```yaml
unit_tests:
  - name: test_order_total
    model: fct_orders
    given:
      - input: ref('stg_orders')
        rows:
          - {order_id: 1, amount: 100}
          - {order_id: 2, amount: 200}
    expect:
      rows:
        - {order_id: 1, amount: 100}
        - {order_id: 2, amount: 200}
```

## dbt Packages for Testing

- `dbt-utils`: `expression_is_true`, `not_constant`, `recency`, `at_least_one`, etc.
- `dbt-expectations`: Great Expectations-style tests (distribution, schema, volume).

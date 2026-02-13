# Test Basics

Tests are SQL queries that return failing rows. Zero rows = pass.

## Built-in Generic Tests

Declared in YAML property files under `data_tests`:

```yaml
models:
  - name: stg_orders
    columns:
      - name: order_id
        data_tests:
          - unique
          - not_null
      - name: status
        data_tests:
          - accepted_values:
              values: ['placed', 'shipped', 'completed', 'returned']
      - name: customer_id
        data_tests:
          - not_null
          - relationships:
              to: ref('stg_customers')
              field: customer_id
```

### Test Types

| Test | Purpose |
|:--|:--|
| `unique` | No duplicate values in column |
| `not_null` | No NULL values in column |
| `accepted_values` | Column values within allowed list |
| `relationships` | Foreign key referential integrity |

## Singular Tests

Custom SQL files in `tests/` directory:

```sql
-- tests/assert_positive_order_amounts.sql
select order_id, amount
from {{ ref('stg_orders') }}
where amount <= 0
```

## Running Tests

```bash
dbt test                              # all tests
dbt test --select stg_orders          # tests for one model
dbt test --select "test_type:singular" # singular tests only
dbt test --select "test_type:generic"  # generic tests only
```

## Test on Sources

```yaml
sources:
  - name: jaffle_shop
    tables:
      - name: orders
        columns:
          - name: id
            data_tests:
              - unique
              - not_null
```

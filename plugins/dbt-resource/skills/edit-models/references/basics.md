# Model Basics

dbt models are SQL `SELECT` statements that define data transformations.

## SQL File Structure

```sql
-- models/staging/stg_orders.sql
with source as (
    select * from {{ source('jaffle_shop', 'orders') }}
),

renamed as (
    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status,
        amount
    from source
)

select * from renamed
```

## YAML Properties

```yaml
# models/staging/_stg_jaffle_shop.yml
version: 2

models:
  - name: stg_orders
    description: "Staged orders from the raw jaffle_shop database."
    config:
      materialized: view
    columns:
      - name: order_id
        description: "Primary key for orders."
        data_tests:
          - unique
          - not_null
      - name: customer_id
        description: "Foreign key to stg_customers."
        data_tests:
          - not_null
          - relationships:
              to: ref('stg_customers')
              field: customer_id
      - name: status
        description: "Order status."
        data_tests:
          - accepted_values:
              values: ['placed', 'shipped', 'completed', 'returned']
```

## Materializations

| Strategy | Use Case | Command |
|:--|:--|:--|
| `view` | Staging models, lightweight transforms | `dbt run` |
| `table` | Mart models, frequently queried | `dbt run` |
| `incremental` | Large, append-heavy datasets | `dbt run` |
| `ephemeral` | Intermediate CTEs, no warehouse table | Compiled inline |

## Project-Level Config

```yaml
# dbt_project.yml
models:
  my_project:
    +materialized: view
    staging:
      +materialized: view
      +schema: staging
    marts:
      +materialized: table
      +schema: analytics
```

## Key Functions

- `{{ ref('model_name') }}`: Reference another model (creates DAG dependency).
- `{{ source('source_name', 'table_name') }}`: Reference a raw source table.
- `{{ config(materialized='table') }}`: Set model configuration inline.

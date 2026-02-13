# Model Advanced Configuration

## Incremental Models

Process only new or changed data instead of rebuilding the full table.

```sql
-- models/marts/fct_orders.sql
{{ config(
    materialized='incremental',
    unique_key='order_id',
    incremental_strategy='merge'
) }}

select
    order_id,
    customer_id,
    order_date,
    amount
from {{ ref('stg_orders') }}

{% if is_incremental() %}
where order_date > (select max(order_date) from {{ this }})
{% endif %}
```

### Incremental Strategies

| Strategy | Warehouse | Description |
|:--|:--|:--|
| `merge` | Snowflake, BigQuery | Upsert by `unique_key` |
| `delete+insert` | Redshift, Postgres | Delete matching rows, then insert |
| `insert_overwrite` | BigQuery, Spark | Replace entire partitions |
| `append` | All | Insert without deduplication |

## Custom Schema

```yaml
models:
  - name: fct_orders
    config:
      schema: analytics
      alias: orders_fact
      database: production_db
```

Override schema generation with a macro:

```sql
-- macros/generate_schema_name.sql
{% macro generate_schema_name(custom_schema_name, node) %}
    {% if custom_schema_name %}
        {{ custom_schema_name }}
    {% else %}
        {{ target.schema }}
    {% endif %}
{% endmacro %}
```

## Model Contracts (dbt 1.5+)

Enforce column names and data types at build time.

```yaml
models:
  - name: fct_orders
    config:
      contract:
        enforced: true
    columns:
      - name: order_id
        data_type: int
        constraints:
          - type: not_null
          - type: primary_key
      - name: amount
        data_type: numeric(10,2)
```

## Pre/Post Hooks

```yaml
models:
  - name: fct_orders
    config:
      pre_hook: "{{ log('Building fct_orders', info=True) }}"
      post_hook:
        - "GRANT SELECT ON {{ this }} TO ROLE analyst"
        - "ALTER TABLE {{ this }} SET TAG governance='pii'"
```

## Grants

```yaml
models:
  - name: fct_orders
    config:
      grants:
        select: ['analyst_role', 'bi_role']
```

## Tags

```yaml
models:
  - name: fct_orders
    config:
      tags: ['daily', 'finance']
```

Usage in selection: `dbt run --select tag:daily`.

## Meta

```yaml
models:
  - name: fct_orders
    config:
      meta:
        owner: "analytics-team"
        pii: false
```

## Persist Docs

Push descriptions from YAML into the warehouse catalog.

```yaml
models:
  - name: fct_orders
    config:
      persist_docs:
        relation: true
        columns: true
```

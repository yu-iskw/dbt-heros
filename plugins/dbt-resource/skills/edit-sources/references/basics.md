# Source Basics

Sources describe raw data tables loaded into the warehouse by external tools (Fivetran, Airbyte, etc.).

## YAML Structure

```yaml
# models/staging/src_jaffle_shop.yml
version: 2

sources:
  - name: jaffle_shop
    database: raw
    schema: jaffle_shop
    description: "Raw data from the Jaffle Shop application database."
    tables:
      - name: orders
        description: "Raw orders table."
        columns:
          - name: id
            description: "Primary key."
            data_tests:
              - unique
              - not_null
          - name: user_id
            description: "Foreign key to users table."
          - name: order_date
            description: "Date the order was placed."
          - name: status
            description: "Current order status."
      - name: customers
        description: "Raw customers table."
      - name: products
        description: "Raw products table."
```

## Freshness Configuration

```yaml
sources:
  - name: jaffle_shop
    loaded_at_field: _etl_loaded_at
    freshness:
      warn_after: {count: 12, period: hour}
      error_after: {count: 24, period: hour}
    tables:
      - name: orders
        freshness:
          warn_after: {count: 6, period: hour}
      - name: products
        freshness: null  # disable freshness for this table
```

### Freshness Properties

| Property | Description |
|:--|:--|
| `loaded_at_field` | Timestamp column used to determine data age |
| `warn_after` | Threshold for warning status |
| `error_after` | Threshold for error status |
| `filter` | SQL filter applied when querying freshness |

Run freshness: `dbt source freshness`

## Referencing Sources

```sql
-- models/staging/stg_orders.sql
select * from {{ source('jaffle_shop', 'orders') }}
```

## Key Properties

| Property | Required | Description |
|:--|:--|:--|
| `name` | Yes | Logical name for the source |
| `database` | No | Override target database |
| `schema` | No | Override target schema |
| `description` | No | Human-readable description |
| `tables` | Yes | List of source tables |
| `loaded_at_field` | No | Column for freshness checks |
| `freshness` | No | Freshness thresholds |
| `tags` | No | Tags for selection |

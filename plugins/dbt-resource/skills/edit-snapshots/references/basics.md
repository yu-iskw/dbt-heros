# Snapshot Basics

Snapshots implement SCD Type 2 to track how mutable rows change over time.

## SQL Format (Legacy)

```sql
-- snapshots/orders_snapshot.sql
{% snapshot orders_snapshot %}
{{ config(
    target_schema='snapshots',
    unique_key='order_id',
    strategy='timestamp',
    updated_at='updated_at',
) }}

select * from {{ source('jaffle_shop', 'orders') }}

{% endsnapshot %}
```

## Strategies

### Timestamp Strategy

Uses an `updated_at` column to detect changes:

```sql
{{ config(
    strategy='timestamp',
    updated_at='updated_at',
    unique_key='order_id'
) }}
```

### Check Strategy

Compares column values to detect changes:

```sql
{{ config(
    strategy='check',
    check_cols=['status', 'amount'],
    unique_key='order_id'
) }}
```

Use `check_cols='all'` to compare every column.

## Generated Metadata Columns

| Column | Description |
|:--|:--|
| `dbt_valid_from` | When this version became active |
| `dbt_valid_to` | When this version was superseded (null = current) |
| `dbt_scd_id` | Unique identifier for this version |
| `dbt_updated_at` | When dbt last processed this row |

## Key Properties

| Property | Required | Description |
|:--|:--|:--|
| `unique_key` | Yes | Column(s) identifying each record |
| `strategy` | Yes | `timestamp` or `check` |
| `updated_at` | For timestamp | Column with last-modified timestamp |
| `check_cols` | For check | Columns to compare for changes |
| `target_schema` | No | Schema for snapshot table |

## Commands

```bash
dbt snapshot                          # run all snapshots
dbt snapshot --select orders_snapshot # run specific snapshot
```

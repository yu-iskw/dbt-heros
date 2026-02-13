# Snapshot Advanced Configuration

## YAML Format (dbt v1.9+)

Modern YAML-based snapshot definition without SQL files:

```yaml
# snapshots/snapshots.yml
snapshots:
  - name: orders_snapshot
    relation: ref('stg_orders')
    config:
      schema: snapshots
      unique_key: order_id
      strategy: timestamp
      updated_at: updated_at
      hard_deletes: invalidate
      dbt_valid_to_current: "cast('9999-12-31' as date)"
```

## Hard Delete Handling (dbt v1.9+)

| Mode | Behavior |
|:--|:--|
| `ignore` (default) | Deleted source rows remain as current in snapshot |
| `invalidate` | Sets `dbt_valid_to` to current timestamp |
| `new_record` | Creates a new record with a `dbt_is_deleted` column |

```yaml
config:
  hard_deletes: new_record
```

## Custom Column Names

Rename the metadata columns:

```yaml
config:
  snapshot_meta_column_names:
    dbt_valid_from: valid_from
    dbt_valid_to: valid_to
    dbt_scd_id: scd_id
    dbt_updated_at: updated_at
```

## Valid-To Current Value

Set a sentinel value instead of null for current records:

```yaml
config:
  dbt_valid_to_current: "cast('9999-12-31' as date)"
```

## Composite Unique Keys

```yaml
config:
  unique_key:
    - order_id
    - line_item_id
```

## Snapshot Properties (YAML)

```yaml
# snapshots/snapshots.yml
version: 2

snapshots:
  - name: orders_snapshot
    description: "SCD Type 2 history of order changes."
    config:
      tags: ['daily', 'snapshot']
      meta:
        owner: "data-engineering"
    columns:
      - name: order_id
        description: "Source order identifier."
        data_tests:
          - not_null
```

## Best Practices

- Schedule snapshots between hourly and daily depending on source volatility.
- Always snapshot source/staging data, not mart models.
- Use a dedicated `snapshots` schema.
- Monitor snapshot table growth over time.
- Add `dbt_valid_to is null` filters in downstream models to get current records.

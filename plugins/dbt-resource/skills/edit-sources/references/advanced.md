# Source Advanced Configuration

## Multi-Schema Sources

When a single source system spans multiple schemas:

```yaml
sources:
  - name: shopify
    database: raw
    tables:
      - name: orders
        schema: shopify_us
      - name: orders_eu
        schema: shopify_eu
        identifier: orders  # actual table name differs from logical name
```

## Quoting

Force quoting for identifiers with special characters or case sensitivity:

```yaml
sources:
  - name: my_source
    quoting:
      database: true
      schema: true
      identifier: true
```

## Source Overrides in Packages

Override properties of sources defined in installed dbt packages:

```yaml
sources:
  - name: events
    overrides: snowplow  # package name
    database: raw
    schema: override_schema
```

## External Tables (dbt-external-tables)

For sources backed by external tables (S3, GCS):

```yaml
sources:
  - name: s3_data
    tables:
      - name: events
        external:
          location: "s3://my-bucket/events/"
          file_format: "parquet"
          partitions:
            - name: event_date
              data_type: date
```

## Tags and Meta

```yaml
sources:
  - name: jaffle_shop
    tags: ['raw', 'jaffle']
    meta:
      owner: "data-engineering"
      sla: "24h"
    tables:
      - name: orders
        tags: ['critical']
        meta:
          contains_pii: true
```

## Freshness Filter

Apply a SQL filter when checking freshness to avoid scanning the entire table:

```yaml
sources:
  - name: events
    loaded_at_field: event_timestamp
    freshness:
      warn_after: {count: 1, period: hour}
      error_after: {count: 6, period: hour}
      filter: "event_timestamp >= current_date - interval '7 days'"
```

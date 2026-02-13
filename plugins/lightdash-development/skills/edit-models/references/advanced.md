# Advanced Models

Advanced model configuration including joins, relationship management, and multiple explores.

## Joins (dbt 1.10+)

Connect tables for cross-table analysis.

```yaml
models:
  - name: orders
    config:
      meta:
        joins:
          - join: customers
            sql_on: "${orders.customer_id} = ${customers.customer_id}"
            relationship: many-to-one
            type: left # inner, left, right, full
            always: true # Always join even if no fields selected
```

## Join Aliases

Join the same table multiple times.

```yaml
meta:
  joins:
    - join: users
      alias: sender
      sql_on: "${messages.sent_by} = ${sender.user_id}"
    - join: users
      alias: recipient
      sql_on: "${messages.sent_to} = ${recipient.user_id}"
```

## Row-Level Security (SQL Filter)

Apply a permanent filter to the table.

```yaml
config:
  meta:
    sql_filter: "${TABLE}.sales_region = 'EMEA'"
```

### With User Attributes

```yaml
config:
  meta:
    sql_filter: "${TABLE}.sales_region IN (${ld.attributes.region})"
```

## Default Filters

Suggested filters that apply on load but can be removed/changed by users.

```yaml
config:
  meta:
    default_filters:
      - date: "inThePast 14 days"
        required: true # Cannot be removed if true
```

## SQL From

Override the default dbt relation name.

```yaml
config:
  meta:
    sql_from: "my_schema.my_special_view"
```

## Order Fields by Index

Sort fields in the UI by their order in the YAML file instead of alphabetically.

```yaml
config:
  meta:
    order_fields_by: "index"
```

## Relationships & Fanout Protection

Specifying `relationship` allows Lightdash to automatically handle deduplication (fanout protection).

- `one-to-many`
- `many-to-one`
- `one-to-one`
- `many-to-many`

## Explores

Create multiple curated versions of the same model.

```yaml
models:
  - name: deals
    config:
      meta:
        explores:
          deals_accounts:
            label: "Deals w/Accounts"
            joins:
              - join: accounts
                relationship: many-to-one
                sql_on: "${deals.account_id} = ${accounts.account_id}"
```

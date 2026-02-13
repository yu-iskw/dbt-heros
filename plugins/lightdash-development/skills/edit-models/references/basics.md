# Model Basics (dbt 1.10+)

Tables in Lightdash are built from dbt models documented in `schema.yml`.

## Syntax (dbt 1.10+)

```yaml
models:
  - name: users
    config:
      meta:
        label: "App Users"
        primary_key: user_id
```

## Primary Keys

Crucial for preventing fanned-out metrics in joins.

- **Single**: `primary_key: user_id`
- **Composite**: `primary_key: [order_id, line_item_id]`

## Visibility

Control which models appear in the Lightdash sidebar.

- **Hidden**: `hidden: true`
- **Grouped**: `group_label: "Marketing"`

# SQL Templating Reference

Variables available in `sql` tags within the semantic layer.

## Common Variables

- `${field_name}`: Reference a field in the current model.
- `${other_model.field_name}`: Reference a field in another model.
- `${TABLE}`: Reference the current table's SQL reference.

## User Attributes (Row-Level Security)

Access attributes assigned to the current user.

- `${lightdash.attributes.attr_name}`
- `${ld.attr.attr_name}` (Shorter alias)

## Intrinsic Attributes

- `${lightdash.user.email}`: Current user's email (requires verification).

## Examples

```sql
-- RLS with user attribute
sql_filter: "${TABLE}.region_id = ${ld.attr.user_region_id}"

-- Cross-model reference
metrics:
  order_ratio:
    sql: "${count_orders} / ${customers.total_customers}"
```

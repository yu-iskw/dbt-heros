# Advanced Parameters

Complex parameter configurations including multi-select, dynamic options, and project-wide parameters.

## Multi-Select

Allow users to select multiple values.

```yaml
parameters:
  region:
    label: "Regions"
    multiple: true
    default: ["US", "EU"]
```

## Options from Dimension

Populate parameter dropdown from an existing dimension.

```yaml
parameters:
  team:
    options_from_dimension:
      model: "employees"
      dimension: "team_name"
```

## Project-Level Parameters

Defined in `lightdash.config.yml`.

```yaml
parameters:
  global_currency:
    label: "Global Currency"
    options: ["USD", "GBP", "EUR"]
    default: "USD"
    allow_custom_values: true # Users can type values not in options
```

## Referencing Joined Parameters

Reference parameters from a joined model using `${ld.parameters.joined_model.param_name}`.

```yaml
joins:
  - join: customers
    sql_on: |
      ${orders.customer_id} = ${customers.customer_id}
      AND ${customers.status} = ${ld.parameters.customers.customer_status}
```

## SQL Type Conversion (Workaround)

Cast parameters to specific types in SQL.

```sql
WHERE ${TABLE}.is_active = ${ld.parameters.active_only}::boolean
```

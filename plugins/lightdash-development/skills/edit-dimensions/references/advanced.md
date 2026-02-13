# Advanced Dimensions

Advanced configuration for dimensions, including time intervals, formatting, and complex SQL.

## Time Intervals

Lightdash automatically creates intervals for `date` and `timestamp` fields.

```yaml
columns:
  - name: created_at
    config:
      meta:
        dimension:
          type: timestamp
          time_intervals: ["DAY", "WEEK", "MONTH", "YEAR"]
```

- **Default for `date`**: `['DAY', 'WEEK', 'MONTH', 'QUARTER', 'YEAR']`
- **Default for `timestamp`**: `['RAW', 'DAY', 'WEEK', 'MONTH', 'QUARTER', 'YEAR']`
- **Disable**: Set `time_intervals: OFF`.

## Formatting

Use spreadsheet-style format expressions (via [customformats.com](https://customformats.com)).

```yaml
config:
  meta:
    dimension:
      format: "$#,##0.00"
```

## Custom SQL

Apply SQL transformations to column values.

```yaml
config:
  meta:
    dimension:
      sql: "LOWER(${TABLE}.user_email)"
```

## URLs & Liquid Templating

Make dimension values clickable in the Lightdash UI.

```yaml
config:
  meta:
    dimension:
      urls:
        - label: "Search in Google"
          url: "https://google.com/search?q=${ value.formatted | url_encode }"
        - label: "Open in CRM"
          url: "https://mycrm.com/companies/${ row.company.company_id.raw | url_encode }"
```

- `${ value.formatted }`: Exact value as seen in the UI.
- `${ value.raw }`: Raw value from the database.
- `${ row.table.column.raw }`: Value from another column in the same row.

## Colors

Predefine colors for string-type dimensions for use in charts.

```yaml
config:
  meta:
    dimension:
      colors:
        "placed": "#e6fa0f"
        "completed": "#558B2F"
        "shipped": "#29B6F6"
```

## Required Attributes (Field-Level Security)

Limit dimension access based on user attributes.

```yaml
config:
  meta:
    dimension:
      required_attributes:
        is_admin: "true"
```

## Image Display

Display images in table cells.

```yaml
config:
  meta:
    dimension:
      image:
        url: "${value.raw}"
        width: 100
        height: 100
        fit: "cover"
```

## Additional Dimensions

Define multiple dimensions from a single column (e.g., parsing JSON or multiple timezones).

```yaml
columns:
  - name: metadata
    config:
      meta:
        dimension:
          hidden: true
        additional_dimensions:
          version:
            type: number
            sql: "JSON_VALUE(${metadata}, '$.version')"
```

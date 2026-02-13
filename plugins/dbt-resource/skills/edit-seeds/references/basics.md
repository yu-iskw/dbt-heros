# Seed Basics

Seeds are static CSV files loaded into the warehouse as tables via `dbt seed`.

## CSV File Format

```csv
country_code,country_name,region
US,United States,North America
GB,United Kingdom,Europe
JP,Japan,Asia Pacific
```

## YAML Configuration

```yaml
# seeds/seeds.yml
version: 2

seeds:
  - name: country_codes
    description: "ISO country code lookup table."
    config:
      schema: seed_data
      column_types:
        country_code: varchar(2)
        country_name: varchar(64)
        region: varchar(32)
    columns:
      - name: country_code
        description: "ISO 3166-1 alpha-2 country code."
        data_tests:
          - unique
          - not_null
```

## Project-Level Config

```yaml
# dbt_project.yml
seeds:
  my_project:
    +schema: seed_data
    country_codes:
      +column_types:
        country_code: varchar(2)
```

## Key Properties

| Property | Description |
|:--|:--|
| `schema` | Target schema for the seed table |
| `column_types` | Explicit type mapping (recommended) |
| `quote_columns` | Whether to quote column names |
| `tags` | Tags for selection |

## Commands

```bash
dbt seed                        # load all seeds
dbt seed --select country_codes # load specific seed
dbt seed --full-refresh         # drop and reload
```

## Referencing Seeds

```sql
select * from {{ ref('country_codes') }}
```

# dbt Naming Conventions

Standardized naming patterns for all dbt resource types.

## Models

| Layer | Prefix | Pattern | Example |
|:--|:--|:--|:--|
| Staging | `stg_` | `stg_<source>__<entity>` | `stg_jaffle_shop__orders` |
| Intermediate | `int_` | `int_<entity>__<verb>` | `int_orders__pivoted` |
| Dimension | `dim_` | `dim_<entity>` | `dim_customers` |
| Fact | `fct_` | `fct_<entity>` | `fct_orders` |

## Sources

| Resource | Prefix | Pattern | Example |
|:--|:--|:--|:--|
| Source YAML | `src_` | `src_<source_name>.yml` | `src_jaffle_shop.yml` |
| Source name | none | `<source_system>` | `jaffle_shop` |

## YAML Property Files

| Scope | Prefix | Pattern | Example |
|:--|:--|:--|:--|
| Staging models | `_stg_` | `_stg_<source>.yml` | `_stg_jaffle_shop.yml` |
| Intermediate models | `_int_` | `_int_<domain>.yml` | `_int_orders.yml` |
| Mart models | `_` | `_<domain>.yml` | `_finance.yml` |

The `_` prefix sorts YAML files first in directory listings.

## Tests

| Type | Pattern | Example |
|:--|:--|:--|
| Singular test | `assert_<condition>` | `assert_positive_order_amounts.sql` |
| Custom generic | `test_<name>` | `test_is_positive.sql` |

## Macros

| Pattern | Example |
|:--|:--|
| `<verb>_<noun>` | `cents_to_dollars.sql` |
| `generate_<thing>` | `generate_schema_name.sql` |

## Seeds

| Pattern | Example |
|:--|:--|
| Descriptive noun | `country_codes.csv` |
| Domain-specific | `marketing_utm_mappings.csv` |

## Snapshots

| Pattern | Example |
|:--|:--|
| `<entity>_snapshot` | `orders_snapshot.sql` |

## Exposures

| Pattern | Example |
|:--|:--|
| `<type>_<name>` | `dashboard_weekly_sales` |

## Columns

| Convention | Example |
|:--|:--|
| Primary key | `<entity>_id` (e.g., `order_id`) |
| Foreign key | `<related_entity>_id` (e.g., `customer_id`) |
| Timestamps | `<event>_at` (e.g., `created_at`, `updated_at`) |
| Dates | `<event>_date` (e.g., `order_date`) |
| Booleans | `is_<condition>` or `has_<condition>` (e.g., `is_active`, `has_discount`) |
| Amounts | `<noun>_amount` or unit suffix (e.g., `amount_usd`, `weight_kg`) |
| Counts | `<noun>_count` (e.g., `order_count`) |

# dbt Project Structure

Standard directory layout and organizational patterns for dbt projects.

## Directory Layout

```
my_dbt_project/
├── dbt_project.yml          # Project configuration
├── profiles.yml             # Connection profiles (or ~/.dbt/profiles.yml)
├── packages.yml             # Package dependencies
├── models/
│   ├── staging/             # 1:1 with sources, renames, type casts
│   │   ├── src_jaffle_shop.yml
│   │   ├── _stg_jaffle_shop.yml
│   │   ├── stg_orders.sql
│   │   └── stg_customers.sql
│   ├── intermediate/        # Multi-source joins, business logic
│   │   ├── _int_orders.yml
│   │   └── int_orders__pivoted.sql
│   └── marts/               # Consumer-ready datasets
│       ├── _marts_finance.yml
│       ├── dim_customers.sql
│       └── fct_orders.sql
├── seeds/                   # Static CSV lookup data
│   ├── seeds.yml
│   └── country_codes.csv
├── snapshots/               # SCD Type 2 history tracking
│   └── orders_snapshot.sql
├── tests/                   # Singular tests
│   ├── assert_positive_amounts.sql
│   └── generic/             # Custom generic tests
│       └── test_is_positive.sql
├── macros/                  # Reusable Jinja macros
│   └── cents_to_dollars.sql
├── analyses/                # Ad-hoc queries (compiled, not materialized)
│   └── campaign_performance.sql
├── docs/                    # Doc block markdown files
│   └── column_descriptions.md
└── target/                  # Compiled output (gitignored)
    ├── compiled/
    ├── run/
    ├── manifest.json
    └── catalog.json
```

## Model Layers

| Layer | Directory | Prefix | Materialization | Exposed to BI |
|:--|:--|:--|:--|:--|
| Staging | `models/staging/` | `stg_` | `view` | No |
| Intermediate | `models/intermediate/` | `int_` | `ephemeral` or `view` | No |
| Marts | `models/marts/` | `dim_`, `fct_` | `table` | Yes |

## YAML File Organization

- **One YAML file per directory** for model properties (e.g., `_stg_jaffle_shop.yml`).
- **Source files** use `src_` prefix (e.g., `src_jaffle_shop.yml`).
- **Seed files** use `seeds.yml` or one file per seed.
- Use the `_` prefix for YAML property files to sort them first in directory listings.

## dbt_project.yml

```yaml
name: my_project
version: '1.0.0'
config-version: 2

profile: my_project

model-paths: ["models"]
seed-paths: ["seeds"]
test-paths: ["tests"]
macro-paths: ["macros"]
snapshot-paths: ["snapshots"]
analysis-paths: ["analyses"]
docs-paths: ["docs"]
target-path: "target"
clean-targets: ["target", "dbt_packages"]

models:
  my_project:
    +materialized: view
    staging:
      +materialized: view
    marts:
      +materialized: table
```

# dbt Development Standards

1. **Project Layering**: Organize models into `staging/`, `intermediate/`, and `marts/` directories.
   - **Staging** (`stg_`): One-to-one with sources. Renames, type casts, basic cleaning.
   - **Intermediate** (`int_`): Multi-source joins, business logic. Not exposed to end users.
   - **Marts** (`dim_`, `fct_`): Consumer-ready datasets for BI tools and analysts.
2. **ref() and source()**: ALWAYS use `{{ ref('model_name') }}` for inter-model dependencies and `{{ source('source_name', 'table_name') }}` for raw tables. Never hardcode table references.
3. **YAML Properties**: Every model, source, and seed MUST have a corresponding YAML properties file with descriptions and tests.
4. **Primary Keys**: Every model MUST define `unique` and `not_null` tests on its primary key column(s).
5. **Naming Conventions**:
   - Models: `stg_<source>__<entity>`, `int_<entity>__<verb>`, `dim_<entity>`, `fct_<entity>`.
   - Sources: `src_<source_name>.yml`.
   - Tests: `assert_<condition>.sql` for singular tests.
   - Macros: Descriptive verb-noun names (e.g., `cents_to_dollars`, `generate_schema_name`).
   - Seeds: Descriptive noun names (e.g., `country_codes`, `employee_mapping`).
   - Snapshots: `<entity>_snapshot`.
6. **Materialization Strategy**:
   - `view`: Staging models (lightweight, always fresh).
   - `table`: Mart models (fast queries, moderate cost).
   - `incremental`: Large append-heavy datasets (efficiency).
   - `ephemeral`: Intermediate CTEs that don't need to be materialized.
7. **dbt Fusion**: Use `dbt` (Fusion CLI) for all compilation, testing, and execution. Fusion provides faster parsing, SQL comprehension, and stricter YAML validation.

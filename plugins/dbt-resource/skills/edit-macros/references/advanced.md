# Macro Advanced Configuration

## Dispatching (Cross-Database Compatibility)

Use `adapter.dispatch` for warehouse-agnostic macros:

```sql
-- macros/dateadd.sql
{% macro dateadd(datepart, interval, from_date) %}
    {{ return(adapter.dispatch('dateadd')(datepart, interval, from_date)) }}
{% endmacro %}

{% macro default__dateadd(datepart, interval, from_date) %}
    dateadd({{ datepart }}, {{ interval }}, {{ from_date }})
{% endmacro %}

{% macro bigquery__dateadd(datepart, interval, from_date) %}
    date_add({{ from_date }}, interval {{ interval }} {{ datepart }})
{% endmacro %}
```

## Adapter Methods

```sql
-- Check if a relation exists
{% set relation = adapter.get_relation(
    database=target.database,
    schema=target.schema,
    identifier='my_table'
) %}

{% if relation is not none %}
    -- Table exists
{% endif %}
```

Common adapter methods:

| Method | Purpose |
|:--|:--|
| `adapter.get_relation()` | Check if a table/view exists |
| `adapter.get_columns_in_relation()` | Get column names and types |
| `adapter.create_schema()` | Create a schema |
| `adapter.dispatch()` | Cross-database macro dispatch |

## Override Built-in Macros

### Custom Schema Name

```sql
-- macros/generate_schema_name.sql
{% macro generate_schema_name(custom_schema_name, node) %}
    {% if custom_schema_name %}
        {{ custom_schema_name | trim }}
    {% else %}
        {{ target.schema }}
    {% endif %}
{% endmacro %}
```

### Custom Alias

```sql
-- macros/generate_alias_name.sql
{% macro generate_alias_name(custom_alias_name, node) %}
    {% if custom_alias_name %}
        {{ custom_alias_name | trim }}
    {% else %}
        {{ node.name }}
    {% endif %}
{% endmacro %}
```

## Materialization Macros

Custom materializations for specialized use cases:

```sql
{% materialization my_custom, default %}
    {%- set target_relation = this -%}
    {%- set sql = render(caller()) -%}

    -- Custom logic here
    {{ run_query("CREATE TABLE " ~ target_relation ~ " AS (" ~ sql ~ ")") }}

    {{ return({'relations': [target_relation]}) }}
{% endmaterialization %}
```

## Macro Argument Validation (dbt Core 1.10+)

```sql
{% macro safe_divide(numerator, denominator) %}
    {% if denominator is none %}
        {{ exceptions.raise_compiler_error("denominator cannot be none") }}
    {% endif %}
    {{ numerator }} / nullif({{ denominator }}, 0)
{% endmacro %}
```

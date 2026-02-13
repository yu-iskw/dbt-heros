# Common Jinja Patterns for dbt

Frequently used Jinja2 patterns in dbt SQL and YAML files.

## Variable Access

```sql
-- Project variable (defined in dbt_project.yml or --vars)
{{ var('start_date', '2020-01-01') }}

-- Environment variable
{{ env_var('DBT_TARGET_SCHEMA', 'dev') }}

-- Target properties
{{ target.name }}      -- profile target name (dev, prod)
{{ target.schema }}    -- target schema
{{ target.database }}  -- target database
```

## Conditional Logic

```sql
-- Environment-based filtering
{% if target.name == 'dev' %}
    where created_at >= dateadd('day', -3, current_date)
{% endif %}

-- Feature flags
{% if var('enable_pii_masking', false) %}
    md5(email) as email_hash
{% else %}
    email
{% endif %}
```

## Looping

```sql
-- Dynamic column selection
{% set columns = ['revenue', 'cost', 'margin'] %}
select
    date,
    {% for col in columns %}
        sum({{ col }}) as total_{{ col }}{% if not loop.last %},{% endif %}
    {% endfor %}
from {{ ref('stg_financials') }}
group by date

-- Union multiple models
{% set models = ['stg_orders_us', 'stg_orders_eu', 'stg_orders_apac'] %}
{% for model in models %}
    select * from {{ ref(model) }}
    {% if not loop.last %} union all {% endif %}
{% endfor %}
```

## Set Variables

```sql
{% set payment_methods = ['credit_card', 'cash', 'gift_card'] %}

select
    order_id,
    {% for method in payment_methods %}
        sum(case when payment_method = '{{ method }}' then amount else 0 end) as {{ method }}_amount
        {% if not loop.last %},{% endif %}
    {% endfor %}
from {{ ref('stg_payments') }}
group by order_id
```

## Query Results at Compile Time

```sql
-- Run a query and use results in the model
{% set results = run_query("select distinct status from " ~ ref('stg_orders')) %}
{% set statuses = results.columns[0].values() %}

select
    order_id,
    {% for status in statuses %}
        count(case when status = '{{ status }}' then 1 end) as {{ status }}_count
        {% if not loop.last %},{% endif %}
    {% endfor %}
from {{ ref('stg_orders') }}
group by order_id
```

## Incremental Model Pattern

```sql
{{ config(materialized='incremental', unique_key='event_id') }}

select *
from {{ source('events', 'raw_events') }}

{% if is_incremental() %}
    where event_timestamp > (select max(event_timestamp) from {{ this }})
{% endif %}
```

## Debug Logging

```sql
{{ log("Processing model: " ~ this.name, info=True) }}
```

## String Manipulation

```sql
{{ "hello world" | upper }}          -- HELLO WORLD
{{ "Hello World" | lower }}          -- hello world
{{ "hello" | replace("l", "r") }}    -- herro
{{ column_name | trim }}             -- trimmed string
```

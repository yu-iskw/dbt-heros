# Macro Basics

Macros are reusable Jinja templates that generate SQL at compile time.

## Definition Syntax

```sql
-- macros/cents_to_dollars.sql
{% macro cents_to_dollars(column_name, precision=2) %}
    round({{ column_name }} / 100.0, {{ precision }})
{% endmacro %}
```

## Usage in Models

```sql
-- models/marts/fct_orders.sql
select
    order_id,
    {{ cents_to_dollars('amount_cents') }} as amount_dollars
from {{ ref('stg_orders') }}
```

## Jinja Fundamentals

| Syntax | Purpose | Example |
|:--|:--|:--|
| `{{ ... }}` | Output expressions | `{{ ref('model') }}` |
| `{% ... %}` | Statements (control flow) | `{% if condition %}` |
| `{# ... #}` | Comments | `{# This is a comment #}` |

## Common Patterns

### Conditional SQL

```sql
{% macro limit_data_in_dev(column_name, dev_days=3) %}
    {% if target.name == 'dev' %}
        where {{ column_name }} >= dateadd('day', -{{ dev_days }}, current_date)
    {% endif %}
{% endmacro %}
```

### Looping

```sql
{% macro union_tables(tables) %}
    {% for table in tables %}
        select * from {{ ref(table) }}
        {% if not loop.last %} union all {% endif %}
    {% endfor %}
{% endmacro %}
```

## Built-in Functions

| Function | Description |
|:--|:--|
| `ref()` | Reference a model |
| `source()` | Reference a source |
| `config()` | Access model configuration |
| `var()` | Access project variables |
| `env_var()` | Access environment variables |
| `log()` | Print to console during compilation |
| `this` | Reference the current model's relation |
| `target` | Access target profile (name, schema, etc.) |

## CLI Invocation

```bash
dbt run-operation cents_to_dollars --args '{column_name: amount}'
```

# Edit Parameters

Skill for defining and modifying dynamic parameters in the Lightdash semantic layer.

## Purpose

Enables the creation of dynamic, reusable variables that users can modify at runtime in dbt YAML or `lightdash.config.yml`.

## Behavior

1. **Parameter Scope**: Define parameters either at the project level (`lightdash.config.yml`) or the model level (dbt YAML).
2. **Type Safety**: Ensure parameters use supported types (`string`, `number`, `date`).
3. **Template Usage**: Reference parameters in SQL using `${lightdash.parameters.name}` or `${ld.parameters.name}`.
4. **Reference Consultation**: ALWAYS check `references/basics.md` and `references/advanced.md` for syntax patterns.

## References

- [Basics](./references/basics.md): Parameter definition and simple types.
- [Advanced](./references/advanced.md): Multi-select, custom options, and joined model parameters.
- [Global Config](../../shared/references/config-yml.md): Project-level parameters.
- [SQL Templating](../../shared/references/sql-variables.md): Using `${lightdash.parameters.name}`.

## Rules

- ALWAYS provide a `default` value for parameters.
- Add clear `description` tags to help end-users understand the parameter's effect.
- Prefer model-level parameters for better encapsulation.
- Refer to `read-parameters` to verify existing variables before adding new ones.

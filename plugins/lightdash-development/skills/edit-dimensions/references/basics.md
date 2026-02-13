# Dimension Basics (dbt 1.10+)

Dimensions are the columns in your table. They are the "attributes" of your data.

## Syntax (dbt 1.10+ / Fusion)

In dbt 1.10+ and Fusion, dimension metadata is nested under `config.meta.dimension`.

```yaml
models:
  - name: my_model
    columns:
      - name: user_id
        description: "Unique identifier for a user."
        config:
          meta:
            dimension:
              type: string
```

## Supported Types

- `string`
- `number`
- `timestamp`
- `date`
- `boolean`

## Essential Properties

| Property      | Required | Description                                                   |
| :------------ | :------- | :------------------------------------------------------------ |
| `type`        | No       | Automatically pulled from warehouse, but can be overridden.   |
| `label`       | No       | Custom display name in Lightdash.                             |
| `description` | No       | Description shown on hover in the UI.                         |
| `hidden`      | No       | If true, dimension is hidden from the sidebar and drilldowns. |

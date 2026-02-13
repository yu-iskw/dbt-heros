# lightdash.config.yml Reference

Project-wide configuration file.

## Spotlight Configuration

Define categories for the Metrics Catalog (Spotlight).

```yaml
spotlight:
  default_visibility: "show"
  categories:
    finance:
      label: "Finance"
      color: "green"
    marketing:
      label: "Marketing"
      color: "blue"
```

## Global Parameters

Define variables available across the entire project.

```yaml
parameters:
  region:
    label: "Global Region"
    options: ["EMEA", "AMER", "APAC"]
    default: "AMER"
```

## Restrictions

`lightdash.config.yml` is NOT supported for projects connected directly to dbt Cloud (requires direct git or CLI deploy).

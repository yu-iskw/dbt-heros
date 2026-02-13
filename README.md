# dbt Superpowers

Accelerate your dbt lifecycle with specialized Claude Code plugins. This repository provides high-performance agents and skills for mastering dbt Core, dbt Cloud, dbt Fusion, Elementary, and Lightdash.

## Available Plugins

<!-- START_PLUGIN_TABLE -->

| Category           | Plugin                                                       | Description                                                    | Status |
| :----------------- | :----------------------------------------------------------- | :------------------------------------------------------------- | :----- |
| **Semantic Layer** | [lightdash-development](./plugins/lightdash-development)     | dbt 1.10+ metrics, dimensions, and semantic layer modeling.    | ✅ GA  |
| **Analysis**       | [lightdash-analysis](./plugins/lightdash-analysis)           | Data discovery and insight generation from Lightdash explores. | ✅ GA  |
| **Content Ops**    | [lightdash-content-admin](./plugins/lightdash-content-admin) | Space organization and content validation for Lightdash.       | ✅ GA  |
| **Admin**          | [lightdash-org-admin](./plugins/lightdash-org-admin)         | Lightdash organization management (users, groups, projects).   | ✅ GA  |

<!-- END_PLUGIN_TABLE -->

## Core Principles

- **Agentic Workflows**: Move beyond static documentation into interactive, goal-oriented collaboration.
- **Unified Interface**: A single repository for all dbt ecosystem extensions.
- **Safety First**: Deterministic safety modes (`read-only`, `write-safe`, `write-destructive`) for all tools.

## Quickstart

### 1. Prerequisites

Ensure you have [Claude Code](https://code.claude.com) installed and authenticated.

### 2. Configuration

Refer to the [Product Documentation](#product-documentation) for detailed configuration instructions for each plugin.

## Product Documentation

<!-- START_DOCS_LIST -->

- [Lightdash Plugins Documentation](./docs/plugins/lightdash_plugins.md)

<!-- END_DOCS_LIST -->

### 3. Installation

The most efficient way to use these plugins is by adding the repository as a local marketplace. This enables discovery and management of all specialized plugins through the `/plugin` interface.

```bash
# Within Claude Code
/plugin marketplace add .
```

Alternatively, you can install individual plugins via the CLI:

```bash
claude plugin install ./plugins/lightdash-analysis
# Add others as needed
```

## Development

This repository is a monorepo. To add a new plugin or contribute to existing ones, refer to our [Development Guide](./docs/development.md) (coming soon).

- **Standard Layout**: Every plugin follows the `.claude-plugin/plugin.json` manifest standard.
- **CI/CD**: Unified linting and integration testing via `make lint` and `make test-integration-docker`.

---

License: Apache 2.0

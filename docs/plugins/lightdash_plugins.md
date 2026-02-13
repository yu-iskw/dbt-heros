# Lightdash Plugins Documentation

This document describes the configuration and details for Lightdash-related plugins in the dbt Superpowers repository.

## Configuration

To use Lightdash plugins, configure your environment with the following API keys. We recommend using a `.env` file in your project root:

```bash
# Lightdash API Key (Required)
LIGHTDASH_API_KEY=your_key
# Lightdash API URL (Default: https://app.lightdash.cloud/api/v1)
LIGHTDASH_API_URL=https://app.lightdash.cloud/api/v1

# Security Mode
# Options: read-only, write-safe, write-destructive
LIGHTDASH_TOOL_SAFETY_MODE=write-safe
```

## Installation

The Lightdash plugins are distributed through the `dbt-superpowers` marketplace. You can install them by first adding the marketplace and then selecting the specific plugins you need.

### Add Marketplace (Recommended)

To enable discovery and easy updates, add the repository as a marketplace within Claude Code:

```bash
# Within Claude Code
/plugin marketplace add yu-iskw/dbt-superpowers
```

### Individual Plugin Installation

Once the marketplace is added, you can install individual plugins using the syntax `{plugin-name}@dbt-superpowers`. Alternatively, you can install them directly using their full GitHub path.

| Plugin                      | Marketplace Command                                       | Direct Install Command                                                    |
| :-------------------------- | :-------------------------------------------------------- | :------------------------------------------------------------------------ |
| **lightdash-development**   | `/plugin install lightdash-development@dbt-superpowers`   | `/plugin install yu-iskw/dbt-superpowers/plugins/lightdash-development`   |
| **lightdash-analysis**      | `/plugin install lightdash-analysis@dbt-superpowers`      | `/plugin install yu-iskw/dbt-superpowers/plugins/lightdash-analysis`      |
| **lightdash-content-admin** | `/plugin install lightdash-content-admin@dbt-superpowers` | `/plugin install yu-iskw/dbt-superpowers/plugins/lightdash-content-admin` |
| **lightdash-org-admin**     | `/plugin install lightdash-org-admin@dbt-superpowers`     | `/plugin install yu-iskw/dbt-superpowers/plugins/lightdash-org-admin`     |

## Available Lightdash Plugins

| Category           | Plugin                                                           | Description                                                    | Status |
| :----------------- | :--------------------------------------------------------------- | :------------------------------------------------------------- | :----- |
| **Semantic Layer** | [lightdash-development](../../plugins/lightdash-development)     | dbt 1.10+ metrics, dimensions, and semantic layer modeling.    | ✅ GA  |
| **Analysis**       | [lightdash-analysis](../../plugins/lightdash-analysis)           | Data discovery and insight generation from Lightdash explores. | ✅ GA  |
| **Content Ops**    | [lightdash-content-admin](../../plugins/lightdash-content-admin) | Space organization and content validation for Lightdash.       | ✅ GA  |
| **Admin**          | [lightdash-org-admin](../../plugins/lightdash-org-admin)         | Lightdash organization management (users, groups, projects).   | ✅ GA  |

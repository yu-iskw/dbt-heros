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
# Options: read-only, write-idempotent, write-destructive
LIGHTDASH_TOOLS_SAFETY_MODE=write-idempotent
```

For agent discoverability (e.g. `lightdash-ai schema list`), see [lightdash-ai-cli.md](../../plugins/lightdash-development/skills/shared/references/lightdash-ai-cli.md).

## Installation

The Lightdash plugins are distributed through the `dbt-heros` marketplace. You can install them by first adding the marketplace and then selecting the specific plugins you need.

### Add Marketplace (Recommended)

To enable discovery and easy updates, add the repository as a marketplace within Claude Code:

```bash
# Within Claude Code
/plugin marketplace add yu-iskw/dbt-heros
```

### Individual Plugin Installation

Once the marketplace is added, you can install individual plugins using the syntax `{plugin-name}@dbt-heros`. Alternatively, you can install them directly using their full GitHub path.

| Plugin                      | Marketplace Command                                 | Direct Install Command                                              |
| :-------------------------- | :-------------------------------------------------- | :------------------------------------------------------------------ |
| **lightdash-development**   | `/plugin install lightdash-development@dbt-heros`   | `/plugin install yu-iskw/dbt-heros/plugins/lightdash-development`   |
| **lightdash-analysis**      | `/plugin install lightdash-analysis@dbt-heros`      | `/plugin install yu-iskw/dbt-heros/plugins/lightdash-analysis`      |
| **lightdash-content-admin** | `/plugin install lightdash-content-admin@dbt-heros` | `/plugin install yu-iskw/dbt-heros/plugins/lightdash-content-admin` |
| **lightdash-org-admin**     | `/plugin install lightdash-org-admin@dbt-heros`     | `/plugin install yu-iskw/dbt-heros/plugins/lightdash-org-admin`     |
| **lightdash-agentops**      | `/plugin install lightdash-agentops@dbt-heros`      | `/plugin install yu-iskw/dbt-heros/plugins/lightdash-agentops`      |

## Available Lightdash Plugins

| Category           | Plugin                                                           | Description                                                    | Status  |
| :----------------- | :--------------------------------------------------------------- | :------------------------------------------------------------- | :------ |
| **Semantic Layer** | [lightdash-development](../../plugins/lightdash-development)     | dbt 1.10+ metrics, dimensions, and semantic layer modeling.    | ✅ GA   |
| **Analysis**       | [lightdash-analysis](../../plugins/lightdash-analysis)           | Data discovery and insight generation from Lightdash explores. | ✅ GA   |
| **Content Ops**    | [lightdash-content-admin](../../plugins/lightdash-content-admin) | Space organization and content validation for Lightdash.       | ✅ GA   |
| **Admin**          | [lightdash-org-admin](../../plugins/lightdash-org-admin)         | Lightdash organization management (users, groups, projects).   | ✅ GA   |
| **AgentOps**       | [lightdash-agentops](../../plugins/lightdash-agentops)           | Build, manage, and autonomously tune Lightdash AI agents.      | 🧪 Beta |

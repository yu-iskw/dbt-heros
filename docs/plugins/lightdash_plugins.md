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

## Available Lightdash Plugins

| Category           | Plugin                                                           | Description                                                    | Status |
| :----------------- | :--------------------------------------------------------------- | :------------------------------------------------------------- | :----- |
| **Semantic Layer** | [lightdash-development](../../plugins/lightdash-development)     | dbt 1.10+ metrics, dimensions, and semantic layer modeling.    | ✅ GA  |
| **Analysis**       | [lightdash-analysis](../../plugins/lightdash-analysis)           | Data discovery and insight generation from Lightdash explores. | ✅ GA  |
| **Content Ops**    | [lightdash-content-admin](../../plugins/lightdash-content-admin) | Space organization and content validation for Lightdash.       | ✅ GA  |
| **Admin**          | [lightdash-org-admin](../../plugins/lightdash-org-admin)         | Lightdash organization management (users, groups, projects).   | ✅ GA  |

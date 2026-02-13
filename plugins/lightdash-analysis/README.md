# Lightdash Analysis Plugin

This plugin provides tools for data exploration and insight generation in Lightdash. It is strictly read-only.

## Prerequisites

This plugin requires a connection to a Lightdash instance. You must set the following environment variables in your project root's `.env` file or your shell configuration (e.g., `~/.zshrc` or `~/.bash_profile`):

- `LIGHTDASH_API_KEY`: Your Lightdash personal access token.
- `LIGHTDASH_API_URL`: The base URL of your Lightdash instance (e.g., `https://app.lightdash.cloud/api/v1` or `https://your-lightdash-domain/api/v1`).

Example `.env` file:

```bash
LIGHTDASH_API_KEY=your_key_here
LIGHTDASH_API_URL=https://app.lightdash.cloud/api/v1
```

## Configuration

Operates in `LIGHTDASH_TOOL_SAFETY_MODE=read-only`.

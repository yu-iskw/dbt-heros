# Lightdash Organization Admin Plugin

This plugin provides tools for Lightdash organization administrators to manage users, groups, and the organization's projects.

## Scope

- **Organization Management**: Users, groups, and membership.
- **High-level Project Management**: Listing projects, checking project metadata, and organization-wide project settings.
- **Space Administration**: Organization-level oversight of spaces and future access control.
- **Organization Settings**: Managing organization-level configurations.

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

Requires `LIGHTDASH_TOOL_SAFETY_MODE=write-destructive` for user deletion and project modification.

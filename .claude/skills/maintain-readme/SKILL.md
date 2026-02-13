# Maintain README

This skill automates the synchronization of the root `README.md` plugin table with the actual plugins available in the `plugins/` directory.

## Implementation Details

The skill ensures that the "Available Plugins" section in the root `README.md` accurately reflects the state of all plugins in the monorepo by reading their `plugin.json` manifests.

### 1. Discovery

- Scan the `plugins/` directory for subdirectories containing `.claude-plugin/plugin.json`.
- Extract `name`, `description`, and `metadata` (category, status) from each manifest.

### 2. Synchronization

- Locate the `<!-- START_PLUGIN_TABLE -->` and `<!-- END_PLUGIN_TABLE -->` markers in the root `README.md`.
- Regenerate the Markdown table based on the discovered plugins.
- Order the table by Category, then Name.

### 3. Documentation Sync

- Scan the `docs/plugins/` directory for `.md` files.
- Locate the `<!-- START_DOCS_LIST -->` and `<!-- END_DOCS_LIST -->` markers in the root `README.md`.
- Generate a list of links to the documentation files.
- Order the list alphabetically by file name.

### 4. Standards

- **Category**: Should be one of `Semantic Layer`, `Analysis`, `Content Ops`, `Admin`, `Quality`, `Lifecycle`.
- **Status**: Should be `GA`, `Beta`, or `Alpha`. Use emojis: `✅ GA`, `🧪 Beta`, `🏗️ Alpha`.

## Instructions

1. **Trigger**: Use this skill when a new plugin is added, a plugin's description changes, a new documentation file is added to `docs/plugins/`, or when explicitly asked to "update the plugin list" or "sync README".
2. **Process**:
   - List all directories in `plugins/`.
   - Read `.claude-plugin/plugin.json` for each.
   - List all `.md` files in `docs/plugins/`.
   - Read the root `README.md`.
   - Format a new plugin table according to the [plugin-table template](references/template.md).
   - Format a new documentation list.
   - Use `StrReplace` to update the content between the plugin table markers and the documentation list markers.

## References

- [Plugin Table Template](references/template.md)

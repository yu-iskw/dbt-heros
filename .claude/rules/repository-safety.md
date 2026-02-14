# Repository Safety Rules

## Destructive Operations

1. **No Force Operations Without Explicit Approval**: Never execute force push, reset --hard, or other destructive git operations without explicit user confirmation.

2. **Safety Mode Enforcement**: When implementing or using tools that mutate state:
   - All destructive tools MUST have PreToolUse hooks for safety enforcement
   - Tools MUST respect the `LIGHTDASH_TOOL_SAFETY_MODE` environment variable (or equivalent)
   - Safety modes: `read-only`, `write-safe`, `write-destructive`
   - Default to the most restrictive mode when safety level is unclear

3. **File Deletion Protection**: Before deleting any files or directories:
   - Verify the file is not part of critical infrastructure (manifests, ADRs, shared skills)
   - Check if the file is tracked in git and has uncommitted changes
   - For plugin components, verify the plugin will remain functional after deletion

4. **Branch Management**:
   - Never delete branches without explicit user approval
   - Never force-push to main/master branches
   - When rebasing or amending commits, verify they haven't been pushed to shared branches

## Plugin Safety

1. **Plugin Manifest Integrity**:
   - Never modify `plugin.json` manifests without validating the schema
   - Validate manifests using `/plugin-verification` before committing changes
   - Breaking changes to plugin manifests require an ADR

2. **Symlink Topology**:
   - Never modify or delete symlinks in `.agents/skills`, `.claude/agents`, or `.cursor/skills/shared`
   - These symlinks are critical for cross-tool compatibility (ADR-0013)
   - If symlink issues are detected, investigate and repair rather than deleting

3. **Shared Resource Protection**:
   - Files in `.claude/skills/` are shared across all plugins - changes affect all users
   - Never delete or substantially modify shared skills without understanding downstream impact
   - Test shared skill changes across multiple plugins

## Environment Safety

1. **No Secrets in Code**: Never commit sensitive data to the repository:
   - API keys, tokens, credentials
   - `.env` files or environment-specific configuration
   - Personal or customer data
   - Private URLs or internal service endpoints

2. **Dependency Management**:
   - Never remove dependencies without verifying they're unused
   - Use `make lint` to detect import issues before removing packages
   - Document dependency changes in commit messages

## Testing Requirements

1. **Breaking Changes Require Tests**:
   - Any change that modifies plugin behavior MUST pass `make test-integration-docker`
   - New skills or agents MUST have documented test cases (20-50 scenarios for complexity score 4+)
   - Safety hook changes MUST be tested against both allowed and blocked scenarios

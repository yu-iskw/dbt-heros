# Plugin Architecture Patterns

## Canonical Plugin Structure

Every plugin MUST follow this structure:

```text
plugins/{plugin-name}/
├── .claude-plugin/
│   └── plugin.json              # Manifest (name, description, components)
├── agents/                      # Plugin-specific sub-agents (optional)
│   └── {agent-name}.md
├── hooks/                       # PreToolUse, PostToolUse hooks (optional)
│   ├── hooks.json
│   └── scripts/
│       └── {hook-script}.sh
├── rules/                       # Plugin-specific rules (optional)
│   └── {rule-name}.md
├── skills/                      # Plugin-specific skills (optional)
│   └── {skill-name}/
│       └── SKILL.md
└── README.md                    # Plugin documentation (required)
```

## Shared Resources Architecture (ADR-0013)

### Canonical Locations

1. **Shared Skills**: `.claude/skills/{skill-name}/SKILL.md`
   - These are repository-wide skills usable across all contexts
   - Examples: `implement-plugin`, `plugin-verification`, `manage-adr`

2. **Shared Sub-Agents**: `.agents/agents/{agent-name}.md`
   - These are repository-wide sub-agents
   - Currently includes: claude-plugin-manager

3. **Repository Rules**: `.claude/rules/{rule-name}.md`
   - Auto-loaded for all Claude sessions
   - Apply repository-wide (not plugin-specific)

### Cross-Tool Compatibility Symlinks

These symlinks enable Codex, Claude, and Cursor to access shared resources:

- `.agents/skills` → `../.claude/skills` (Codex compatibility)
- `.claude/agents` → `../.agents/agents` (reverse link for Claude)
- `.cursor/skills/shared` → `../../.agents/skills` (Cursor compatibility)

**CRITICAL**: Never delete or modify these symlinks directly. They are part of the cross-tool compatibility contract.

## Plugin vs Shared Components

### Use Plugin-Specific Components When

- The component is only relevant to that plugin's domain
  - Example: `lightdash-analysis/skills/explore-data` is Lightdash-specific
- The component requires plugin-specific context or tools
- The component should only load when the plugin is active

### Use Shared Components When

- The component is useful across multiple plugins
  - Example: `implement-plugin` is used for all plugin development
- The component provides repository-wide functionality
  - Example: `manage-adr` works with the `docs/adr/` directory
- The component should always be available to Claude

## Manifest Requirements

### plugin.json Schema

Every `plugin.json` MUST include:

```json
{
  "name": "plugin-name",
  "description": "Brief description of plugin purpose",
  "agents": ["agents/agent-name.md"], // Optional
  "hooks": ["hooks/hooks.json"], // Optional
  "rules": ["rules/*.md"], // Optional
  "skills": ["skills/*/SKILL.md"] // Optional
}
```

### Manifest Validation

- Use `/plugin-verification` to validate manifest structure
- Run `./integration_tests/validate-manifest.sh` before committing
- Ensure all referenced files actually exist

## Safety Enforcement Pattern

For plugins with destructive tools:

### 1. Tool Definition

Define the tool with clear safety documentation:

```markdown
## Tool: lightdash_tools\_\_delete_member

- Safety Mode: write-destructive
- Description: Permanently removes a user from the organization
```

### 2. PreToolUse Hook

Add hook in `hooks/hooks.json`:

```json
{
  "hooks": [
    {
      "type": "PreToolUse",
      "toolPattern": "lightdash_tools__delete_.*",
      "script": "hooks/scripts/safety-check.sh"
    }
  ]
}
```

### 3. Safety Script

Implement deterministic check:

```bash
#!/bin/bash
# Read LIGHTDASH_TOOL_SAFETY_MODE
# If not "write-destructive", return permissionDecision: "deny"
# Include clear feedback message
```

## Plugin Naming Conventions

1. **Plugin Names**: `{domain}-{focus}` (e.g., `lightdash-analysis`, `lightdash-development`)
   - Use lowercase with hyphens
   - Domain identifies the tool/platform
   - Focus identifies the specific use case

2. **Skill Names**: `{verb}-{noun}` (e.g., `explore-data`, `manage-space`)
   - Action-oriented
   - Concise (1-3 words)

3. **Agent Names**: `{domain}-{role}` (e.g., `lightdash-analyst`, `lightdash-content-admin`)
   - Describes the agent's role
   - Matches the plugin's domain

## Context Management

### Plugin-Level Rules

Rules in `plugins/{name}/rules/` are auto-loaded when the plugin is active. Use these for:

- Plugin-specific constraints
- Tool usage guidelines
- Domain-specific best practices

Example: `plugins/lightdash-analysis/rules/safety.md` enforces read-only mode for analysis tasks.

### Skill Instructions

Keep skill instructions focused and progressive:

1. **Purpose**: What does this skill do?
2. **Instructions**: Step-by-step workflow
3. **Examples**: Concrete use cases
4. **References**: Links to deep documentation (not inline duplication)

### Agent Instructions

For autonomous sub-agents:

1. **Role**: What is this agent responsible for?
2. **Boundaries**: What should it NOT do?
3. **Tools**: What tools can it use?
4. **Decision Authority**: What decisions can it make autonomously?
5. **Escalation**: When should it defer to the user?

## Testing Patterns

### Plugin Integration Tests

Each plugin should have validation in `integration_tests/`:

- Manifest validation
- Component discovery
- Hook execution (if applicable)
- Skill loading

### Skill Testing

Complex skills (score 4+) should document:

- 20-50 test scenarios
- Expected behavior for each scenario
- Success criteria

Example in skill frontmatter:

```yaml
evaluation:
  test_scenarios: 45
  coverage: ["happy path", "missing data", "invalid input", "permission denied"]
```

## Monorepo Coordination

### Avoiding Duplication

Before creating a new skill/agent:

1. Check `.claude/skills/` for existing shared skills
2. Check other plugins for similar patterns
3. Consider extracting common logic to shared components

### Cross-Plugin Dependencies

- Plugins should be independently functional
- If plugins share logic, extract to `.claude/skills/`
- Don't create tight coupling between plugins

### Version Coordination

- All plugins in this monorepo are versioned together
- Breaking changes to shared components affect all plugins
- Use ADRs to document changes that impact multiple plugins

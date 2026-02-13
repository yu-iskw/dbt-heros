---
name: implement-agent-skills
description: Implement and maintain Claude Agent Skills with valid SKILL.md frontmatter, focused instructions, and progressive disclosure.
---

# Implement Agent Skills

Create or update `skills/<skill-name>/SKILL.md` files with deterministic scope and reusable references/scripts/templates.

## Workflow

1. **Assess complexity**: Use decision framework to determine skill level needed (simple vs workflow)
2. **Start simple**: Choose simplest skill type that meets requirements
3. **Define scope**: Single-purpose objective with clear trigger criteria and success metrics
4. **Create/update**: `skills/<name>/SKILL.md` with valid frontmatter
5. **Add supporting materials**: References/scripts/templates for progressive disclosure
6. **Plan evaluations**: Identify 20-50 test cases to validate skill behavior
7. **Validate**: Check frontmatter and directory structure
8. **Cross-link**: Connect to plugin packaging or umbrella guidance as needed

## Progressive Disclosure

### Best Practices (Anthropic Guidelines)

- **Complexity decision framework**: `../implement-claude-extensions/references/decision-framework.md`
- **Context management patterns**: `../implement-claude-extensions/references/context-management.md`
- **Evaluation strategy**: `../implement-claude-extensions/references/evaluation-strategy.md`

### Skill Design Patterns

- Skill directory conventions: `references/skill-structure.md`
- Required frontmatter fields: `references/skill-frontmatter.md`
- Progressive disclosure patterns: `references/skill-progressive-disclosure.md`
- Invocation and trigger guidance: `references/skill-invocation.md`

### Validation Tools

- Structure validator: `scripts/validate-skill-structure.sh`
- Frontmatter checker: `scripts/check-skill-frontmatter.sh`

### Tiered Templates (by Complexity)

- **Level 1 - Simple Skill** (Score 1-3): `assets/templates/skill-simple.md`
- **Level 2 - Workflow Skill** (Score 4-6): `assets/templates/skill-workflow.md`
- Base skill template: `assets/templates/skill-template.md`
- Skill with references example: `assets/templates/skill-with-references.md`
- Skill with scripts example: `assets/templates/skill-with-scripts.md`

## Related Skills

- Umbrella routing and component selection: `../implement-claude-extensions/SKILL.md`
- Plugin packaging/distribution: `../implement-plugin/SKILL.md`

## Sources

- https://code.claude.com/docs/en/skills
- https://code.claude.com/docs/en/plugins

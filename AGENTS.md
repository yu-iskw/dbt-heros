# Repository Agent Operating Guide

## Purpose

This file is the repository-wide operational contract for Codex and related agents. Full context, workflows, and plugin details are in [CLAUDE.md](CLAUDE.md).

## Project Identity

This is a **multi-plugin monorepo** providing specialized Claude Code plugins for the dbt ecosystem, with a primary focus on Lightdash integration.

**Plugins:** lightdash-analysis, lightdash-content-admin, lightdash-development, lightdash-org-admin.

**Multi-Tool Support:** Claude Code, Codex, and Cursor use a symlinked shared resource layout (see [ADR-0013](docs/adr/0013-adopt-agents-root-for-shared-agent-resources.md)).

## Shared Resources (Codex)

- **Canonical skills:** `.claude/skills/`
- **Codex loads them via:** `.agents/skills` (symlink to `.claude/skills`)
- Do not duplicate content; edit skills only under `.claude/skills/` or shared agents under `.agents/agents/`.

## Key Rules

- **Safety (ADR-0005):** Destructive operations are enforced via PreToolUse hooks. Document safety mode when implementing tools.
- **Start simple:** Use complexity 0–10; prefer the simpler extension type (skill over sub-agent over team).
- **ADR-driven:** Significant architectural changes require an ADR in `docs/adr/`. Use `/manage-adr` to create or link ADRs.

## Before Committing / Before PR

- **Before commit:** `make format && make lint`
- **Before PR:** `make test-integration-docker` and document test evidence in the PR.

## Navigation

- **Full contract and workflows:** [CLAUDE.md](CLAUDE.md)
- **Contributor workflow:** [CONTRIBUTING.md](CONTRIBUTING.md)
- **Architecture decisions:** [docs/adr/](docs/adr/)
- **Key skills:** in `.agents/skills` (e.g. implement-plugin, plugin-verification, implement-agent-skills, implement-sub-agents, manage-adr). Read a skill's `SKILL.md` when the task matches its description.

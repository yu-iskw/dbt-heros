# Read Parameters

Skill for inspecting dynamic parameters in the Lightdash semantic layer.

## Purpose

Enables inspection of existing parameters to understand dynamic query customization options.

## Tools

Wraps MCP tools for inspecting existing parameters (via `lightdash_tools__get_explore`).

## Behavior

1. **Inspection**: Use `get_explore` to see parameters defined for a model.

## Rules

- Use `read-parameters` to understand available dynamic variables before proposing new ones.

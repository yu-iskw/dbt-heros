# Edit Docs

Skill for creating and modifying dbt documentation, exposures, and doc blocks.

## Purpose

Enables the creation and management of project documentation, including reusable doc blocks, exposure definitions, and resource descriptions.

## Behavior

1. **Doc Block Authoring**: Create reusable description blocks in `.md` files.
2. **Exposure Definition**: Define downstream consumers in YAML (dashboards, reports, ML models).
3. **Description Enrichment**: Add or improve descriptions on models, sources, columns, and macros.
4. **Reference Consultation**: ALWAYS check `references/basics.md` for syntax patterns.

## References

- [Basics](./references/basics.md): Doc blocks, exposures, and description best practices.

## Rules

- Document fields where they are first introduced (DRY principle).
- Use doc blocks for descriptions that appear in multiple places.
- Every exposure MUST have `type`, `depends_on`, and `owner`.
- Describe business purpose, not just technical details.
- Refer to `read-docs` to verify existing documentation before modification.

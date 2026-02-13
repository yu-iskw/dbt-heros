---
name: manage-adr
description: Manage Architecture Decision Records (ADRs). Use this to initialize, create, list, and link ADRs to document architectural evolution. Requires 'adr-tools' to be installed.
---

# Manage Architecture Decision Records (ADRs)

Architecture Decision Records (ADRs) are a lightweight way to document the "why" behind significant technical choices.

## When to Use

- When making a significant architectural change.
- When choosing between multiple technical approaches.
- When standardizing a pattern across the codebase.
- When you want to understand previous design decisions (use `list`).

## Instructions

### 1. Initialization

If ADRs are not yet initialized in the project, run:

```bash
adr init docs/adr
```

This ensures records are created in `docs/adr`.

### 2. Creating a New ADR

To create a new ADR, use the provided script to ensure non-interactive creation:

```bash
.claude/skills/manage-adr/scripts/create-adr.sh "Title of the ADR"
```

After creation, the script will output the filename. You **MUST** then edit the file to fill in the Context, Decision, and Consequences.

### 3. Superseding an ADR

If a new decision replaces an old one, use the `-s` flag:

```bash
.claude/skills/manage-adr/scripts/create-adr.sh -s <old-adr-number> "New Decision Title"
```

### 4. Linking ADRs

To link two existing ADRs (e.g., ADR 12 amends ADR 10):

```bash
adr link 12 Amends 10 "Amended by"
```

### 5. Listing and Viewing

- List all ADRs: `adr list`
- Read a specific ADR: `read_file docs/adr/NNNN-title.md`

### 6. Generating Reports

- Generate a Table of Contents: `adr generate toc`
- Generate a dependency graph (requires Graphviz): `adr generate graph | dot -Tpng -o adr-graph.png`

### 7. Adding Visualizations with Mermaid

Use Mermaid diagrams to visualize architectural decisions, system designs, and relationships. Diagrams render automatically in GitHub and most Markdown viewers.

#### When to Add Diagrams

- **System Architecture**: Show component relationships, data flow, and system boundaries
- **Software Architecture**: Illustrate module organization, package dependencies, and code structure
- **Sequence Diagrams**: Document interaction flows, API call sequences, or decision processes
- **Concept Diagrams**: Visualize abstract concepts, relationships, or decision trees
- **State Diagrams**: Show state transitions, workflows, or lifecycle processes
- **Class/Type Diagrams**: Document type relationships, hierarchies, or interfaces

#### How to Add Diagrams

1. **Place diagrams** in the "Decision" or "Architecture" section of your ADR
2. **Use code blocks** with `mermaid` language identifier:

```markdown
### Architecture

\`\`\`mermaid
graph TB
A[Component A] --> B[Component B]
B --> C[Component C]
\`\`\`
```

1. **Provide context**: Add a brief description before the diagram explaining what it visualizes
2. **Keep focused**: One diagram per concept - create multiple diagrams if needed

#### Diagram Examples

See `references/mermaid-diagrams.md` for comprehensive examples including:

- System architecture diagrams
- Software architecture diagrams
- Sequence diagrams
- Concept diagrams
- Component diagrams
- State diagrams
- Class/type diagrams
- Common patterns (before/after, decision flows, dependency graphs)

#### Quick Reference

Common diagram types for ADRs:

- **`graph TB`** or **`graph LR`**: System/software architecture, component relationships
- **`sequenceDiagram`**: Interaction flows, API sequences, decision processes
- **`flowchart TD`**: Decision trees, workflows, process flows
- **`stateDiagram-v2`**: State transitions, lifecycle processes
- **`classDiagram`**: Type relationships, class hierarchies

## Best Practices

- Keep ADRs focused on a single decision.
- Write for future maintainers who lack current context.
- Update the status and links when decisions change.
- **Use Mermaid diagrams** to visualize complex decisions, architectures, and relationships. See section 7 above for guidance.
- Refer to `references/mermaid-diagrams.md` for diagram examples and patterns.
- Refer to `references/adr-concepts.md` for more details on the ADR philosophy (if available).
- Use the template in `assets/template.md` as a guide (if available).

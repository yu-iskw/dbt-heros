# Context Management Best Practices

Effective context management is critical for agent performance and cost efficiency.

## Core Principles

1. **Provide only necessary context** - More context ≠ better performance
2. **Structure context for scanning** - Use clear hierarchies and summaries
3. **Refresh context strategically** - Update when state changes, not every turn
4. **Use progressive disclosure** - Start high-level, dive deeper as needed

## Context Layers

### Layer 1: Agent Role & Boundaries (Always Present)

```markdown
## Role

[Single-sentence purpose]

## Responsibilities

- [Specific task 1]
- [Specific task 2]

## Out of Scope

- [What this agent does NOT do]
```

### Layer 2: Invocation Context (Per-Task)

```markdown
## Current Task

[User request + specific constraints]

## Success Criteria

- [Measurable outcome 1]
- [Measurable outcome 2]
```

### Layer 3: Domain Context (On-Demand)

```markdown
## Progressive Disclosure

- Quick reference: `references/quick-start.md`
- Detailed specs: `references/detailed-guide.md`
- Examples: `assets/templates/example.md`
```

## Context Patterns

### Pattern 1: Retrieval-Augmented Generation (RAG)

**When:** Large knowledge base, specific queries
**How:** Store references externally, retrieve relevant sections on demand

```markdown
## Knowledge Base

- Architecture decisions: `references/architecture/*.md`
- API specifications: `references/api/*.md`
- Examples: `assets/examples/*.md`

Agent reads specific files based on current need.
```

### Pattern 2: Summarization Chains

**When:** Long documents, multi-step analysis
**How:** Summarize progressively, maintain key points

```markdown
## Document Analysis

1. Read full document
2. Generate summary (key points only)
3. Use summary for decision-making
4. Return to full text only if needed
```

### Pattern 3: State Management

**When:** Multi-turn workflows, complex operations
**How:** Use task lists and status tracking

```markdown
## Workflow State

- [ ] Step 1: Validate input
- [x] Step 2: Process data (completed)
- [ ] Step 3: Generate output

Agent maintains state across turns without re-reading full context.
```

### Pattern 4: Hierarchical Context

**When:** Complex domains, multiple abstraction levels
**How:** Structure context from high-level to detailed

```markdown
## Context Hierarchy

1. System overview (always present)
2. Component details (on-demand, link-based)
3. Implementation specifics (retrieved when needed)
```

## Anti-Patterns

### ❌ Context Dumping

**Problem:** Providing all possible context upfront
**Impact:** Increased latency, cost, reduced focus
**Solution:** Use progressive disclosure with explicit references

### ❌ Context Starvation

**Problem:** Insufficient context for decision-making
**Impact:** Poor decisions, repeated clarification requests
**Solution:** Ensure core context (role, task, success criteria) is always present

### ❌ Stale Context

**Problem:** Reusing outdated context across tasks
**Impact:** Incorrect assumptions, wasted work
**Solution:** Refresh context when environment or requirements change

### ❌ Implicit Context

**Problem:** Assuming agent remembers previous interactions
**Impact:** Inconsistent behavior, confusion
**Solution:** Make all necessary context explicit in each invocation

## Context Sizing Guidelines

### Simple Skill

- **Role definition:** 50-100 words
- **Task context:** 50-200 words
- **References:** 2-5 links to detailed docs
- **Total:** ~300-500 words

### Sub-Agent

- **Role definition:** 100-200 words
- **Task context:** 100-300 words
- **Domain knowledge:** 500-1000 words (via references)
- **Examples:** 1-3 concrete examples
- **Total:** ~700-1500 words core + references

### Agent Team

- **Coordinator role:** 100-200 words
- **Member roles:** 50-100 words each
- **Coordination rules:** 200-300 words
- **Task context:** 100-300 words
- **Total:** ~500-1000 words core + member contexts

## Context Optimization Checklist

- [ ] Role and boundaries are clear and concise
- [ ] Task description includes success criteria
- [ ] Detailed information is linked, not inline
- [ ] Examples are concrete and minimal
- [ ] No redundant or duplicate information
- [ ] Context updates only when state changes
- [ ] Progressive disclosure pattern is used
- [ ] Agent can scan and find relevant info quickly

## Measuring Context Efficiency

**Good indicators:**

- Agent completes task without clarification requests
- Context tokens < 5000 for simple tasks
- Context tokens < 15000 for complex tasks
- Agent references specific sections when needed

**Warning signs:**

- Frequent "I need more information" responses
- Agent ignores available context
- High token usage with low task completion
- Agent re-reads same context repeatedly

## References

- Progressive disclosure patterns: `skill-progressive-disclosure.md`
- Agent delegation: `subagent-delegation.md`
- Anthropic: Building Effective Agents - Context Management Section

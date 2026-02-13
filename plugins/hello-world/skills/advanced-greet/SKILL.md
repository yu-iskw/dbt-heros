# Advanced Greet

A comprehensive example of a Claude Code skill demonstrating input handling, progressive disclosure, and clear behavioral instructions.

## Purpose

Greets a specified target with high warmth and professional courtesy. Use this as a reference for implementing your own skills.

## Inputs

- `$ARGUMENTS`: The primary input string. Can contain the name of the person or entity to greet.
- `target`: (Optional) Explicitly named parameter if invoked via agent tool-use.

## Behavior

1. **Input Resolution**:
   - Check if a `target` parameter was provided by the agent.
   - If not, parse `$ARGUMENTS` to find a greeting target.
   - If both are empty, default to `world`.

2. **Tone Selection**:
   - If the input contains words like "formal" or "sir/madam", use a formal tone.
   - Otherwise, maintain a friendly, professional default tone.

3. **Greeting Execution**:
   - Construct a message: `Hello, [target]! Welcome to the Claude Code plugin ecosystem.`

## Progressive Disclosure

For more advanced usage and internal details, see the following:

- `README.md`: Project-level documentation.
- `examples/`: Additional usage patterns (if available).

## Examples

- `/hello-world Alice` -> "Hello, Alice! Welcome to the Claude Code plugin ecosystem."
- `/hello-world` -> "Hello, world! Welcome to the Claude Code plugin ecosystem."

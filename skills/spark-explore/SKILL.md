---
name: spark-explore
description: Use when exploring codebases, finding files by patterns, searching code for keywords, or answering questions about codebase structure and logic. Best for codebase exploration and deep research tasks requiring more than 3 queries.
allowed-tools: Bash(${CLAUDE_PLUGIN_ROOT}/skills/spark-explore/*)
---

# Codebase Exploration with Codex Spark

Uses gpt-5.3-codex-spark via Codex CLI in a read-only sandbox. Runs as a separate process, consuming zero main context.

## When to Use

```dot
digraph {
  "Need codebase exploration" -> "Already know the file path?";
  "Already know the file path?" -> "Use Read/Glob directly" [label="yes"];
  "Already know the file path?" -> "Simple search (1-2 queries)?" [label="no"];
  "Simple search (1-2 queries)?" -> "Use Glob/Grep directly" [label="yes"];
  "Simple search (1-2 queries)?" -> "Use spark-explore" [label="no"];
}
```

## Execution

Pass a specific, detailed query to the script:

```bash
${CLAUDE_PLUGIN_ROOT}/skills/spark-explore/scripts/spark-explore.sh "$ARGUMENTS"
```

If `$ARGUMENTS` is empty, formulate the query yourself based on what you need to explore.

**Good queries:**
- "Find all authentication middleware and trace the request validation flow"
- "List files handling database connections and explain the pooling strategy"
- "What patterns are used for error handling in src/api/?"

**Bad queries:**
- "explore the codebase" (too vague)
- "find files" (no specifics)

For complex exploration, run multiple script calls in parallel with different focused queries rather than one broad query.

Present the output directly to the user.

## Error Handling

- Auth error → tell user to run `codex login`
- `command not found` → tell user to install Codex CLI (`npm i -g @openai/codex`)
- Empty/unhelpful output → reformulate with more specific terms, or fall back to Glob/Grep

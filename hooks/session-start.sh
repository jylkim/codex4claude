#!/usr/bin/env bash
set -euo pipefail

cat <<'EOF'
{"additionalContext":"For codebase exploration and deep research tasks, use the `spark-explore` skill (via Skill tool) INSTEAD of the Explore subagent (Task tool with subagent_type=Explore). The spark-explore skill uses Codex Spark for zero-context-cost exploration and produces higher quality results. Only fall back to the Explore subagent if spark-explore is unavailable or errors out."}
EOF

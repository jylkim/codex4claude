#!/usr/bin/env bash
set -euo pipefail

cat <<'EOF'
{"additionalContext":"<EXTREMELY_IMPORTANT>\nYou have the `spark-explore` skill available. You MUST use it INSTEAD of the Explore subagent (Task tool with subagent_type=Explore) for ALL codebase exploration and deep research tasks.\n\n- NEVER use `Task` with `subagent_type=Explore`. ALWAYS use the `Skill` tool with `spark-explore` instead.\n- spark-explore uses Codex Spark in a read-only sandbox, consuming zero main context.\n- Only fall back to the Explore subagent if spark-explore errors out.\n\nThis is not optional. If you catch yourself about to spawn an Explore subagent, STOP and use spark-explore.\n</EXTREMELY_IMPORTANT>"}
EOF

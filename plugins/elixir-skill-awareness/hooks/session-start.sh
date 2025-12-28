#!/bin/bash
set -euo pipefail

PLUGIN_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

# Read the using-elixir-skills SKILL.md
skill_content=$(cat "${PLUGIN_ROOT}/skills/using-elixir-skills/SKILL.md" 2>&1 || echo "Error reading skill")

# Escape for JSON
skill_escaped=$(echo "$skill_content" | sed 's/\\/\\\\/g' | sed 's/"/\\"/g' | sed ':a;N;$!ba;s/\n/\\n/g')

cat <<EOF
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "<ELIXIR_SKILL_AWARENESS>\n${skill_escaped}\n</ELIXIR_SKILL_AWARENESS>"
  }
}
EOF

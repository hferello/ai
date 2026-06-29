#!/bin/bash
# Hook: PreToolUse (Bash)
# Injects lightweight planning context when a feature plan is active.

set -euo pipefail

INPUT="$(cat)"

if ! command -v python3 >/dev/null 2>&1; then
  exit 0
fi

python3 - <<'PY' "$INPUT"
import json
import os
import sys
from pathlib import Path

raw = sys.argv[1]
try:
    payload = json.loads(raw)
except Exception:
    sys.exit(0)

cwd = payload.get("cwd")
if not isinstance(cwd, str) or not cwd:
    cwd = os.getcwd()

features_dir = Path(cwd) / "features"
if not features_dir.is_dir():
    sys.exit(0)

has_plan = False
for task_dir in features_dir.iterdir():
    if not task_dir.is_dir():
        continue
    if (task_dir / "task_plan.md").is_file() or (task_dir / "overview.md").is_file():
        has_plan = True
        break

if not has_plan:
    sys.exit(0)

output = {
    "hookSpecificOutput": {
        "hookEventName": "PreToolUse",
        "permissionDecision": "allow",
        "additionalContext": (
            "Feature planning is active in this repo. Before major decisions, "
            "re-read the active plan and update progress/findings docs as work advances."
        ),
    }
}
print(json.dumps(output))
PY

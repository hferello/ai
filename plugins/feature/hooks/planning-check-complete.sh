#!/bin/bash
# Hook: Stop
# Emits planning reminders when feature plans are in progress.

set -euo pipefail

INPUT="$(cat)"

if ! command -v python3 >/dev/null 2>&1; then
  exit 0
fi

python3 - <<'PY' "$INPUT"
import json
import os
import subprocess
import sys
from pathlib import Path

raw = sys.argv[1]
try:
    payload = json.loads(raw)
except Exception:
    sys.exit(0)

# Avoid repeated stop-hook loops if a parent hook chain is active.
if payload.get("stop_hook_active"):
    sys.exit(0)

cwd = payload.get("cwd")
if not isinstance(cwd, str) or not cwd:
    cwd = os.getcwd()

root = Path(cwd)
features_dir = root / "features"
if not features_dir.is_dir():
    sys.exit(0)

plugin_root = os.environ.get("CLAUDE_PLUGIN_ROOT")
if plugin_root:
    check_script = Path(plugin_root) / "skills" / "feature" / "scripts" / "check-complete.sh"
else:
    # Fallback for environments that do not expose CLAUDE_PLUGIN_ROOT.
    check_script = Path(__file__).resolve().parents[1] / "skills" / "feature" / "scripts" / "check-complete.sh"

if not check_script.is_file():
    print("[feature] check-complete.sh not found in plugin bundle.")
    sys.exit(0)

ran_check = False
for task_dir in sorted(features_dir.iterdir()):
    if not task_dir.is_dir():
        continue

    task_plan = task_dir / "task_plan.md"
    if task_plan.is_file():
        ran_check = True
        subprocess.run([str(check_script), str(task_plan)], cwd=str(root), check=False)
        continue

    # Phased plans do not use task_plan.md; emit lightweight reminder.
    if (task_dir / "overview.md").is_file():
        print(f"[feature] {task_dir.name}: phased plan detected. Update overview.md and current phase file before stopping.")

if not ran_check:
    print("[feature] No task_plan.md plans found for completion checks.")
PY

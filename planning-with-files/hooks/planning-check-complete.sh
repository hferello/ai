#!/bin/bash
# Hook: stop
# Runs check-complete for each active planning task. Output appears in Cursor Hooks panel.

set -e

# Path to check-complete script (relative to this hook's parent)
HOOK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CHECK_SCRIPT="$HOOK_DIR/../scripts/check-complete.sh"

if [ ! -x "$CHECK_SCRIPT" ]; then
  echo "[planning-with-files] check-complete.sh not found or not executable."
  exit 0
fi

export PLANNING_CHECK_SCRIPT="$CHECK_SCRIPT"

# Read hook payload
INPUT=$(cat)

# Find planning task folders and run check-complete on each
if command -v python3 >/dev/null 2>&1; then
  echo "$INPUT" | python3 -c "
import json, sys, os, subprocess

try:
    data = json.load(sys.stdin)
    roots = data.get('workspace_roots', [])
    check_script = os.environ.get('PLANNING_CHECK_SCRIPT', '')
    for root in roots:
        pwf = os.path.join(root, 'planning-with-files')
        if os.path.isdir(pwf):
            for name in sorted(os.listdir(pwf)):
                task_dir = os.path.join(pwf, name)
                plan_file = os.path.join(task_dir, 'task_plan.md')
                if os.path.isfile(plan_file):
                    subprocess.run([check_script, plan_file], cwd=root)
except Exception as e:
    print(f'[planning-with-files] Hook error: {e}', file=sys.stderr)
" 2>/dev/null
else
  # Fallback: check common project root (current dir when Cursor runs hooks)
  for plan in planning-with-files/*/task_plan.md; do
    [ -f "$plan" ] && "$CHECK_SCRIPT" "$plan" || true
  done
fi

exit 0

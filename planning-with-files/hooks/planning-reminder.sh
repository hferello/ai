#!/bin/bash
# Hook: beforeShellExecution / beforeMCPExecution
# If planning-with-files is active, inject a short agent reminder (no re-read).
# Keeps messages minimal to avoid token bloat.

set -e

# Read hook payload from stdin
INPUT=$(cat)

# Default: allow and continue with no message
OUTPUT='{"continue":true,"permission":"allow"}'

# Use Python for reliable JSON parsing (available on macOS/Linux)
HAS_PLANNING="0"
if command -v python3 >/dev/null 2>&1; then
  HAS_PLANNING=$(echo "$INPUT" | python3 -c "
import json, sys, os
try:
    data = json.load(sys.stdin)
    roots = data.get('workspace_roots', [])
    for root in roots:
        pwf = os.path.join(root, 'planning-with-files')
        if os.path.isdir(pwf):
            for name in os.listdir(pwf):
                task_dir = os.path.join(pwf, name)
                if os.path.isdir(task_dir) and os.path.isfile(os.path.join(task_dir, 'task_plan.md')):
                    print('1')
                    sys.exit(0)
    print('0')
except Exception:
    print('0')
" 2>/dev/null || echo "0")
fi

if [ "$HAS_PLANNING" = "1" ]; then
  # Short reminder; avoid 're-read' wording to limit token use
  OUTPUT='{"continue":true,"permission":"allow","agentMessage":"Planning active: update progress.md and task_plan.md when you finish a phase."}'
fi

echo "$OUTPUT"

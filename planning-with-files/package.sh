#!/bin/bash
# Create a distributable zip of the planning-with-files skill
# Output: planning-with-files-cursor-skill.zip (in parent directory)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
OUTPUT_DIR="$(dirname "$SKILL_ROOT")"
ZIP_NAME="planning-with-files-cursor-skill.zip"

cd "$(dirname "$SKILL_ROOT")"
zip -r "$OUTPUT_DIR/$ZIP_NAME" "$(basename "$SKILL_ROOT")" -x "*.git*" -x "*.DS_Store"

echo "Created: $OUTPUT_DIR/$ZIP_NAME"
echo ""
echo "To share: upload this zip or the skill folder to GitHub."
echo "Recipients can: unzip and run ./install.sh"

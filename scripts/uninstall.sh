#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-both}"
SCOPE="${2:-user}"

if [[ "$SCOPE" == "user" ]]; then
  CODEX_DEST="$HOME/.codex/skills/pak-jaew"
  CLAUDE_DEST="$HOME/.claude/skills/pak-jaew"
else
  CODEX_DEST="$PWD/.codex/skills/pak-jaew"
  CLAUDE_DEST="$PWD/.claude/skills/pak-jaew"
fi

remove_skill() {
  local destination="$1"
  if [[ -d "$destination" ]]; then
    rm -rf "$destination"
    printf 'Removed %s\n' "$destination"
  else
    printf 'Not installed: %s\n' "$destination"
  fi
}

[[ "$TARGET" == "codex" || "$TARGET" == "both" ]] && remove_skill "$CODEX_DEST"
[[ "$TARGET" == "claude" || "$TARGET" == "both" ]] && remove_skill "$CLAUDE_DEST"

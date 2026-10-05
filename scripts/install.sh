#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-both}"
SCOPE="${2:-user}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
SOURCE_DIR="$ROOT_DIR/skills/pak-jaew"

usage() {
  cat <<'TXT'
Usage: ./scripts/install.sh [codex|claude|both] [user|project]

Examples:
  ./scripts/install.sh both user
  ./scripts/install.sh codex project
  ./scripts/install.sh claude project
TXT
}

if [[ "$TARGET" != "codex" && "$TARGET" != "claude" && "$TARGET" != "both" ]]; then
  usage
  exit 2
fi
if [[ "$SCOPE" != "user" && "$SCOPE" != "project" ]]; then
  usage
  exit 2
fi

copy_skill() {
  local destination="$1"
  mkdir -p "$(dirname "$destination")"
  rm -rf "$destination"
  cp -R "$SOURCE_DIR" "$destination"
  printf 'Installed pak-jaew -> %s\n' "$destination"
}

if [[ "$SCOPE" == "user" ]]; then
  CODEX_DEST="$HOME/.codex/skills/pak-jaew"
  CLAUDE_DEST="$HOME/.claude/skills/pak-jaew"
else
  CODEX_DEST="$PWD/.codex/skills/pak-jaew"
  CLAUDE_DEST="$PWD/.claude/skills/pak-jaew"
fi

if [[ "$TARGET" == "codex" || "$TARGET" == "both" ]]; then
  copy_skill "$CODEX_DEST"
fi
if [[ "$TARGET" == "claude" || "$TARGET" == "both" ]]; then
  copy_skill "$CLAUDE_DEST"
fi

printf '\nDone. Restart the agent session if it was already open.\n'
printf 'Try: Use pak-jaew mode=pak-jaew intensity=3 language=th\n'

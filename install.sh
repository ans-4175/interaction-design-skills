#!/usr/bin/env bash
# Install the interaction-design skill for Claude Code and other agents that read ~/.agents/skills.
#   ./install.sh            symlink (edits in this repo apply immediately)
#   ./install.sh --copy     copy instead (for machines where the repo won't stay)
#   ./install.sh --uninstall
set -euo pipefail
NAME=interaction-design
SRC="$(cd "$(dirname "$0")" && pwd)/skills/$NAME"
MODE="${1:-link}"

# Claude Code reads $CLAUDE_CONFIG_DIR/skills (default ~/.claude); other agents read ~/.agents/skills.
TARGETS=("$HOME/.agents/skills" "$HOME/.claude/skills")
if [ -n "${CLAUDE_CONFIG_DIR:-}" ] && [ "$CLAUDE_CONFIG_DIR" != "$HOME/.claude" ]; then
  TARGETS+=("$CLAUDE_CONFIG_DIR/skills")
fi

for dir in "${TARGETS[@]}"; do
  dest="$dir/$NAME"
  if [ "$MODE" = "--uninstall" ]; then
    if [ -L "$dest" ]; then rm "$dest" && echo "removed $dest"; fi
    continue
  fi
  mkdir -p "$dir"
  # Never overwrite a real folder; it may hold someone's own edits.
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "skip $dest (exists and is not a symlink)"; continue
  fi
  rm -f "$dest"
  if [ "$MODE" = "--copy" ]; then
    cp -R "$SRC" "$dest" && echo "copied -> $dest"
  else
    ln -s "$SRC" "$dest" && echo "linked $dest -> $SRC"
  fi
done
echo "done. Restart your agent session, then run /$NAME."

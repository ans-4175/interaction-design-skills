#!/usr/bin/env bash
# Install the interaction-design skill for Claude Code and other agents that read ~/.agents/skills.
#   ./install.sh            symlink (edits in this repo apply immediately)
#   ./install.sh --copy     copy instead (for machines where the repo won't stay)
#   ./install.sh --uninstall
#   curl -fsSL https://raw.githubusercontent.com/ans-4175/interaction-design-skills/main/install.sh | bash
set -euo pipefail
NAME=interaction-design
REPO=ans-4175/interaction-design-skills
MODE="${1:-link}"
HERE="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || true)"
SRC="$HERE/skills/$NAME"

# Piped from curl (no repo on disk): fetch the tarball and copy, since a temp dir can't be linked.
if [ ! -f "$SRC/SKILL.md" ] && [ "$MODE" != "--uninstall" ]; then
  TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
  curl -fsSL "https://codeload.github.com/$REPO/tar.gz/refs/heads/main" | tar -xz -C "$TMP"
  SRC="$(echo "$TMP"/*/skills/$NAME)"
  MODE=--copy
fi

# Claude Code reads $CLAUDE_CONFIG_DIR/skills (default ~/.claude); other agents read ~/.agents/skills.
TARGETS=("$HOME/.agents/skills" "$HOME/.claude/skills")
if [ -n "${CLAUDE_CONFIG_DIR:-}" ] && [ "$CLAUDE_CONFIG_DIR" != "$HOME/.claude" ]; then
  TARGETS+=("$CLAUDE_CONFIG_DIR/skills")
fi

for dir in "${TARGETS[@]}"; do
  dest="$dir/$NAME"
  if [ "$MODE" = "--uninstall" ]; then
    if [ -L "$dest" ] || [ -f "$dest/.installed-by-interaction-design" ]; then rm -rf "$dest" && echo "removed $dest"; fi
    continue
  fi
  mkdir -p "$dir"
  # Never overwrite a real folder unless this script made it; it may hold someone's own edits.
  if [ -e "$dest" ] && [ ! -L "$dest" ] && [ ! -f "$dest/.installed-by-interaction-design" ]; then
    echo "skip $dest (exists and is not a symlink)"; continue
  fi
  rm -rf "$dest"
  if [ "$MODE" = "--copy" ]; then
    cp -R "$SRC" "$dest" && touch "$dest/.installed-by-interaction-design" && echo "copied -> $dest"
  else
    ln -s "$SRC" "$dest" && echo "linked $dest -> $SRC"
  fi
done
echo "done. Restart your agent session, then run /$NAME."

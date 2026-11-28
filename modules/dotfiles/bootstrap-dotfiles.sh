#!/usr/bin/env bash
set -euo pipefail

HOME_DIR="$1"
USER_NAME="$2"
DOTFILES="$3"

MARKER="$HOME_DIR/.dotfiles-installed"

[[ -e "$MARKER" ]] && exit 0

runuser -u "$USER_NAME" -- cp -r "$DOTFILES/home/." "$HOME_DIR"/

runuser -u "$USER_NAME" -- chmod -R u+rwX "$HOME_DIR/.config"

runuser -u "$USER_NAME" -- touch "$MARKER"

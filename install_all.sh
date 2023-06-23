#!/usr/bin/env zsh

# ---------------------------------------------------------------------
# Script setup
# ---------------------------------------------------------------------

log_begin() {
  echo "Installing: $1"
}

log_end() {
  echo "Done installing: $1"
  echo "-------------------"
}

# We need XDG paths and $DOTFILES_REPO_PATH
source .zshenv

# ---------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------

for app_path in $(find "$DOTFILES_REPO_PATH/apps" -type f -name 'install' | sort); do
  . "$app_path"
done

unset app_path

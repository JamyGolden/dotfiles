#!/usr/bin/env zsh

# We need XDG paths and $DOTFILES_REPO_PATH
. "./.zshenv"

symlink() {
  target_path="$1"
  destination_path="$2"

  if [ -h "$destination_path" ]; then
     rm "$destination_path"
  fi

  ln -s "$target_path" "$destination_path"
  echo "Symlink created from $target_path to $destination_path"
}

symlink_to_home() {
  target_path="$DOTFILES_REPO_PATH/$1"
  destination_path="$HOME/$1"

  symlink "$target_path" "$destination_path"
}

# XDG_CONFIG_HOME dirs
# --------------------
symlink_to_home ".config/alacritty"
symlink_to_home ".config/git"
symlink_to_home ".config/ideavim"
symlink_to_home ".config/nvim"
symlink_to_home ".config/readline"
symlink_to_home ".config/stylelua"
symlink_to_home ".config/tmux"
symlink_to_home ".config/zsh"
symlink_to_home ".config/starship.toml"

# zsh
# -----------------
symlink_to_home ".zshenv"

# Fix for intellij which doesn't use zshell correctly
if [[ "$OS_TYPE" == "debian" ]]; then
  symlink_to_home ".profile"
fi

# Mac only
# --------
if [[ "$OS_TYPE" == "mac" ]]; then
  symlink ".config/LaunchAgents/xdg-env-launch-agent.plist" "$HOME/Library/LaunchAgents/xdg-env-launch-agent.plist"
fi

# General scripts on $PATH
# ------------------------
mkdir -p "$XDG_BIN_HOME"
symlink_to_home ".local/bin/parallel-commands"
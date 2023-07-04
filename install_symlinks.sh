#!/usr/bin/env zsh

# We need XDG paths and $DOTFILES_REPO_PATH
. zshenv

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

# z and zsh secrets
# -----------------
symlink_to_home ".zshenv"
# .profile
if [[ $IS_MAC == 0 ]]; then
  symlink_to_home ".profile"
fi

# z secrets
symlink "$DOTFILES_REPO_PATH/secrets/.z_secrets" "$HOME/.config/zsh/.z_secrets"

# zsh secrets
symlink "$DOTFILES_REPO_PATH/secrets/.zsh_secrets" "$HOME/.config/zsh/.zsh_secrets"

# Mac only
# --------
if [[ $IS_MAC == 1 ]]; then
  symlink ".config/LaunchAgents/xdg-env-launch-agent.plist" "$HOME/Library/LaunchAgents/xdg-env-launch-agent.plist"
fi

# General scripts on $PATH
# ------------------------
mkdir -p "$HOME/.local/bin"
symlink_to_home ".local/bin/parallel-commands"

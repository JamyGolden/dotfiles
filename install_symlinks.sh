#!/usr/bin/env zsh

script_path=${(%):-%x} # Current file relative path
script_path=$(readlink -f $script_path) # Current file absolute path
DOTFILES_PATH=${script_path%/*} # Parent directory absolute path

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
  target_path="$DOTFILES_PATH/$1"
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
# .profile and .zprofile
if [[ $IS_MAC == 0 ]]; then
  symlink "$DOTFILES_PATH/.zprofile" "$HOME/.profile"
fi
symlink_to_home ".zshenv"

# z secrets
symlink "$DOTFILES_PATH/secrets/.z_secrets" "$XDG_CONFIG_HOME/zsh/.z_secrets"

# zsh secrets
symlink "$DOTFILES_PATH/secrets/.zsh_secrets" "$XDG_CONFIG_HOME/zsh/.zsh_secrets"

# Mac only
# --------
if [[ $IS_MAC == 1 ]]; then
  symlink ".config/LaunchAgents/xdg-env-launch-agent.plist" "$HOME/Library/LaunchAgents/xdg-env-launch-agent.plist"
fi

# General scripts on $PATH
# ------------------------
mkdir -p "$HOME/.local/bin"
symlink_to_home ".local/bin/parallel-commands"

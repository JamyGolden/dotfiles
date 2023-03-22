#!/usr/bin/env zsh

script_path=${(%):-%x}
DOTFILES_PATH=${script_path%/*}

symlink_to_home() {
  local_path="$1"
  destination_path="$HOME/$1"

  if [ -h "$destination_path" ]; then
     rm "$HOME/$1"
  fi

  ln -s "$DOTFILES_PATH/$1" "$destination_path"
}

# nvim
# ----
symlink_to_home ".config/nvim"

# General scripts on $PATH
# ------------------------
mkdir -p "$HOME/.local/bin"
symlink_to_home ".local/bin/parallel-commands"

# Tmux
# ----
symlink_to_home ".local/bin/tmux-sessionizer"
symlink_to_home ".tmux.conf"

# zsh
# ---

# z
if [ -d "$HOME/.z_dotfiles" ]; then
  rm -r "$HOME/.z_dotfiles"
fi
mkdir "$HOME/.z_dotfiles"
ln -s "$DOTFILES_PATH/secrets/.z_secrets" "$HOME/.z_dotfiles/.z_secrets"

# zsh
symlink_to_home ".zsh_dotfiles"
if [ -h "$HOME/.zsh_dotfiles/.zsh_secrets" ]; then
  rm "$HOME/.zsh_dotfiles/.zsh_secrets"
fi
ln -s "$DOTFILES_PATH/secrets/.zsh_secrets" "$HOME/.zsh_dotfiles/.zsh_secrets"

# Single files
# ------------
symlink_to_home ".gitignore_global"
symlink_to_home ".ideavimrc"
symlink_to_home ".gitconfig"
symlink_to_home ".zprofile"
symlink_to_home ".zshrc"
symlink_to_home ".inputrc"
symlink_to_home ".config/alacritty"

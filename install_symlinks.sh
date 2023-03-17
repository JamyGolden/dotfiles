#!/usr/bin/env zsh

script_path=${(%):-%x}
DOTFILES_PATH=${script_path%/*}

symlink_to_home() {
  local_path="$1"

  rm "$HOME/$1"
  ln -s "$DOTFILES_PATH/$1" "$HOME/$1"
}

# nvim
symlink_to_home ".config/nvim"

# General scripts on $PATH
mkdir -p "$HOME/.local/bin"
symlink_to_home ".local/bin/parallel-commands"

# Tmux
symlink_to_home ".local/bin/tmux-sessionizer"
symlink_to_home ".tmux.conf"

# zsh
if [ ! -d "$HOME/.z_dotfiles" ]; then
  mkdir "$HOME/.z_dotfiles"
fi
rm "$HOME/.z_dotfiles/.z_secrets"
ln -s "$DOTFILES_PATH/secrets/.z_secrets" "$HOME/.z_dotfiles/.z_secrets"

symlink_to_home ".zsh_dotfiles"
ln -s "$DOTFILES_PATH/secrets/.zsh_secrets" "$HOME/.zsh_dotfiles/.zsh_secrets"

# Single files
symlink_to_home ".gitignore_global"
symlink_to_home ".ideavimrc"
symlink_to_home ".gitconfig"
symlink_to_home ".zprofile"
symlink_to_home ".zshrc"
symlink_to_home ".inputrc"

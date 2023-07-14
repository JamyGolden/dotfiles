#!/usr/bin/env bash

if [[ "$OS_TYPE" == "mac" ]]; then
  # Install xcode and related cli tools
  xcode-select --install
elif [[ "$OS_TYPE" == "debian" ]]; then
  apt_to_install=(
    "build-essential"
    "curl"
    "git-all"
    "libfuse2"
    "libssl-dev"
    "xsel"
  )
  apt_gui_to_install=(
    "gparted"
  )
  sudo apt update
  sudo apt install -y "${apt_to_install[@]}"
  sudo apt install -y "${apt_gui_to_install[@]}"

  # zsh
  # Install and use z shell
  # -----------------------
  sudo apt install zsh
  chsh -s $(which zsh)
fi

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

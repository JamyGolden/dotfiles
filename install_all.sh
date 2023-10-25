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

# Set architecture type to install correct binaries
ARCH_TYPE="$(uname -m)"
if [ "$ARCH_TYPE" == "x86_64" ]; then
  ARCH_TYPE=x86_64
elif [[ "$ARCH" == aarch* ]]; then
  ARCH_TYPE=arm64
else
  echoerr "unsupported arch: $ARCH"
  exit 1
fi

# ---------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------

for app_path in $(find "$DOTFILES_REPO_PATH/apps" -type f -name "install" | sort); do
  . "$app_path"
done

if [ -s "$DOTFILES_REPO_PATH/secrets/install" ]; then
  . "$DOTFILES_REPO_PATH/secrets/install"
fi

unset app_path
#!/usr/bin/env bash

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
apt update
apt install -y "${apt_to_install[@]}"
apt install -y "${apt_gui_to_install[@]}"

# zsh
# Install and use z shell
# -----------------------
apt install zsh
chsh -s $(which zsh)

# Run common os install script
. install_all.sh

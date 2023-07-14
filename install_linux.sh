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
sudo apt update
sudo apt install -y "${apt_to_install[@]}"
sudo apt install -y "${apt_gui_to_install[@]}"

# zsh
# Install and use z shell
# -----------------------
sudo apt install zsh
chsh -s $(which zsh)

# Run common os install script
. install_all.sh

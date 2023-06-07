#!/usr/bin/env bash

apt_to_install=(
  "build-essential"
  "curl"
  "git-all"
  "libssl-dev"
  "xsel"

  # Required for gvm
  "mercurial"
  "make"
  "binutils"
  "bison"
  "gcc"
)
apt_gui_to_install=(
  "gparted"
)
apt update
apt install -y "${apt_to_install[@]}"
apt install -y "${apt_gui_to_install[@]}"

# ---------------------------------------------------------------------
# CLI tools
# ---------------------------------------------------------------------

# Docker
apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo chmod a+r /etc/apt/keyrings/docker.gpg
apt update # Above line may be required if update gives GPG error
apt -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
systemctl enable docker.service
systemctl enable containerd.service
groupadd docker
sudo usermod -aG docker jamygolden

# ---------------------------------------------------------------------
# GUI apps
# ---------------------------------------------------------------------

# If flatpak doesn't exist, install it
if [ -z $(command -v "flatpak") ]; then
  apt install flatpak
fi

flatpak_apps_to_install=(
  "com.github.tchx84.Flatseal"
  "io.github.Hexchat"
  "io.github.seadve.Kooha"
  "org.openrgb.OpenRGB"
)

flatpak install "${flatpak_apps_to_install[@]}"

# Install and use z shell
apt install zsh
chsh -s $(which zsh)

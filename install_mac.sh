#!/usr/bin/env zsh

# Install xcode and related cli tools
xcode-select --install

# ---------------------------------------------------------------------
# Package managers
# ---------------------------------------------------------------------

# Homebrew
# --------
if [ -z $(command -v "brew") ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew update
brew install mecurial # For gvm

# ---------------------------------------------------------------------
# Other
# ---------------------------------------------------------------------

# Docker
# ------
if [ -z $(command -v "docker") ]; then
  curl -o "$HOME/Downloads/Docker.dmg" "https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64"
  echo "Make sure to install Docker yourself: $HOME/Downloads/Docker.dmg"
  open "$HOME/Downloads"
fi

#!/usr/bin/env zsh

# ---------------------------------------------------------------------
# Package managers
# ---------------------------------------------------------------------

# Homebrew
# --------
if [ -z $(command -v "brew") ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew update

# ---------------------------------------------------------------------
# Other
# ---------------------------------------------------------------------

if [ -z $(command -v "docker") ]; then
  curl -o "$HOME/Downloads/Docker.dmg" "https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64"
  echo "Make sure to install Docker yourself: $HOME/Downloads/Docker.dmg"
fi

#!/usr/bin/env zsh

# ---------------------------------------------------------------------
# Script setup
# ---------------------------------------------------------------------

if [[ $(uname -s) == "Darwin"* ]]; then
  IS_MAC=1
else
  IS_MAC=0
fi

log_begin() {
  echo "Installing: $1"
}

log_end() {
  echo "Done installing: $1"
  echo "-------------------"
}

# We need XDG paths
source .zshenv

# ---------------------------------------------------------------------
# Shell
# ---------------------------------------------------------------------

# Oh my zsh
if [ ! -d "$XDG_CONFIG_HOME/oh-my-zsh" ]; then
  log_begin "oh-my-zsh"

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  log_end "oh-my-zsh"
fi

ohmyzsh_plugins=(
  "zsh-users/zsh-autosuggestions"
  "jeffreytse/zsh-vi-mode"
)
for i in "${ohmyzsh_plugins[@]}"; do
  plugin_github_path=$i
  plugin_name=${i#*/}

  if [ ! -d "$ZSH_CUSTOM/plugins/$plugin_name" ]; then
    log_begin "$plugin_name"

    git clone "https://github.com/$plugin_github_path" \
      "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/$plugin_name"

    log_end "$plugin_name"
  fi
done

# ---------------------------------------------------------------------
# Languages and package managers
# ---------------------------------------------------------------------

# Java
# ----
if [ -z $(command -v "java") ]; then
  if [[ $IS_MAC == 1 ]]; then
    brew install java
    brew info java
    read "?Java must be symlinked, the instructions should be above (if not run `brew info java`). Make sure to symlink before running another install script?"
  else
    apt install default-jre
  fi
fi

# Rust and Cargo
# --------------
if [ -z $(command -v "cargo") ]; then
  log_end "Rust/Cargo"

  curl https://sh.rustup.rs -sSf | sh

  log_end "Rust/Cargo"
fi

# apt/homebrew
# ------------
cli_tools_to_install=(
  "direnv"
  "jq"
  "rename"
  "tmux"
  "trash-cli"
)
for i in "${cli_tools_to_install[@]}"; do
  if [[ -z "$(command -v $i)" ]]; then
    log_begin "$i"

    if [[ $IS_MAC == 1 ]]; then
      brew install $i
    else
      apt install $i
    fi

    log_end "$i"
  fi
done

# gvm/go
# ------
if [[ -z $(command -v "go") && ! -f "$HOME/.gvm/scripts/gvm" ]]; then
  bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

  . "$HOME/.gvm/scripts/gvm"
  gvm install go1.4 -B
  gvm use go.14
  export GOROOT_BOOTSTRAP=$GOROOT
  gvm install go1.20.5
fi

# nvm
# ---
# nvm is initialised via a script, so check dir to test for existance
if [ ! -d "$NVM_DIR" ]; then
  log_begin "nvm"

  if [[ $IS_MAC == 1 ]]; then
    brew install nvm
  else
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
  fi

  log_end "nvm"
fi

# Node and Yarn
# -------------
if [ -z $(command -v "node") ]; then
  log_begin "Node"

  nvm install node

  log_begin "Node"
fi

if [ -z $(command -v "yarn") ]; then
  log_begin "Yarn"

  npm i -g yarn

  log_end "Yarn"
fi

# ---------------------------------------------------------------------
# CLI tools
# ---------------------------------------------------------------------

# Cargo
# -----
cargo_tools_to_install=("exa" "bat" "procs" "ripgrep")

for i in "${cargo_tools_to_install[@]}"; do
  if [[ -z "$(command -v $i)" ]]; then
    log_begin "$1"

    cargo install $i

    log_end "$1"
  fi
done

if [ -z $(command -v "tldr") ]; then # `tealdeer` installs to `tldr`
  log_begin "tealdeer"

  cargo install tealdeer

  log_end "tealdeer"
fi

if [ -z $(command -v "zoxide") ]; then
  log_begin "zoxide"

  cargo install zoxide --locked

  log_end "zoxide"
fi

# fzf
# ---
if [ ! -d "$XDG_CONFIG_HOME/fzf" ]; then
  log_begin "fzf"

  git clone --depth 1 "https://github.com/junegunn/fzf.git" "$XDG_CONFIG_HOME/fzf"
  $XDG_CONFIG_HOME/fzf/install --xdg

  log_end "fzf"
fi

# ---------------------------------------------------------------------
# GUI apps
# ---------------------------------------------------------------------

# "<homebrew install name>|<flatpak install name>" separated by pipe
# Anything added here should provide both the hombrew and flatpak
# install name
gui_apps_to_install=(
  "bitwarden|com.bitwarden.desktop"
  "discord|discordapp"
  "firefox|org.mozilla.firefox"
  "google-chrome|com.google.Chrome"
  "intellij-idea|"
  "signal|org.signal.Signal"
  "slack|com.slack.Slack"
  "sublime-merge|com.sublimemerge.App"
  "sublime-text|com.sublimetext.three"
  "telegram|org.telegram.desktop"
  "vlc|org.videolan.VLC"
  "visual-studio-code|com.visualstudio.code"
  "whatsapp|io.github.mimbrero.WhatsAppDesktop"
)
for i in "${gui_apps_to_install[@]}"; do
  mac_app_name=${i%\|*}
  linux_app_name=${i#*\|}

  if [[ $IS_MAC == 1 ]]; then
    log_begin "$mac_app_name"

    brew install --cask "$mac_app_name"

    log_end "$mac_app_name"
  else
    if [[ -n $linux_app_name && -z "$(flatpak list --app | grep $linux_app_name)" ]]; then
      log_begin "$linux_app_name"

      flatpak install "$linux_app_name"

      log_end "$linux_app_name"
    fi
  fi
done

# ---------------------------------------------------------------------
# Other
# ---------------------------------------------------------------------

# For work
# --------
echo "You should manually install google-cloud-cli: https://cloud.google.com/sdk/docs/install-sdk"
if [[ $IS_MAC == 0 ]]; then
  echo "Install intellij-idea from their site. There are permission issues with flatpak. https://www.jetbrains.com/help/idea/installation-guide.html"
fi

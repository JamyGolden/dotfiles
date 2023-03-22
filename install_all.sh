#!/usr/bin/env zsh

# ---------------------------------------------------------------------
# Shell
# ---------------------------------------------------------------------

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# ---------------------------------------------------------------------
# Languages
# ---------------------------------------------------------------------

# Node and Yarn
# -------------
nvm install node
npm i -g yarn

# Rust and Cargo
# --------------
if [ -z $(command -v "cargo") ]; then
  curl https://sh.rustup.rs -sSf | sh
fi

# ---------------------------------------------------------------------
# CLI tools
# ---------------------------------------------------------------------

# apt/homebrew
# -------
cli_tools_to_install=(
  "jq"
  "neovim"
  "rename"
  "ripgrep"
  "tmux"
)
for i in "${cargo_tools_to_install[@]}"; do
  if [[ -z "$(command -v ${i})" ]]; then
    if [[ $IS_MAC == 1 ]]; then
      brew install ${i}
    else
      apt install ${i}
    fi
  fi
done

# nvm
# ---
if [ -z $(command -v "nvm") ]; then
  if [[ $IS_MAC == 1 ]]; then
    brew install nvm
  else
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
  fi
fi
if [ ! -d "$HOME/.nvm" ]; then
  mkdir $HOME/.nvm
fi

# Cargo
# -----
cargo_tools_to_install=("exa" "bat" "procs")

for i in "${cargo_tools_to_install[@]}"; do
  if [[ -z "$(command -v ${i})" ]]; then
    cargo install ${i}
  fi
done

if [ -z $(command -v "tldr") ]; then # `tealdeer` installs to `tldr`
  cargo install tealdeer
fi

if [ -z $(command -v "zoxide") ]; then
  cargo install zoxide --locked
fi

# tmux
# ----
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  mkdir -p "$HOME/.tmux/plugins/tpm"
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# fzf
# ---
rm -rf "$HOME/.fzf"
git clone --depth 1 "https://github.com/junegunn/fzf.git" "$HOME/.fzf"
$HOME/.fzf/install

# bitwarden
# ---------
npm i -g @bitwarden/cli

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
  "intellij-idea|com.jetbrains.IntelliJ-IDEA-Ultimate"
  "signal|org.signal.Signal"
  "slack|com.slack.Slack"
  "sublime-merge|com.sublimemerge.App"
  "sublime-text|com.sublimetext.three"
  "telegram|org.telegram.desktop"
  "vlc|org.videolan.VLC"
  "vscode|com.visualstudio.code"
  "whatsapp|io.github.mimbrero.WhatsAppDesktop"
)
for i in "${gui_apps_to_install[@]}"; do
  mac_app_name=${i%\|*}
  linux_app_name=${i#*\|}

  if [[ $IS_MAC == 1 ]]; then
    brew install --cask "$mac_app_name"
  else
    flatpak install "$linux_app_name"
  fi
done

# ---------------------------------------------------------------------
# Other
# ---------------------------------------------------------------------

# For work
# --------
echo "You should manually install google-cloud-cli: https://cloud.google.com/sdk/docs/install-sdk"
# XDG
# ---
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ZSH
# ---
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=2000
export SAVEHIST=1000

# ohmyzsh
# -------
export ZSH_CUSTOM="$XDG_CONFIG_HOME/oh-my-zsh/custom"

# Other
# Env vars to XDG
# https://wiki.archlinux.org/title/XDG_Base_Directory
# ---------------------------------------------------
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DVDCSS_CACHE="$XDG_DATA_HOME/dvdcss"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export SCREENRC="$XDG_CONFIG_HOME/screen/screenrc"
export USERXSESSIONRC="$XDG_CACHE_HOME/X11/xsessionrc"
export WINEPREFIX="$XDG_DATA_HOME/wine"
export NVM_DIR="$XDG_DATA_HOME/nvm"

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_STATE_HOME/zsh/history"

# Env vars to XDG
# https://wiki.archlinux.org/title/XDG_Base_Directory
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"

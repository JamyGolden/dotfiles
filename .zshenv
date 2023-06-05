# XDG
# ---
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

for app_env_file in $(find "$XDG_CONFIG_HOME/zsh/apps" -type f -name 'env'); do
  . $app_env_file
done

# Other
# Env vars to XDG
# https://wiki.archlinux.org/title/XDG_Base_Directory
# ---------------------------------------------------
export DVDCSS_CACHE="$XDG_DATA_HOME/dvdcss"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export SCREENRC="$XDG_CONFIG_HOME/screen/screenrc"
export USERXSESSIONRC="$XDG_CACHE_HOME/X11/xsessionrc"
export WINEPREFIX="$XDG_DATA_HOME/wine"

# Repo path
# ---------
export DOTFILES_REPO_PATH="$HOME/projects/jamygolden-dotfiles"

# XDG
# ---
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

if [[ $(uname -s) == "Darwin"* ]]; then
  export OS_TYPE="mac"
elif [ -f "/etc/debian_version" ]; then
  export OS_TYPE="debian"
else
  export OS_TYPE="unknown"
fi

for app_env_file in $(find "$DOTFILES_REPO_PATH/apps" -type f -name 'env' | sort); do
  . "$app_env_file"
done

unset app_env_file

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

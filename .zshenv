# Repo path
# ---------
export PROJECTS_PATH="$HOME/projects"
export DOTFILES_REPO_PATH="$PROJECTS_PATH/jamygolden-dotfiles"

# XDG
# ---
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_BIN_HOME="$HOME/.local/bin" # Not officially in the spec
export XDG_INCLUDE_HOME="$HOME/.local/include" # Not officially in the spec

if [[ $(uname -s) == "Darwin"* ]]; then
  export OS_TYPE="mac"
elif [ -s "/etc/debian_version" ]; then
  export OS_TYPE="debian"
else
  export OS_TYPE="unknown"
fi

for app_env_file in $(find "$DOTFILES_REPO_PATH/apps" -type f -name "env" | sort); do
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

# ZSH specific
export WORDCHARS='*?.[]~=&;!#$%^(){}<>' # https://www.zsh.org/mla/workers/1998/msg01024.html
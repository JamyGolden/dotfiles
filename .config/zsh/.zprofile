# Not using zsh env vars because this file is also symlinked to
# `$HOME/.profile` and executed with bash
z_dotfiles_path=$HOME/.config/zsh

if [[ $(uname -s) == "Darwin"* ]]; then
  export IS_MAC=1
else
  export IS_MAC=0
fi

if [ -f "$z_dotfiles_path/.z_secrets" ]; then
  . "$z_dotfiles_path/.z_secrets"
fi

unset z_dotfiles_path

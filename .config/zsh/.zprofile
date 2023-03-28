# Not using zsh env vars because this file is also symlinked to
# `$HOME/.profile` and executed with bash
z_dotfiles_path=$HOME/.config/zsh

if [ -f "$z_dotfiles_path/.z_secrets" ]; then
  . "$z_dotfiles_path/.z_secrets"
fi

unset z_dotfiles_path

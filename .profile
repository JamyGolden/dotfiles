# This file is specifically for Linux intellij which doesn't load zsh
# when executing tests

if [ "$(command -v 'direnv')" ]; then
  eval "$(direnv hook bash)"
fi

z_dotfiles_path="$HOME"/.config/zsh

if [ -s "$z_dotfiles_path/.z_secrets" ]; then
  . "$z_dotfiles_path/.z_secrets"
fi

unset z_dotfiles_path
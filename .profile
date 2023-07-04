# This file is specifically for Linux intellij which doesn't load zsh
# when executing tests

eval "$(direnv hook bash)"

z_dotfiles_path="$HOME"/.config/zsh

if [ -f "$z_dotfiles_path/.z_secrets" ]; then
  . "$z_dotfiles_path/.z_secrets"
fi

unset z_dotfiles_path

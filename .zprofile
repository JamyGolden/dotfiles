Z_DOTFILES=$HOME/.z_dotfiles

if [ -f "$Z_DOTFILES/.z_secrets" ]; then
  . "$Z_DOTFILES/.z_secrets"
fi

unset Z_DOTFILES

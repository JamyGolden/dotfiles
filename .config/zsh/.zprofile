if [[ -f "$HOME/.config/home-manager/nix-env.sh" && -z "$IS_NIX_INIT" ]]; then
  . "$HOME/.config/home-manager/nix-env.sh"
fi

if [ -f "$DOTFILES_REPO_PATH/secrets/exports" ]; then
  . "$DOTFILES_REPO_PATH/secrets/exports"
fi
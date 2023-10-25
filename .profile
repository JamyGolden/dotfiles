# This file is specifically for Linux intellij which doesn't load zsh
# when executing tests

if [ "$(command -v 'direnv')" ]; then
  eval "$(direnv hook bash)"
fi

if [ -f "$DOTFILES_REPO_PATH/.zshenv" ]; then
  . "$DOTFILES_REPO_PATH/.zshenv"
fi

if [ -f "$DOTFILES_REPO_PATH/secrets/exports" ]; then
  . "$DOTFILES_REPO_PATH/secrets/exports"
fi
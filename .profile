# This file is specifically for Linux intellij which doesn't load zsh
# when executing tests

if [ -f "$DOTFILES_REPO_PATH/secrets/exports" ]; then
  . "$DOTFILES_REPO_PATH/secrets/exports"
fi
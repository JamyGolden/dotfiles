. "$ZDOTDIR/.zsh_exports"
. "$ZDOTDIR/.zsh_functions"

for app_rc_file in $(find "$DOTFILES_REPO_PATH/apps" -type f -name "rc" | sort); do
  . "$app_rc_file"
done

if [ -f "$DOTFILES_REPO_PATH/secrets/exports" ]; then
  . "$DOTFILES_REPO_PATH/secrets/exports"
fi

if [ -f "$DOTFILES_REPO_PATH/secrets/.zsh_secrets" ]; then
  . "$DOTFILES_REPO_PATH/secrets/.zsh_secrets"
fi

autoload -U compinit
compinit

# The alias below is required to be set in the .zshrc file, even though
# it is set in "$XDG_CONFIG_HOME/zsh/.zsh_aliases". The below comment is
# a hack to trick the lsp make file into leaving .zshrc uneditted
# DO NOT REMOVE
# alias luamake=""
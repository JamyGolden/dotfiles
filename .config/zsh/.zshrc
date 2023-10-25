export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"
export BASE16_THEME_DEFAULT="ocean"
ZSH_THEME="nanotech"

plugins=(history zsh-autosuggestions zsh-vi-mode base16-shell)

source $ZSH/oh-my-zsh.sh

. "$ZDOTDIR/.zsh_exports"
. "$ZDOTDIR/.zsh_functions"

for app_rc_file in $(find "$DOTFILES_REPO_PATH/apps" -type f -name "rc" | sort); do
  . "$app_rc_file"
done

unset app_rc_file

if [ -f "$DOTFILES_REPO_PATH/secrets/exports" ]; then
  . "$DOTFILES_REPO_PATH/secrets/exports"
fi

if [ -f "$DOTFILES_REPO_PATH/secrets/.zsh_secrets" ]; then
  . "$DOTFILES_REPO_PATH/secrets/.zsh_secrets"
fi

# The alias below is required to be set in the .zshrc file, even though
# it is set in "$XDG_CONFIG_HOME/zsh/.zsh_aliases". The below comment is
# a hack to trick the lsp make file into leaving .zshrc uneditted
# DO NOT REMOVE
# alias luamake=""
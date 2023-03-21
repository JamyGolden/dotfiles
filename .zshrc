export ZSH="$HOME/.oh-my-zsh"
export BASE16_THEME_DEFAULT="ocean"
ZSH_THEME="nanotech"

plugins=(history zsh-autosuggestions zsh-vi-mode base16-shell)

source $ZSH/oh-my-zsh.sh

ZSH_DOTFILES=$HOME/.zsh_dotfiles
. "$ZSH_DOTFILES/.zsh_exports"
. "$ZSH_DOTFILES/.zsh_aliases"
. "$ZSH_DOTFILES/.zsh_functions"
. "$ZSH_DOTFILES/.zsh_other"

if [ -f "$ZSH_DOTFILES/.zsh_secrets" ]; then
  . "$ZSH_DOTFILES/.zsh_secrets"
fi

# cleanup

unset ZSH_DOTFILES

# The alias below is required to be set in the .zshrc file, even
# though it is set in ".zsh_dotfiles/zsh_aliases". The below comment
# is a hack to trick the lsp make file into leaving .zshrc uneditted
# DO NOT REMOVE
# alias luamake=""

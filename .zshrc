export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

export BASE16_THEME_DEFAULT="ocean"

plugins=(history zsh-autosuggestions zsh-vi-mode base16-shell)

source $ZSH/oh-my-zsh.sh

[ -f $HOME/.zsh_profile ] && source $HOME/.zsh_profile

# The alias below is required to be set in the .zshrc file, even
# though it is set in ".zsh_dotfiles/zsh_aliases". The below comment
# is a hack to trick the lsp make file into leaving .zshrc uneditted
# DO NOT REMOVE
# alias luamake=""

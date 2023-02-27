export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

export BASE16_THEME_DEFAULT="ocean"

plugins=(history zsh-autosuggestions zsh-vi-mode base16-shell)

source $ZSH/oh-my-zsh.sh

[ -f $HOME/.zsh_profile ] && source $HOME/.zsh_profile

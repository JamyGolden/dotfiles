# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [ -f $HOME/.bash_dotfiles/.bash_it ]; then 
  . $HOME/.bash_dotfiles/.bash_it
fi

if [ -f $HOME/.bash_dotfiles/.bash_secret_exports ]; then 
  . $HOME/.bash_dotfiles/.bash_secret_exports
fi

if [ -f $HOME/.bash_dotfiles/.bash_exports ]; then 
  . $HOME/.bash_dotfiles/.bash_exports
fi

if [ -f $HOME/.bash_dotfiles/.bash_aliases ]; then 
  . $HOME/.bash_dotfiles/.bash_aliases
fi

if [ -f $HOME/.bash_dotfiles/.bash_functions ]; then 
  . $HOME/.bash_dotfiles/.bash_functions
fi

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

source $HOME/.config/broot/launcher/bash/br


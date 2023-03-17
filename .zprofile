# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

ZSH_DOTFILES=$HOME/.zsh_dotfiles

. "$ZSH_DOTFILES/.zsh_exports"
. "$ZSH_DOTFILES/.zsh_other"
. "$ZSH_DOTFILES/.zsh_functions"
. "$ZSH_DOTFILES/.zsh_aliases"

if [ -f "$ZSH_DOTFILES/.zsh_secrets" ]; then
  . "$ZSH_DOTFILES/.zsh_secrets"
fi

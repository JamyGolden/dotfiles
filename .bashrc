# For instances that don't support zsh

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

ZSH_DOTFILES=$HOME/.zsh_dotfiles

for filepath in $ZSH_DOTFILES/.zsh_*; do
  if [ -f $filepath ]; then
    . $filepath
  fi
done

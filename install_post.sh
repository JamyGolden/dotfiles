#!/usr/bin/env zsh
#
# We need XDG paths and $DOTFILES_REPO_PATH
. zshenv

remove_and_symlink() {
  if [ -h "$2" ]; then
    rm "$2"
  fi

  ln -s "$1" "$2"
  echo "Symlink created for $2"
}

if [ ! -d "$HOME/projects" ]; then
  mkdir "$HOME/projects"
fi

if [ ! -d "$HOME/projects/tinted-theming" ]; then
  mkdir "$HOME/projects/tinted-theming"
fi

# Install base16-fzf
# ------------------
tintedtheming_fzf_path="$HOME/projects/tinted-theming/base16-fzf"
if [ ! -d "$tintedtheming_fzf_path" ]; then
  git clone git@github.com:tinted-theming/base16-fzf.git "$tintedtheming_fzf_path"
fi
remove_and_symlink "$tintedtheming_fzf_path" \
  "$XDG_CONFIG_HOME/tinted-theming/base16-fzf"


# Install base16-vim
# ------------------
tintedtheming_vim_path="$HOME/projects/tinted-theming/base16-vim"
if [ ! -d "$tintedtheming_vim_path" ]; then
  git clone git@github.com:tinted-theming/base16-vim.git "$tintedtheming_vim_path"
fi
remove_and_symlink "$tintedtheming_vim_path/colors" "$XDG_CONFIG_HOME/nvim/colors"

# Install tmux plugins
# --------------------
tmux_plugins_path="$XDG_CONFIG_HOME/tmux/plugins"
tintedtheming_tmux_path="$HOME/projects/tinted-theming/base16-tmux"

# Clean out tmux plugins dir
if [ -d $tmux_plugins_path ]; then
  rm -rf $tmux_plugins_path
fi

mkdir $tmux_plugins_path

# Clone base16-tmux if it doesn't exist
if [ ! -d "$tintedtheming_tmux_path" ]; then
  git clone git@github.com:tinted-theming/base16-tmux.git "$tintedtheming_tmux_path"
fi

ln -s "$tintedtheming_tmux_path" "$XDG_CONFIG_HOME/tmux/plugins/base16-tmux"
git clone https://github.com/tmux-plugins/tmux-sensible.git "$tmux_plugins_path/tmux-sensible"
git clone https://github.com/tmux-plugins/tpm.git "$tmux_plugins_path/tpm"
git clone https://github.com/christoomey/vim-tmux-navigator.git "$tmux_plugins_path/vim-tmux-navigator"

# Other manual instructions
# -------------------------

if [[ "$OS_TYPE" == "debian" ]]; then
  echo "Manual setup instructions"
  echo "=========================\n"
  echo "Sublime merge: Add \"xdg-config/git:rw\" to Flateal -> Sublime Merge -> Other files"
fi
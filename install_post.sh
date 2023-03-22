#!/usr/bin/env zsh

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

# Install base16-shell
tintedtheming_shell_path="$HOME/projects/tinted-theming/shell"
tintedtheming_ohmyzsh_path="$HOME/.oh-my-zsh/plugins/base16-shell"
if [ ! -d "$tintedtheming_shell_path" ]; then
  git clone git@github.com:tinted-theming/base16-shell.git "$tintedtheming_shell_path"
fi
if [ ! -d "$tintedtheming_ohmyzsh_path" ]; then
  mkdir -p "$HOME/.oh-my-zsh/plugins/base16-shell"
fi
remove_and_symlink "$tintedtheming_shell_path/base16-shell.plugin.zsh" \
  "$HOME/.oh-my-zsh/plugins/base16-shell/base16-shell.plugin.zsh"

# Install base16-fzf
tintedtheming_fzf_path="$HOME/projects/tinted-theming/fzf"
if [ ! -d "$tintedtheming_fzf_path" ]; then
  git clone git@github.com:tinted-theming/base16-fzf.git "$tintedtheming_fzf_path"
fi
remove_and_symlink "$tintedtheming_fzf_path" \
  "$HOME/.config/tinted-theming/base16-fzf"

# Install base16-tmux
tintedtheming_tmux_path="$HOME/projects/tinted-theming/tmux"
if [ ! -d "$tintedtheming_tmux_path" ]; then
  git clone git@github.com:tinted-theming/base16-tmux.git "$tintedtheming_tmux_path"
fi
remove_and_symlink "$tintedtheming_tmux_path" "$HOME/.tmux/plugins/base16-tmux"

# Install base16-vim
tintedtheming_vim_path="$HOME/projects/tinted-theming/vim"
if [ ! -d "$tintedtheming_vim_path" ]; then
  git clone git@github.com:tinted-theming/base16-vim.git "$tintedtheming_vim_path"
fi
remove_and_symlink "$tintedtheming_vim_path/colors" "$HOME/.config/nvim/colors"

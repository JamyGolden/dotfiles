#!/usr/bin/env zsh

remove_and_symlink() {
  if [ ! -f "$2" ]; then
    rm "$2"
  fi

  ln -s "$1" "$2"
}

if [ ! -d "$HOME/projects" ]; then
  mkdir "$HOME/projects"
fi

if [ ! -d "$HOME/projects/tinted-theming" ]; then
  mkdir "$HOME/projects/tinted-theming"
fi

# Install base16-shell
base16_shell_path="$HOME/projects/tinted-theming/shell"
base16_ohmyzsh_path="$HOME/.oh-my-zsh/plugins/base16-shell"
if [ ! -d "$base16_shell_path" ]; then
  git clone git@github.com:tinted-theming/base16-shell.git "$base16_shell_path"
fi
if [ ! -d "$base16_ohmyzsh_path" ]; then
  mkdir "$HOME/.oh-my-zsh/plugins/base16-shell"
fi
remove_and_symlink "$base16_shell_path/base16-shell.plugin.zsh" \
  "$HOME/.oh-my-zsh/plugins/base16-shell/base16-shell.plugin.zsh"

# Install base16-fzf
base16_fzf_path="$HOME/projects/tinted-theming/fzf"
if [ ! -d "$base16_fzf_path" ]; then
  git clone git@github.com:tinted-theming/base16-fzf.git "$base16_fzf_path"
fi
remove_and_symlink "$base16_fzf_path" \
  "$HOME/.config/tinted-theming/base16-fzf"

# Install base16-tmux
base16_tmux_path="$HOME/projects/tinted-theming/tmux"
if [ ! -d "$base16_tmux_path" ]; then
  git clone git@github.com:tinted-theming/base16-tmux.git "$base16_tmux_path"
fi
remove_and_symlink "$base16_tmux_path" "$HOME/.tmux/plugins/base16-tmux"

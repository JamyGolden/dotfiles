{ pkgs, ... }:

{
  packages = with pkgs; [
    jetbrains.idea-ultimate
  ];

  files = {
    ".ideavimrc".text = ''
      let mapleader=" "

      " Options
      set relativenumber " Relative gutter line-numbers to cursor
      set number         " Show absolute line number on current line
      set smartcase      " Enable smart-case search
      set ignorecase     " Always case-insensitive
      set showmode       " Show current mode on status line
      set incsearch      " Show search matches while typing search pattern

      " Plugins
      set commentary
      set highlightedyank
      set surround

      " Key bindings
      map <leader>n <Action>(GotoNextError)
      map <leader>f <Action>(GotoFile)
      map <leader>g <Action>(FindInPath)
      map <leader>b <Action>(Switcher)
      vnoremap <leader>y "+y
      nnoremap <leader>y "+y
    '';
  };
}
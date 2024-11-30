{
  paths,
  pkgs,
  ...
}:
{
  enable = true;
  historyLimit = 50000;
  prefix = "C-a";
  shell = "${pkgs.zsh}/bin/zsh";
  plugins = with pkgs; [
    tmuxPlugins.vim-tmux-navigator
  ];
  extraConfig = ''
    # Go to next and previous window with C-n and C-N
    bind-key N previous-window

    # Binding to reload config file, useful for tweaking tmux
    bind r source $XDG_CONFIG_HOME/tmux/tmux.conf \; display-message "Conf reloaded..."

    # Start counting at one
    set -g base-index 1

    # Focus events enabled for terminals that support them
    set -g focus-events on

    # Increase tmux messages display duration from 750ms to 4s
    set -g display-time 4000

    # Vi mode for copy-pasting
    set-window-option -g mode-keys vi

    # Tmux 3.3a, currently on my mac machine
    # https://github.com/tinted-theming/base16-shell/issues/5
    set -g allow-passthrough on

    set -g set-clipboard on

    if-shell '[[ "$(uname -s)" == "Darwin" ]]' {
      # if having issues with your other programs dependent on TERM env variable
      set -g default-terminal screen-256color
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"

    } {
      set -g default-terminal "tmux-256color"
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xsel --input --clipboard"
    }

    # Allows displaying italics correctly
    # set -ga terminal-overrides ",*256col*:Tc"
    set -as terminal-overrides ",alacritty:Tc"

    # Rather than constraining window size to the maximum size of any client
    # connected to the session, constrain window size to the maximum size of any
    # client connected to that window
    setw -g aggressive-resize on

    # Activity monitoring, i.e. display "Activity in window #"
    setw -g monitor-activity on
    set -g visual-activity on

    # Address vim mode switching delay (http://superuser.com/a/252717/65504)
    # Allows for faster key repetition
    set -s escape-time 0

    # Better splitting
    bind | split-window -h -c "#{pane_current_path}"
    bind - split-window -v -c "#{pane_current_path}"

    bind-key -r f run-shell "tmux neww ${paths.xdgBinHome}/tmux-sessionizer"
    bind-key g new-window "lazygit"
  '';
}
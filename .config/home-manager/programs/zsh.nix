{
  config,
  paths,
  pkgs
}:
{
  enable = true;
  enableCompletion = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;
  plugins = [
    {
      name = "vi-mode";
      src = pkgs.zsh-vi-mode;
      file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
    }
  ];

  shellAliases = {
    cd = "z"; # zoxide
    jq = "jaq";
    ps = "procs";
    switch = "home-manager switch --flake ${paths.dotfilesRepo}/.config/home-manager#jamygolden";
    yarn = ''
      yarn --use-yarnrc "${config.xdg.configHome}/yarn/config";
    '';
  };

  initExtra = ''
    if [ -e "$HOME/.zsh_functions" ]; then
      . "$HOME/.zsh_functions"
    fi
  '';

  profileExtra = ''
    if [ -f "$DOTFILES_REPO_PATH/secrets/exports" ]; then
      . "$DOTFILES_REPO_PATH/secrets/exports"
    fi
  '';

  envExtra = ''
    # Content you want to include in ~/.zshenv
    export EDITOR=nvim
    export PATH="$XDG_BIN_HOME:$PATH"

    # Repo path
    # ---------
    export PROJECTS_PATH="$HOME/projects"
    export DOTFILES_REPO_PATH="$PROJECTS_PATH/jamygolden-dotfiles"

    if [[ $(uname -s) == "Darwin"* ]]; then
      export OS_TYPE="mac"
    elif [ -s "/etc/debian_version" ]; then
      export OS_TYPE="debian"
    else
      export OS_TYPE="unknown"
    fi

    # Other
    # Env vars to XDG
    # https://wiki.archlinux.org/title/XDG_Base_Directory
    # ---------------------------------------------------
    export DVDCSS_CACHE="$XDG_DATA_HOME/dvdcss"
    export GNUPGHOME="$XDG_DATA_HOME/gnupg"
    export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
    export LESSHISTFILE="$XDG_STATE_HOME/less/history"
    export SCREENRC="$XDG_CONFIG_HOME/screen/screenrc"
    export USERXSESSIONRC="$XDG_CACHE_HOME/X11/xsessionrc"
    export WINEPREFIX="$XDG_DATA_HOME/wine"
    export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history
    export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
    export CARGO_HOME="$XDG_DATA_HOME/cargo"

    # ZSH specific
    export WORDCHARS='*?.[]~=&;!#$%^(){}<>' # https://www.zsh.org/mla/workers/1998/msg01024.html
  '';
}
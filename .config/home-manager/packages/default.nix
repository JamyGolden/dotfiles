{ lib, pkgs }:

let
  fnm = import ./fnm.nix { inherit lib pkgs; };
  intellij-idea = import ./intellij-idea.nix { inherit lib pkgs; };
  rustup = import ./rustup.nix { inherit lib pkgs; };

  nixTools = with pkgs; [
    # ===================
    # CLI
    # ===================
    asdf
    bat
    bottom
    difftastic
    dust
    jaq
    neovim
    procs
    rename
    ripgrep
    tealdeer
    trash-cli
    wget
    yarn
    openrazer-daemon

    # Languages
    # ------------------
    go
    lua

    # ===================
    # GUI
    # ===================
    appgate-sdp
    bitwarden
    discord
    ferdium
    firefox
    google-chrome
    hexchat
    obsidian
    polychromatic
    signal-desktop
    slack
    sublime-merge
    sublime3
    telegram-desktop
    vlc
    vscode

    # ===================
    # Fonts
    # ===================
    noto-fonts-emoji
    fira-mono
  ];
in {
  packages = nixTools
    ++ fnm.packages
    ++ intellij-idea.packages
    ++ rustup.packages;

  activation.setupFnm = fnm.activation;
  activation.setupRustup = rustup.activation;

  files = {} // intellij-idea.files;
}
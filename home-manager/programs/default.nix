{
  config,
  email,
  fullName,
  paths,
  pkgs,
  ...
}:
{
  home-manager = {
    enable = true;
  };

  alacritty = import ./alacritty.nix { inherit config; };
  atuin = import ./atuin.nix;
  direnv = import ./direnv.nix;
  eza = import ./eza.nix;
  fd = import ./fd.nix;
  fzf = import ./fzf.nix;
  git = import ./git.nix { inherit config email fullName; };
  gradle = import ./gradle.nix;
  java = import ./java.nix { inherit pkgs; };
  lazygit = import ./lazygit.nix;
  starship = import ./starship.nix;
  tmux = import ./tmux.nix { inherit paths pkgs; };
  vim = import ./vim.nix;
  zoxide = import ./zoxide.nix;
  zsh = import ./zsh.nix { inherit config paths pkgs; };
}
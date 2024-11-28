{
  email,
  fullName,
  pkgs,
  ...
}:
{
  home-manager = {
    enable = true;
  };

  alacritty = import ./alacritty.nix;
  atuin = import ./atuin.nix;
  direnv = import ./direnv.nix;
  eza = import ./eza.nix;
  fd = import ./fd.nix;
  fzf = import ./fzf.nix;
  java = import ./java.nix { inherit pkgs; };
  git = import ./git.nix { inherit email fullName; };
  lazygit = import ./lazygit.nix;
  starship = import ./starship.nix;
  tmux = import ./tmux.nix { inherit pkgs; };
  vim = import ./vim.nix;
  zoxide = import ./zoxide.nix;
  zsh = import ./zsh.nix { inherit pkgs; };
}
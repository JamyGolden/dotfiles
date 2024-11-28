{ pkgs, ... }:

{
  packages = with pkgs; [
    jetbrains.idea-ultimate
  ];

  files = {
    ".ideavimrc".source = ../../ideavim/ideavimrc;
  };
}

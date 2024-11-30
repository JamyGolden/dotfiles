{ pkgs, lib, ... }:

{
  packages = with pkgs; [
    rustup
  ];

  # Ensure rustup uses the stable version by default
  activation = lib.hm.dag.entryAfter ["writeBoundary"] ''
    if command -v rustup > /dev/null; then
      rustup install stable
      rustup default stable
    fi
  '';
}
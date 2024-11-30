 # Fnm - A node version manager
{ pkgs, lib, ... }:

{
  packages = with pkgs; [
    fnm
  ];

  activation = lib.hm.dag.entryAfter ["writeBoundary"] ''
    fnm_dir="$XDG_DATA_HOME/fnm"
    if [ "$(command -v 'fnm')" ]; then
      eval "$(fnm env --use-on-cd --shell=zsh --fnm-dir=$fnm_dir)"
    fi
    unset fnm_dir
  '';
}
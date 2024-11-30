{ config, pkgs, ... }:

{
  packages = with pkgs; [
    neovim
  ];

  files = {
    "${config.xdg.configHome}/nvim/after".source = ../../config/nvim/after;
    "${config.xdg.configHome}/nvim/lua".source = ../../config/nvim/lua;
    "${config.xdg.configHome}/nvim/init.lua".source = ../../config/nvim/init.lua;
  };
}
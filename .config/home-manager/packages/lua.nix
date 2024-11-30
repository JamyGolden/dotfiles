{ pkgs, ... }:

{
  packages = with pkgs; [
    lua
    luarocks
    stylua
  ];

  files = {
    ".config/stylua/stylua.toml".text = ''
      column_width = 120
      line_endings = "Unix"
      indent_type = "Spaces"
      indent_width = 2
      quote_style = "AutoPreferDouble"
      call_parentheses = "Always"
      collapse_simple_statement = "Never"

      [sort_requires]
      enabled = false
    '';
  };
}
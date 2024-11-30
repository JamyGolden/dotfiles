{
  config
}:
{
  enable = true;
  settings = {
    font = {
      size = 16.0;
      bold = {
        family = "Fira Mono";
        style = "Bold";
      };
      italic = {
        family = "Fira Mono";
        style = "Italic";
      };
      normal = {
        family = "Fira Mono";
        style = "Medium";
      };
    };
    general = {
      import = ["${config.xdg.dataHome}/tinted-theming/tinty/tinted-alacritty-colors-256-file.toml"];
    };
  };
}
{
  enable = true;
  enableZshIntegration = true;
  settings = {
      format = " 🦄 $directory $git_branch $git_status $nodejs $rust $golang $php $time
\n$character
";
    directory = {
      format = " [$path](bold)";
      truncation_length = 3;
      truncation_symbol = "…/";
      substitutions = {
        "Documents" = "󰈙 ";
        "Downloads" = " ";
        "Music" = " ";
        "Pictures" = " ";
      };
    };

    git_branch = {
      symbol = "🌱";
      format = " on [$symbol $branch](bold)";
    };

    git_status = {
      format = "\\[[$all_status$ahead_behind](bold)\\]";
    };

    nodejs = {
      symbol = "";
      format = " via [$symbol $version](bold)";
    };

    rust = {
      symbol = "";
      format = " via [$symbol $version](bold)";
    };

    golang = {
      symbol = "";
      format = " via [$symbol $version](bold)";
    };

    php = {
      symbol = "";
      format = " via [$symbol $version](bold)";
    };

    time = {
      disabled = false;
      time_format = "%R";
      format = " \\( $time\\)";
    };
  };
}
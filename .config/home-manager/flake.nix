{
  description = "Home Manager configuration of jamygolden";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      username = "jamygolden";
      fullName = "Jamy Golden";
      email = "code@jamygolden.com";
      stateVersion = "24.05"; # See https://nixos.org/manual/nixpkgs/stable for most recent
      system = if builtins.hasAttr "isDarwin" builtins then "aarch64-darwin" else "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;

        config = {
          allowUnfree = true;
        };
      };

      homeDirPrefix = if pkgs.stdenv.hostPlatform.isDarwin then "Users" else "home";
      homeDirectory = "/${homeDirPrefix}/${username}";

      paths = {
        projects = let v = builtins.getEnv "PROJECTS_PATH"; in if v != "" then v else "$HOME/projects";
        dotfilesRepo = let v = builtins.getEnv "DOTFILES_REPO_PATH"; in if v != "" then v else "$HOME/projects/jamygolden-dotfiles";
        xdgBinHome = let v = builtins.getEnv "XDG_BIN_HOME"; in if v != "" then v else "$HOME/.local/bin";
        xdgIncludeHome = let v = builtins.getEnv "XDG_INCLUDE_HOME"; in if v != "" then v else "$HOME/.local/include";
        xdgDataDirs = "$HOME/.nix-profile/share:$XDG_DATA_DIRS";
      };
    in {
      homeConfigurations.${username}= home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit
            email
            fullName
            homeDirectory
            paths
            stateVersion
            username;
        };

        modules = [
          ./home.nix
        ];
      };
    };
}
{
  description = "Github Codespace Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      flake-utils,
      home-manager,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        homeConfigurations.codespace = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          # use extraSpecialArgs to pass through arguments to home-manager modules
          extraSpecialArgs = {
            inherit system;
          };

          modules = [
            ./modules/general.nix
            ./modules/utils.nix
          ];
        };
      }
    );
}

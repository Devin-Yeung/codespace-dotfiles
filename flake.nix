{
  description = "CodeSpace package collections";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        # Create custom package sets
        languageDevTools = with pkgs; {
          rust = [
            rustc
            cargo
            rust-analyzer
          ];
        };

        # Common development tools
        common = with pkgs; [
          git
          ripgrep
          fd
          jq
          btop
          tmux
          # nix related
          devenv
          direnv
          nixfmt-rfc-style
          nixd
        ];

      in
      {
        # Packages that can be installed individually
        packages = {
          # Development environments
          rust = pkgs.buildEnv {
            name = "rust";
            paths = languageDevTools.rust ++ common;
          };

          # Standalone tools and custom packages
          tools = pkgs.buildEnv {
            name = "common-tools";
            paths = common;
          };

          full = pkgs.buildEnv {
            name = "full";
            paths = languageDevTools.rust ++ common;
          };

          # Default package
          default = self.packages.${system}.tools;
        };

        # Development shells for different environments
        devShells = {
          default = pkgs.mkShell {
            buildInputs = common;
          };

          rust = pkgs.mkShell {
            buildInputs = languageDevTools.rust ++ common;
          };
        };
      }
    );
}

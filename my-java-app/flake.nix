{
  description = "My Gradle project using Nix Flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        gradle = pkgs.gradle.overrideAttrs (oldAttrs: {
          nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ 
            pkgs.unzip 
          ];
        });
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [ 
            gradle 
          ];
        };
      }
    );
}

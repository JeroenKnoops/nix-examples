{
  description = "Rust with pinned version of Cargo";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    # Found nixpkgs reference for cargo 1.75.0 in https://www.nixhub.io/packages/cargo
    old-cargo-nixpkgs.url = "github:nixos/nixpkgs/9a9dae8f6319600fa9aebde37f340975cab4b8c0";
  };

  outputs = { self, nixpkgs, old-cargo-nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        old-cargo-pkgs = import old-cargo-nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [ 
            old-cargo-nixpkgs.legacyPackages.${system}.cargo
            pkgs.libiconv
            pkgs.jq
          ];
        };
      }
    );
}

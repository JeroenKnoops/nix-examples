# nix-examples

Project with some example using nix flakes

## Purpose

This repository shows some of the uses of `nix flakes` in projects.
This repository has four different projects.

There is one github workflow which uses the environment set in `flake.nix` to run the applications.

Locally these projects have the correct version if your system has [nixos](https://nixos.org) installed with
[direnv](https://direnv.net/).

## Projects

### Rust

This is a simple hello world rust program. It's using a nix-flake which is pinned with a `flake.lock` file.

### Rust with pinned version of cargo

This is a simple hello world rust program. It's using a nix-flake which is pinned with a `flake.lock` file,
however the version of cargo is pinned down to a specific version in the `flake.nix`.

### Java

This is a simple gradle application.

### Node

This is a simple node application.

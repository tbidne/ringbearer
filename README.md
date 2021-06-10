<div align="center">

# ![Ringbearer](ringbearer_title.gif)

![flakes](https://github.com/tbidne/ringbearer/workflows/flakes/badge.svg?branch=main)
![legacy](https://github.com/tbidne/ringbearer/workflows/legacy/badge.svg?branch=main)

</div>

# Introduction

Includes the Ringbearer font for nix. This is [Pete Klassen's](https://www.thehutt.de/tolkien/fonts.html) font, inspired by one of the fonts used in Peter Jackson's The Lord of the Rings.

For more information, please see Pete's Klassen's [readme](https://www.thehutt.de/tolkien/fonts/ringbearer/readme.html). All rights reserved to him.

# Building

## Flakes

With flakes, your `flake.nix` should looks something like:

```nix
{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    ringbearer.url = "github:tbidne/ringbearer/main";
    ringbearer.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ringbearer }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = system;
      };
    in
    {
      nixosConfigurations = {
        modules = [
          (import ./configuration.nix { inherit pkgs system ringbearer; })
	];
      };
    };
}
```

Then in `configuration.nix`:

```nix
{ pkgs, system, ringbearer }:
{
  fonts.fonts =
    [
      ringbearer.defaultPackage.${system}
    ];
}
```

## Legacy

To use without flakes, add this to your `configuration.nix`:

```nix
{ pkgs, ... }:

let
  ringbearerRepo = builtins.fetchGit {
    url = "https://github.com/tbidne/ringbearer.git";
    ref = "main";
    rev = "<commit hash>";
  };
  ringbearer = pkgs.callPackage ringbearerRepo {};
in
{
  fonts.fonts = with pkgs;
    [ ringbearer
    ];
}
```

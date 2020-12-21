# ![Ringbearer](ringbearer.gif)

Includes the Ringbearer font for nix. This is [Pete Klassen's](https://www.thehutt.de/tolkien/fonts.html) font, inspired by one of the fonts used in Peter Jackson's The Lord of the Rings.

For more information, please see Pete's Klassen's [readme](https://www.thehutt.de/tolkien/fonts/ringbearer/readme.html). All rights reserved to him.

To use, add this to your `configuration.nix`:

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
{
  description = "Ringbearer Font";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachSystem [ "x86_64-linux" "x86_64-darwin" ] (system:
      let
        pkgs = import nixpkgs { inherit system; };
        version = "v1.0.0";
      in
      {
        defaultPackage = with pkgs; stdenv.mkDerivation {
          name = "ringbearer-${version}";
          src = ./.;
          buildInputs = [ unzip ];
          installPhase = ''
            unzip $src/ringbearer.zip
            install -m444 -Dt $out/share/fonts/truetype *.TTF
          '';
        };
      });
}

{ pkgs }:

let
  version = "1.0.0";
in pkgs.stdenv.mkDerivation {
  name = "ringbearer-${version}";

  src = ./.;

  buildInputs = [ pkgs.unzip ];

  installPhase = ''
    unzip $src/ringbearer.zip
    install -m444 -Dt $out/share/fonts/truetype *.TTF
  '';
}

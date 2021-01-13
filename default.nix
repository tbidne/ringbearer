{ pkgs, stdenv, ... }:

let
  version = "v1.0.0";
in stdenv.mkDerivation {
  name = "ringbearer-${version}";

  src = ./.;

  buildInputs = [ pkgs.unzip ];

  installPhase = ''
    local expected="1a400cd55ece1ce992229ee167e1297c1e6373682d10ef309f8742f5b8d3d13b"
    local hash=$(sha256sum $src/ringbearer.zip | awk '{print $1}')
    if [[ $hash == $expected ]]
    then
      unzip $src/ringbearer.zip
      install -m444 -Dt $out/share/fonts/truetype *.TTF
    else
      echo "Ringbearer hash did not match!"
      echo "Received: $hash"
      echo "Expected: $expected"
      exit 1
    fi
  '';
}
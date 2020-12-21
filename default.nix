{ pkgs, ... }:

let
  version = "v0.1-alpha";
in pkgs.fetchzip {
  name = "ringbearer-${version}";

  url = "https://github.com/tbidne/ringbearer/releases/download/${version}/ringbearer.zip";

  postFetch = ''
    unzip $downloadedFile
    install -m444 -Dt $out/share/fonts/truetype *.TTF
  '';
  sha256 = "1lwrvzgh59ysb7cq9y1h35aqckk2rmsgvhjayci4zbn10gi1ih2v";
}
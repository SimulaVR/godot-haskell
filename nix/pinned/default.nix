{ fetchFromGitHub, lib }:

let
  fetch = owner: repo: jsonFile: fetchFromGitHub {
    inherit owner repo;
    inherit (lib.importJSON jsonFile) rev sha256;
  };

in {
  nixpkgs = import (fetch "NixOS" "nix-channels" ./nixpkgs.json) {};
  hie = { ghc, useSystem ? true, useLatest ? false, versions ? [] }:
    import ./hie.nix {
      inherit fetchFromGitHub lib ghc useSystem useLatest versions;
    };
}

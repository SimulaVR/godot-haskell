{ fetchFromGitHub, lib }:
# { lib }:
let
  fetch = owner: repo: jsonFile: fetchFromGitHub {
    inherit owner repo;
    inherit (lib.importJSON jsonFile) rev sha256;
  };
  # fetch = jsonFile: builtins.fetchGit {
  #   inherit (lib.importJSON jsonFile) url rev sha256;
  # };

in {
  # nixpkgs = fetch ./nixpkgs.json;
  nixpkgs = import (fetch "NixOS" "nix-channels" ./nixpkgs.json) {};
  # godot-haskell = fetch ./godot-haskell.json;
  godot-haskell = fetch "SimulaVR" "godot-haskell" ./godot-haskell.json;
  hie = { ghc, useSystem ? true, useLatest ? false, versions ? [] }:
    import ./hie.nix {
      inherit fetchFromGitHub lib ghc useSystem useLatest versions;
    };
}

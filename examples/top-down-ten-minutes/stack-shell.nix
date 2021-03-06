{ nixpkgs ? import ./pinned-nixpkgs.nix {}
, ghc
}:

with nixpkgs;

haskell.lib.buildStackProject {
  inherit ghc;
  name = "top-down-ten-minutes";
  buildInputs = [];
}



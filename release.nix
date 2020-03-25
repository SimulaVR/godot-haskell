let
  pkgs = import ../../pinned-nixpkgs.nix { };
in
  pkgs.haskellPackages.callPackage ./godot-haskell.nix { api-json = ../godot/api.json; }

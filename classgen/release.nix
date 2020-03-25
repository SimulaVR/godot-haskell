let
  pkgs = import <nixpkgs> { };
in
  pkgs.haskellPackages.callPackage ./classgen.nix { }

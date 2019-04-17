{ nixpkgs ? import ./pinned-nixpkgs.nix {}
, compiler ? "default"
, doBenchmark ? false }:

let
  inherit (nixpkgs) pkgs;

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  variant = if doBenchmark then pkgs.haskell.lib.doBenchmark else pkgs.lib.id;

  drv = variant (haskellPackages.callPackage ./. {});

in

  if pkgs.lib.inNixShell then drv.env else drv

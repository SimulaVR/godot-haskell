{ profileBuild ? false }:
let
  pkgs = if profileBuild then (import ../../pinned-nixpkgs.nix { overlays = (import ../../nix/profileOverlays.nix); }) else (import ../../pinned-nixpkgs.nix { });
  haskellCallPkg = if profileBuild then (pkgs.haskellPackagesPIC.callPackage) else (pkgs.haskellPackages.callPackage);

  # Force classgen (which we only use as a build tool) to not have profiling, to avoid strange errors:
  pkgsNoProfile = import ../../pinned-nixpkgs.nix { };
  godot-haskell-classgen = pkgsNoProfile.haskellPackages.callPackage ./classgen/classgen.nix { };
in
  haskellCallPkg ./godot-haskell.nix { api-json = ../godot/api.json; profileBuild = profileBuild; godot-haskell-classgen = godot-haskell-classgen; }
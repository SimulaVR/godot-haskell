let
  pinned = import ./nix/pinned {
    inherit (import <nixpkgs> {})
      fetchFromGitHub
      lib;
 };

  hsPkgs = pinned.nixpkgs.haskell.packages."ghc864";
in
  hsPkgs.developPackage {
    root = ./.;
    overrides = self: super: {
      godot-haskell = self.callPackage pinned.godot-haskell {};
    };
    modifier = drv: pinned.nixpkgs.haskell.lib.addBuildTools drv
      (if pinned.nixpkgs.lib.inNixShell
       then (import ./nix/devTools.nix {
         pkgs = pinned.nixpkgs;
         inherit hsPkgs;
       })
       else []);
  }

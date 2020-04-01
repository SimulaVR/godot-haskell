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
    modifier = drv: pinned.nixpkgs.haskell.lib.addBuildTools drv
       (import ./nix/spacemacs-hie.nix {
         pkgs = pinned.nixpkgs;
         inherit hsPkgs;
       });
  }

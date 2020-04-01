{ pkgs, hsPkgs }:
let
  pinned = import ./pinned { inherit (pkgs) fetchFromGitHub lib; };
  hie = pinned.hie { inherit (hsPkgs) ghc; };

  emacsPkgs = (with pkgs; [
    emacs
    emacs-all-the-icons-fonts
    dejavu_fonts
    material-design-icons
    # nerdfonts
    source-code-pro
    weather-icons
  ]);

in emacsPkgs ++ [
  hie
] ++ (with hsPkgs; [
  apply-refact
  brittany
  cabal-install
  Cabal_3_0_0_0
  # Cabal_2_4_1_0
  hasktags
  hlint
  hoogle
])

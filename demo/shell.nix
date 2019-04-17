{ nixpkgs ? import ./pinned-nixpkgs.nix {}
, compiler ? "default"
, doBenchmark ? false }:


let

  inherit (nixpkgs) pkgs;

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  f = { mkDerivation, stdenv, base, godot-haskell, linear, text , vector, stm }:
    mkDerivation {
      pname = "demo";
      version = "3.1.0.0";
      src = ./.;
      libraryHaskellDepends = [
        base godot-haskell linear text vector stm
      ];
      libraryToolDepends = [];
      homepage = "https://github.com/lboklin/demo#readme";
      license = stdenv.lib.licenses.bsd3;
    };

  variant = if doBenchmark then pkgs.haskell.lib.doBenchmark else pkgs.lib.id;

  drv = variant (haskellPackages.callPackage f {
      # To use a specific revision of godot-haskell, set the rev in
      # godot-haskell.nix and then use:
      # godot-haskell = haskellPackages.callPackage ./godot-haskell.nix {
      #   fetchFromGitHub = pkgs.fetchFromGitHub;
      # };

      godot-haskell = haskellPackages.callPackage ../. {};
    });

in

  if pkgs.lib.inNixShell then drv.env else drv



{ nixpkgs ? import ./pinned-nixpkgs.nix {}
, compiler ? "default"
, doBenchmark ? false }:

let
  inherit (nixpkgs) pkgs;

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  f =
    ({ mkDerivation, aeson, ansi-wl-pprint, base, bytestring, c2hs
    , casing, colour, containers, hpack, lens, linear, mtl, parsec
    , parsers, stdenv, stm, template-haskell, text
    , unordered-containers, vector
    }:
    mkDerivation {
      pname = "godot-haskell";
      version = "3.1.0.0";
      src = ./.;
      libraryHaskellDepends = [
        aeson ansi-wl-pprint base bytestring casing colour containers lens
        linear mtl parsec parsers stm template-haskell text
        unordered-containers vector
      ];
      libraryToolDepends = [ c2hs hpack ];
      doHaddock = false;
      preConfigure = "hpack";
      homepage = "https://github.com/KaneTW/godot-haskell#readme";
      description = "Haskell bindings for the Godot game engine API";
      license = stdenv.lib.licenses.bsd3;
    });

  variant = if doBenchmark then pkgs.haskell.lib.doBenchmark else pkgs.lib.id;

  drv = variant (haskellPackages.callPackage f {});

in

  if pkgs.lib.inNixShell then drv.env else drv

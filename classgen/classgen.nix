{ mkDerivation, aeson, base, bytestring, c2hs, casing, containers
, directory, filepath, hpack
, lens, mtl, template-haskell, text, unordered-containers
, vector , stdenv, syb, callPackage, haskell, haskellPackages, fetchFromGitHub
, lib
}:
  let haskell-src-exts-custom = haskell.lib.dontCheck (haskellPackages.callPackage
        ({ mkDerivation, array, base, containers, directory, filepath
        , ghc-prim, happy, mtl, pretty, pretty-show, smallcheck, stdenv
        , tasty, tasty-golden, tasty-smallcheck
        }:
        mkDerivation {
          pname = "haskell-src-exts";
          version = "1.23.0";
          sha256 = "09048bhv7ajfsnjlzaz445yb65n2pc4l3yn7nmmrnkdy1f0gn2cm";
          libraryHaskellDepends = [ array base ghc-prim pretty ];
          libraryToolDepends = [ happy ];
          testHaskellDepends = [
            base containers directory filepath mtl pretty-show smallcheck tasty
            tasty-golden tasty-smallcheck
          ];
          doCheck = false;
          description = "Manipulating Haskell source: abstract syntax, lexer, parser, and pretty-printer";
          license = lib.licenses.bsd3;
          hydraPlatforms = lib.platforms.none;

          doHaddock = false;
          # doCheck = false;
          enableLibraryProfiling = false;
       }) {});

      haskell-src-exts-qq = haskellPackages.callPackage (
        { mkDerivation, base, hspec, stdenv, syb, template-haskell
        }:
        mkDerivation {
          pname = "haskell-src-exts-qq";
          version = "0.8";
          src = fetchFromGitHub {
            owner = "KaneTW";
            repo = "haskell-src-exts-qq";
            rev = "a2d9071c9d6a627a253edfaaa64b6b67c9da3534";
            sha256 = "1cvk90zi16m3nnz52gxim9b8sm17356jrp756y95is6ky13l2h60";
          };
          libraryHaskellDepends = [
            base haskell-src-exts-custom haskell-src-meta-custom syb template-haskell
          ];
          testHaskellDepends = [ base haskell-src-exts-custom hspec ];
          description = "A quasiquoter for haskell-src-exts";
          license = lib.licenses.bsd3;

          doHaddock = false;
          doCheck = false;
          enableLibraryProfiling = false;
          }) { };

  haskell-src-meta-custom = haskell.lib.dontCheck (haskellPackages.callPackage
({ mkDerivation, base, containers, haskell-src-exts, HUnit, pretty
, stdenv, syb, tasty, tasty-hunit, template-haskell, th-orphans
}:
mkDerivation {
  pname = "haskell-src-meta";
  version = "0.8.10";
  sha256 = "215e5ca5949962634b210e7f8b0459e557b466bfc9731caa67fc949076cdfc43";
  libraryHaskellDepends = [
    base haskell-src-exts pretty syb template-haskell th-orphans
  ];
  testHaskellDepends = [
    base containers haskell-src-exts HUnit pretty syb tasty tasty-hunit
    template-haskell
  ];
  description = "Parse source to template-haskell abstract syntax";
  license = lib.licenses.bsd3;

          doHaddock = false;
          doCheck = false;
          enableLibraryProfiling = false;
        }) {});
in 
mkDerivation {
  pname = "godot-haskell-classgen";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson base bytestring casing containers
    haskell-src-exts-qq lens mtl template-haskell text
    unordered-containers vector
  ];
  libraryToolDepends = [ c2hs hpack ];
  executableHaskellDepends = [
    aeson base bytestring casing containers directory filepath
    lens mtl template-haskell text
    unordered-containers vector
  ];
  executableToolDepends = [ c2hs ];
  prePatch = "hpack";
  homepage = "https://github.com/KaneTW/godot-haskell#readme";
  license = lib.licenses.bsd3;

  doHaddock = false;
  doCheck = false;
  enableLibraryProfiling = false;
}

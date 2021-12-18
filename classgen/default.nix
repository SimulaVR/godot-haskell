{ mkDerivation, aeson, base, bytestring, c2hs, casing, containers
, directory, filepath, hpack
, lens, mtl, template-haskell, text, unordered-containers
, vector , stdenv, syb, callPackage, haskell, haskellPackages, fetchFromGitHub
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
          license = stdenv.lib.licenses.bsd3;
          hydraPlatforms = stdenv.lib.platforms.none;
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
          license = stdenv.lib.licenses.bsd3;
          }) { };

      haskell-src-exts-sc = haskellPackages.callPackage (
        { mkDerivation, base, stdenv,
        }:
        mkDerivation {
          pname = "haskell-src-exts-sc";
          version = "0.1.0.6";
          src = fetchFromGitHub {
            owner = "achirkin";
            repo = "haskell-src-exts-sc";
            rev = "cc0e0f8e86814519281805da610d87cc34c86bea";
            sha256 = "17gxxhhflxbqrar0dd32lczs6vz89w8gqg4jv44djp9fxq98xsqq";
          };
          libraryHaskellDepends = [
            base haskell-src-exts-custom
          ];
          description = "Pretty print haskell code with comments";
          license = stdenv.lib.licenses.bsd3;
          }) { };

  haskell-src-meta-custom = haskell.lib.dontCheck (haskellPackages.callPackage
        ({ mkDerivation, base, HUnit, pretty, stdenv, syb
        , template-haskell, test-framework, test-framework-hunit
        , th-orphans
        }:
        mkDerivation {
          pname = "haskell-src-meta";
          version = "0.8.5";
          sha256 = "1csqp3n7330rhia9msyw34z7qwwj64gdy5qlv8w4jbm49dap24ik";
          revision = "1";
          editedCabalFile = "00znr8mrlbyn0n1bw4c82rv82pq5ngkk7kw9cgk13pghf93hwwv7";
          libraryHaskellDepends = [
            base haskell-src-exts-custom pretty syb template-haskell th-orphans
          ];
          description = "Parse source to template-haskell abstract syntax";
          license = stdenv.lib.licenses.bsd3;
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
    haskell-src-exts-qq haskell-src-exts-sc
    lens mtl template-haskell text
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
  license = stdenv.lib.licenses.bsd3;
}

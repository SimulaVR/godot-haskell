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
          version = "1.20.3";
          sha256 = "433e68a731fb6a1435e86d3eb3b2878db9c5d51dc1f7499d85bbf5ac3ed1e4a8";
          revision = "1";
          editedCabalFile = "1v42lbm80vnfn5xz12l97dy4wmf1yjxzbq9x0hna81y9pqxm5bl3";
          libraryHaskellDepends = [ array base ghc-prim pretty ];
          libraryToolDepends = [ happy ];
          testHaskellDepends = [
            base containers directory filepath mtl pretty-show smallcheck tasty
            tasty-golden tasty-smallcheck
          ];
          doCheck = false;
          homepage = "https://github.com/haskell-suite/haskell-src-exts";
          description = "Manipulating Haskell source: abstract syntax, lexer, parser, and pretty-printer";
          license = stdenv.lib.licenses.bsd3;
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

  haskell-src-meta-custom = haskell.lib.dontCheck (haskellPackages.callPackage
        ({ mkDerivation, base, HUnit, pretty, stdenv, syb
        , template-haskell, test-framework, test-framework-hunit
        , th-orphans
        }:
        mkDerivation {
          pname = "haskell-src-meta";
          version = "0.8.0.3";
          sha256 = "8473e3555080860c2043581b398dbab67319584a568463b074a092fd4d095822";
          revision = "2";
          editedCabalFile = "0dp5v0yd0wgijzaggr22glgjswpa65hy84h8awdzd9d78g2fjz6c";
          libraryHaskellDepends = [
            base haskell-src-exts-custom pretty syb template-haskell th-orphans
          ];
          testHaskellDepends = [
            base haskell-src-exts-custom HUnit pretty template-haskell test-framework
            test-framework-hunit
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
  license = stdenv.lib.licenses.bsd3;
}

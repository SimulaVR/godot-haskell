{ fetchFromGitHub, mkDerivation, aeson, ansi-wl-pprint, base, bytestring, c2hs
, casing, colour, containers, hpack, lens, linear, mtl, parsec
, parsers, stdenv, stm, template-haskell, text
, unordered-containers, vector
}:
mkDerivation {
  pname = "godot-haskell";
  version = "3.1.0.0";
  src = fetchFromGitHub {
    owner = "SimulaVR";
    repo = "godot-haskell";
    rev = "b423d4f2fa5a6a3dcfffb82bb36be571adb29d34"; # godot-haskell rev
    # Use nix-prefetch-git to get the hash
    sha256 = "0jh2j5rr90dqdxvcipygwnhhj7j2dj4zvm6gbdpg106ll60pyqrp";
    fetchSubmodules = true;
  };
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
}



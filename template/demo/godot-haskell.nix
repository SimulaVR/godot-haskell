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
    rev = "32dae6bc26b88c5e6e16727a9ea9682a195df96e"; # godot-haskell rev
    # Use nix-prefetch-git to get the hash
    sha256 = "";
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



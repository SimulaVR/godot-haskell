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
    rev = "d9fae601b04f73945848cdc3b32b830971b6c978";
    # Use nix-prefetch-git to get the hash
    sha256 = "1zafvc7zdpqfg6ldzx7ifa50pgxq09rbxk78fwvlvp9ml7mhxa45";
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



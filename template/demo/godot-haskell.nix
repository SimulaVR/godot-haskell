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
    rev = "0eabdf13d5b6339696ed50a3c10b26e9ff2cbc2d"; # godot-haskell rev
    # Use nix-prefetch-git to get the hash
    sha256 = "0wjnmhr2g9l8r0fhb2kvmnxdqqjy7r0kmlvy4ka0mcly8wvj18y0";
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



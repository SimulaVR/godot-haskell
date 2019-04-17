{ fetchFromGitHub, mkDerivation, aeson, ansi-wl-pprint, base, bytestring, c2hs
, casing, colour, containers, hpack, lens, linear, mtl, parsec
, parsers, stdenv, stm, template-haskell, text
, unordered-containers, vector
}:
mkDerivation {
  pname = "godot-haskell";
  version = "3.1.0.0";
  src = fetchFromGitHub {
    owner = "lboklin";
    repo = "godot-haskell";
    rev = "4dc4defd8f8b5279a9e838f66c129ad5762cce65";
    # Getting the sha256 for above rev:
    # nix-shell -p nix-prefetch-git --run 'nix-prefetch-git https://github.com/lboklin/godot-haskell 4dc4defd8f8b5279a9e838f66c129ad5762cce65 --fetch-submodules'
    sha256 = "1n3jzg7giq0b5nsv1ff9xdpywsg4426fjis498da4rkmwqanc555";
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



{}:

let
  # 19.03-beta (25 feb)
  rev = "d9fae601b04f73945848cdc3b32b830971b6c978";
  pkgs = import (builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
    }) {};
in
  pkgs



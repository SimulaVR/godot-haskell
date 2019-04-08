{}:

let
  # 19.03-beta (25 feb)
  rev = "7f35ed9df40f12a79a242e6ea79b8a472cf74d42";
  pkgs = import (builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
    }) {};
in
  pkgs

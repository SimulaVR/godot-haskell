{}:

let
  # 19.03-beta (25 feb)
  rev = "0c0954781e257b8b0dc49341795a2fe7d96945a3"; # pinned-nixpkgs rev
  pkgs = import (builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
    }) {};
in
  pkgs



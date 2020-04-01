{ fetchFromGitHub, lib, ghc, useSystem ? true, useLatest ? false, versions ? [] }:

let
  fetch = owner: repo: jsonFile: fetchFromGitHub {
    inherit owner repo;
    inherit (lib.importJSON jsonFile) rev sha256;
  };
  all-hies = import (fetch "Infinisil" "all-hies" ./all-hies.json) {};
  ghcVersionList = builtins.splitVersion ghc.version;
  ghcVersionToString = builtins.foldl' (x: y: x + y) "" ghcVersionList;
  ghcVersionKey = "ghc${ghcVersionToString}";
  versionList = versions
    ++ (if useSystem then [ ghcVersionKey ] else [])
    ++ (if useLatest then [ lib.last (lib.attrValues versions) ] else []);
  selector = p:
    builtins.foldl'
      (a: b: a // b)
      {}
      (map (v: { ${v} = p.${v}; }) versionList);
in all-hies.selection { selector = selector; }

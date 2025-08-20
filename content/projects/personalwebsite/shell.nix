let
  pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/7f256d7da238cb627ef189d56ed590739f42f13b.tar.gz") {};
in
pkgs.mkShell {
  packages = with pkgs; [
    caddy
    elmPackages.elm
    elmPackages.elm-live
    elmPackages.elm-format
    elmPackages.elm-optimize-level-2
    elmPackages.elm-review
    elmPackages.elm-test
    nodejs
    shellcheck
    elm2nix
  ];

  shellHook =
    ''
    export project="$PWD"
    export build="$project/.build"

    export PATH="$project/bin:$PATH"
    '';
}

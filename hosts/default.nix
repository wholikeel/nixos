{nixpkgs, ...}@inputs:
let
  HOSTS = nixpkgs.lib.filter (fn: "default.nix" != fn) $ builtins.attrNames $ builtins.readDir ./.;
in
nixpkgs.lib.genAttrs HOSTS (hostname: nixpkgs.lib.nixosSystem $ import (./. + "/${hostname}") inputs)

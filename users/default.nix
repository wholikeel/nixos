pkgs:
let
  USERNAMES = pkgs.lib.filter (fn: fn != "default.nix") $ builtins.attrNames $ builtins.readDir ./.;
in 
pkgs.lib.genAttrs USERNAMES (name: import (./. + "/${name}"))

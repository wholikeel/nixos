{
  pkgs,
  lib,
  config,
  ...
}: let
  pywalfox_wrapper = pkgs.writeShellScriptBin "pywalfox_wrapper" ''
    ${pkgs.pywalfox-native}/bin/pywalfox start
  '';
in {
  options.pywal.enable = lib.mkEnableOption "Pywal";
  config = lib.mkIf config.pywal.enable {
    home.packages =
      [pkgs.pywal]
      ++ (
        if config.firefox.enable
        then [pkgs.pywalfox-native]
        else []
      );
    home.file = lib.mkIf config.firefox.enable {
      ".mozilla/native-messaging-hosts/pywalfox.json".text =
        builtins.replaceStrings ["<path>"]
        ["${pywalfox_wrapper}/bin/pywalfox_wrapper"] (builtins.readFile
          "${pkgs.pywalfox-native}/lib/python3.11/site-packages/pywalfox/assets/manifest.json");
    };
  };
}

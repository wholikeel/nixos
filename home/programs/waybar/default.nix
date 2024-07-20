let
  theme = "anishkus";
in {
  programs.waybar = {
    enable = false;
    #package = ;
    settings.mainBar = builtins.fromJSON (builtins.readFile ./themes/anishkus/config);
    style = builtins.readFile ./themes/anishkus/style.css;
  };
}

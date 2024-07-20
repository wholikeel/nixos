{
  home.file = {
    ".config/hypr/hyprpaper.conf" = {
      enable = true;
      force = true;
      text = let
        wallpaper = "~/Images/Wallpapers/wallhaven-m3vgvk_1920x1080.png";
      in ''
        preload = ${wallpaper}
        wallpaper = DP-2,${wallpaper}
        wallpaper = HDMI-A-1,${wallpaper}
        splash = false
      '';
    };
  };
}

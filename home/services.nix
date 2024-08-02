{
  services = {
    cliphist = {
      enable = true;
      allowImages = true;
    };
    mpd-mpris.enable = true;


    # hyprpaper = let
    #   wp = "~/Images/Wallpapers/wallhaven-m3vgvk_1920x1080.png";
    # in {
    #   enable = true;
    #   settings = {
    #     ipc = "on";
    #     splash = false;
    #     splash_offset = 2.0;
    #     preload = [
    #       wp
    #     ];
    #     wallpaper = [
    #       "DP-2,${wp}"
    #       "HDMI-A-1,${wp}"
    #     ];
    #   };
    # };
  };
}

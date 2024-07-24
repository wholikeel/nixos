{
  pkgs,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      env = [
        "QT_QPA_PLATFORM,wayland"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "MOZ_ENABLE_WAYLAND,1"
      ];
      input = {
        kb_options = [
          "caps:swapescape"
        ];
      };
      bind = [
        "$mod SHIFT, E, exec, pkill Hyprland"
        "$mod, Q, killactive,"
        "$mod, M, fullscreen,"
        "$mod, G, togglegroup,"

        "$mod, Return, exec, kitty"
        "$mod, F, exec, nautilus"
        "$mod, B, exec, firefox"
        "$mod, O, exec, cat ~/.local/share/misc/bookmarks.txt | fuzzel --dmenu --log-level=none | cut -d' ' -f2 | wtype -"

        "$mod, H, moveFocus, l"
        "$mod, J, moveFocus, d"
        "$mod, K, moveFocus, u"
        "$mod, L, moveFocus, r"

        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, J, movewindow, d"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, L, movewindow, r"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"

        #"$mod, S, exec, rofi -show drun -show-icons"
        "$mod, S, exec, fuzzel"

        # Screenshot
        " , Print, exec, grim - | wl-copy"
        "SHIFT, Print, exec, grim -g \"$(slurp -w 0)\" | wl-copy"
        "SHIFT, Print, exec, grim -g \"$(slurp)\" - | swappy -f -"

        "$mod, V, exec, cliphist list | fuzzle --dmenu --log-level=none | cliphist decode | wl-copy"
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bindle = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"
        ", XF86MonBrightnessUp, exec, bri --up"
        ", XF86MonBrightnessDown, exec, bri --down"
        ", XF86Search, exec, launchpad"
      ];
      bindl = [
        ", XF86AudioMute, exec, amixer set Master toggle"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next "
        ", XF86AudioPrev, exec, playerctl previous"
      ];
      monitor = [
        "DP-2, 1920x1080@144, 1920x0, 1"
        "HDMI-A-1, 1920x1080@60, 0x0, 1"
      ];
      exec-once = let
        swww = "${pkgs.swww}/bin/swww";
        waybar = "${pkgs.waybar}/bin/waybar";
        dunst = "${pkgs.dunst}/bin/dunst";
        # wallpaper = "${inputs.nixos-artwork.outPath}/wallpapers/NixOS-Gradient-grey.png";
        wallpaper = "~/Images/Wallpapers/wallhaven.png";
        polkit = "${pkgs.kdePackages.polkit-kde-agent-1}/bin/libexec/polkit-kde-agent-1";
      in [
        #"${swww} init & ${swww} img ${wallpaper }"
        #"hyprpaper & hyprctl hyprpaper preload ${wallpaper} & hyprctl hyprpaper wallpaper \"DP-3,${wallpaper}\" & hyprctl hyprpaper wallpaper \"HDMI-A-1,${wallpaper}"
        "hyprpaper"
        "nm-applet --indicator"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        #"waybar"
        #"dunst"
        "ags"
        polkit
      ];
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };
    };
  };
}

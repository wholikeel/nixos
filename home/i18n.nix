{ config, pkgs, ...}:
{
    i18n.inputMethod = {
      enabled = "fcitx5";
      # waylandFrontend = true;
      fcitx5 = {
        addons = with pkgs; [
          fcitx5-gtk
          fcitx5-rose-pine
          fcitx5-mozc
        ];
      };
    };
}



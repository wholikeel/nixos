{pkgs, ...}: {
  programs.bash = {
    enable = true;
    initExtra = ''
      set -o vi
    '';
    shellAliases = {
      ll = "${pkgs.lsd}-l";
      ".." = "cd ..";
      ".vim" = "vim $XDG_CONFIG_HOME/nvim";
      "ff" = "vim $(${pkgs.fzf}/bin/fzf)";
    };
    bashrcExtra = "";
    sessionVariables = {
      EDITOR = "nvim";
      NIXOS_OZONE_WL = "1";
      QT_IM_MODULE = "fcitx";
      # GTK_IM_MODULE = "fcitx";
      SDL_IM_MODULE = "fcitx";
      GLFW_IM_MODULE = "fcitx";
      QT_IM_MODULES = "wayland;fcitx;ibus";
      XMODIFIER = "im@fcitx";
      HISTFILE = "\"\${XDG_STATE_HOME}\"/bash/history";
      GOPATH = "\"\${XDG_DATA_HOME}\"/go";
      LESSHISTFILE = "\"\${XDG_STATE_HOME}\"/less/history";
    };
  };
}

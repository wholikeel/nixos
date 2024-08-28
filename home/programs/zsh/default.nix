{
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    package = pkgs.zsh;
    dotDir = ".config/zsh"; # NOTE: Does not expand XDG_CONFIG_HOME.
    zsh-abbr = {
      enable = true;
      abbreviations = {
        l = "less";
        gc = "git commit";
        ga = "git add";
        gp = "git push";
        nrb = "nixos-rebuild";
        nd = "nix develop";
        nb =  "nix build";
        gs = "git status";
        hms = "home manager switch --flake";
      };
    };
    initExtraFirst = ''
      PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '
    '';
    initExtra = ''
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
    '';
    syntaxHighlighting = {
      enable = true;
    };
    sessionVariables = {
      EDITOR = "nvim";
      NIXOS_OZONE_WL = "1";
      QT_IM_MODULE = "fcitx";
      # GTK_IM_MODULE = "fcitx";
      SDL_IM_MODULE = "fcitx";
      GLFW_IM_MODULE = "fcitx";
      QT_IM_MODULES = "wayland;fcitx;ibus";
      XMODIFIER = "im@fcitx";
    };
  };
  # TODO: cannot be in a home-manager module.
  # environment.pathsToLink = [
  #   "/share/zsh"
  # ];
}

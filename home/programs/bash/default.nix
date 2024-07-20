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
    };
  };
}

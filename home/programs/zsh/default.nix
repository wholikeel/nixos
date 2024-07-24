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
  };
  # TODO: cannot be in a home-manager module.
  # environment.pathsToLink = [
  #   "/share/zsh"
  # ];
}

{pkgs, ...}: {
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    extraConfig = {
      credential.helper = "${pkgs.keepassxc}/bin/keepassxc --git-groups";
    };
    aliases = {
      "aa" = "add -A";
      "s" = "status -sb";
      "bl" = "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate";
      "lg" = "!git log --pretty=format:\"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]\" --abbrev-commit -30";
    };
  };

  home.packages = with pkgs; [
    gh
    git-credential-keepassxc
  ];
}

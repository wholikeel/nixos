{pkgs, ...}: {
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    extraConfig.credential.helper = "${pkgs.keepassxc}/bin/keepassxc --git-groups";
  };

  home.packages = with pkgs; [
    gh
    git-credential-keepassxc
  ];
}

{pkgs, ...}: {
  programs.delta = {
    enable = true;
    package = pkgs.delta;
  };
}

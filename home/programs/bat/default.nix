{pkgs, ...}: {
  # FIX: this is really verbose
  # needs some custom styling
  programs.bat = {
    enable = false; 
    package = pkgs.bat;
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batman
      batgrep
      batwatch
    ];
  };
}

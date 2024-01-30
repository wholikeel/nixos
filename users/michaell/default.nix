{ config, pkgs, ...}@inputs:

{
  home = rec {
    username = "michaell";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
    packages = with pkgs; [
      neofetch
      git
      cowsay
    ];
    sessionVariables = {
      EDITOR = "nvim";
    };
  };
  

  programs = {
    home-manager = {
      enable = true;
    };
    git = {
      enable = true;
      userName = "MichaelLePera";
      userEmail = "bronco2p@gmail.com";
      aliases = {
        pu = "push";
        co = "checkout";
        cm = "commit";
      };
    };
    neovim = {
      enable = true;
      vimAlias = true;
      viAlias = true;
    };
  };
}

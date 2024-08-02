{
  config,
  pkgs,
  inputs,
  ...
}: {
  home = {
    username = "michaell";
    homeDirectory = "/home/michaell";
    stateVersion = "24.05";
    packages = with pkgs; [
      nixgl.nixGLIntel
      keepassxc
      unzip
      libxml2
      xmlcopyeditor
      basex
      pandoc
      texliveFull
      calcure
      umlet
      drawio
      plantuml
      entr
      stdman
      calibre
      jetbrains-mono
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      qpdf
      obsidian

      kitty-img
      kitty-themes

      # secure-software-dev
      burpsuite
      jython

    ];
    file = {};
  };

  imports = [
    ./programs/neovim
    ./programs/kitty
    ./programs/zathura
    ./programs/git
    ./programs/fastfetch
    ./programs/tmux
    ./programs/neomutt
    ./programs/zsh
    ./programs/fastfetch
  ];

  programs = {
    home-manager.enable = true;
    fzf.enable = true;
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.nur.overlay
      inputs.neovim.overlays.default
    ];
  };
}

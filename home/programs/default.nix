{
  imports = [
    ./ags
    ./bash
    ./bat
    ./bemenu
    ./fastfetch
    ./firefox
    ./fuzzel
    ./fzf
    ./git
    ./gtk
    ./hyprlock
    ./kitty
    ./librewolf
    ./neomutt
    ./neovim
    ./pywal
    ./tmux
    ./waybar
    ./zathura
    ./zsh
  ];

  programs = {
    aria2.enable = true;
    lsd.enable = true;
    mpv.enable = true;
    obs-studio.enable = true;
    pandoc.enable = true;
    yt-dlp.enable = true;
  };
  
  firefox.enable = true;
  pywal.enable = true;
}

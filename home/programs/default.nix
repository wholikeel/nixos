{
  imports = [
    ./ags
    ./bash
    ./bemenu
    ./fastfetch
    ./firefox
    ./fuzzel
    ./git
    ./gtk
    ./hyprlock
    ./kitty
    ./neovim
    ./pywal
    ./tmux
    ./waybar
    ./zathura
    ./zsh
  ];

  programs = {
    fzf.enable = true;
    lsd.enable = true;
    mpv.enable = true;
    obs-studio.enable = true;
    pandoc.enable = true;
    yt-dlp.enable = true;
  };
  
  firefox.enable = true;
  pywal.enable = true;
}

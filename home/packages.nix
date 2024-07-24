{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # SYSTEM
    #ags
    libnotify
    hyprpaper
    hyprkeys #inputs.hyprkeys.packages.x86_64-linux.hyprkeys
    dunst
    swww
    wl-clipboard
    slurp
    swappy
    grim
    rofi-wayland
    pavucontrol
    networkmanagerapplet
    keepassxc
    wtype
    libsForQt5.qt5ct
    kdePackages.polkit-kde-agent-1
    vulkan-tools
    playerctl
    mpc-cli
    android-file-transfer
    mtpfs
    usbutils
    gvfs
    aerc
    xdg-utils
    xdg-desktop-portal-hyprland
    xwaylandvideobridge
    wallust

    # Core
    yazi
    qbittorrent
    quodlibet

    # Documents
    calibre
    texliveFull
    libreoffice-qt
    yt-dlp
    musescore
    libsForQt5.dolphin
    gnome.nautilus
    gnome-usage
    gnome.pomodoro
    vistafonts
    umlet
    obsidian

    # Theming
    font-awesome
    nixos-icons
    (nerdfonts.override {
      fonts = ["JetBrainsMono" "Iosevka"];
    })

    # Development
    ventoy-full
    gparted

    # Social
    vesktop
    armcord
    webcord
    dissent
    spotube

    # Gaming
    prismlauncher
    protontricks
    faudio
    glfw-wayland-minecraft
  ];
}

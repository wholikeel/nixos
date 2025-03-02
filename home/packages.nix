{
  pkgs,
  inputs,
  ...
}: let 
  upkgs = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
in {
  home.packages = with pkgs; [
    # SYSTEM
    #ags
    libnotify
    hyprpaper
    hyprkeys #inputs.hyprkeys.packages.x86_64-linux.hyprkeys
    hyprcursor
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
    protonvpn-gui
    libgnome-keyring
    gnome-keyring

    # Core
    yazi
    quodlibet

    # Documents
    urlscan
    tsduck
    krita
    calibre
    texliveFull
    libreoffice-qt
    yt-dlp
    musescore
    libsForQt5.dolphin
    libsForQt5.kate
    nautilus
    gnome-usage
    gnome-pomodoro
    vistafonts
    umlet
    obsidian
    foliate

    # Theming
    font-awesome
    nixos-icons
    (nerdfonts.override {
      fonts = ["JetBrainsMono" "Iosevka"];
    })

    # Development
    ventoy-full
    gparted
    android-studio
    qemu_full
    (jetbrains.plugins.addPlugins jetbrains.idea-community [])
    

    # Social
    vesktop
    legcord
    webcord
    dissent
    # spotube
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })

    # Gaming
    prismlauncher
    protontricks
    faudio
    glfw-wayland-minecraft
    osu-lazer-bin
    protonup-qt
    heroic
    lutris

    burpsuite
    joplin
    joplin-desktop

    godot_4

    inputs.zen-browser.packages.x86_64-linux.default
    upkgs.qbittorrent
    inputs.ghostty.packages.x86_64-linux.default
  ];
}

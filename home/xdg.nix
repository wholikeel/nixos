{pkgs, ...} @ imports: {
  xdg = {
    # desktopEntries = {
    #   nautilus = {
    #     name = "Nautilus";
    #     genericName = "File Manager";
    #     exec = "${pkgs.gnome.nautilus} %U";
    #     terminal = false;
    #     categories = ["Application"];
    #     mimeType = ["inode/directory"];
    #   };
    # };
    mimeApps = {
      enable = true;
      # associations = {
      #   added = {
      #     "inode/directory" = "Nautilus.desktop";
      #   };
      # };
      defaultApplications = {
        "inode/directory" = "org.gnome.Nautilus.desktop";
      };
    };
    portal = {
      enable = true;
      config = {
        common = {
          default = ["hyprland" "gtk"];
        };
      };
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
      ];
    };
  };
}

{ config, pkgs, inputs, lib, ... }: {

  imports = [
    ./hardware-configuration.nix
    ./virtualisation.nix
    ./vpn.nix
    ../../home
    inputs.nix-minecraft.nixosModules.minecraft-servers
  ];

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.nur.overlays.default
      inputs.neovim.overlays.default
      inputs.nix-minecraft.overlays.default
      # inputs.hyprpanel.overlay.x86_64-linux
      # (self: super: {
      #   gnome = super.gnome.overrideScope (gself: gsuper: {
      #     nautilus = gsuper.nautilus.overrideAttrs (nsuper: {
      #       buildInputs = nsuper.buildInputs ++ (with super.gst_all_1; [gst-plugins-good gst-plugins-bad]);
      #     });
      #   });
      # })
      (final: prev: {
        nautilus = prev.nautilus.overrideAttrs (nsuper: {
          buildInputs = nsuper.buildInputs
            ++ (with prev.gst_all_1; [ gst-plugins-good gst-plugins-bad ]);
        });
      })
    ];
  };

  time.timeZone = "Australia/Adelaide";

  systemd.services.mpd.environment = { XDG_RUNTIME_DIR = "/run/user/1000"; };
  boot = {
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        useOSProber = true;
        efiSupport = true;
        extraEntries = ''
          menuentry "Reboot" {
            reboot
          }
          menuentry "Poweroff" {
            halt
          }
        '';
      };
      systemd-boot = { enable = false; };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
  };
  users.users.michaell = {
    isNormalUser = true;
    description = "Michael LePera";
    extraGroups = [ "docker" "uinput" "networkmanager" "wheel" "adbusers" ];
    packages = [ ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

  # users.groups.uinput.gid = lib.mkForce 989;

  security.rtkit.enable = true;

  services.minecraft-server = {
    enable = true;
    eula = true;
    declarative = true;
    openFirewall = true;
    jvmOpts = "-Xms4092M -Xmx4092M -XX:+UseG1GC";
    package = pkgs.papermcServers.papermc-1_21;
    serverProperties = {
     server-port = 25565;
     enable-rcon = true;
     "rcon.password" = "giganigga";
    };
  };

  programs = {
    hyprland = {
      enable = true;
      package =
        pkgs.hyprland; # inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
    adb = { enable = true; };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
  #
  system = {
    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    stateVersion = "23.11"; # Did you read the comment?
  };
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      substituters =
        [ "https://cache.nixos.org" "https://nix-community.cachix.org" ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };

  # # Enable networking
  networking = {
    hostName = "nixos"; # Define your hostname.
    networkmanager.enable = true;
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    extraHosts = "";

    # firewall = {
    #
    # };

    # openvpn = {
    #   enable = true;
    #   client = true;
    #   configFiles = [
    #     "/etc/openvpn/purevpn/Recommended-CA2/bn2-auto-tcp-qr.ovpn"
    #   ];
    #
    #   extraConfig = ''
    #     auth-user-pass /etc/openvpn/purevpn/credentials
    #   '';
    # };
  };
  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_AU.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_AU.UTF-8";
      LC_IDENTIFICATION = "en_AU.UTF-8";
      LC_MEASUREMENT = "en_AU.UTF-8";
      LC_MONETARY = "en_AU.UTF-8";
      LC_NAME = "en_AU.UTF-8";
      LC_NUMERIC = "en_AU.UTF-8";
      LC_PAPER = "en_AU.UTF-8";
      LC_TELEPHONE = "en_AU.UTF-8";
      LC_TIME = "en_AU.UTF-8";
    };
  };

  hardware.uinput.enable = true;
  services = {
    greetd = {
      enable = true;
      settings = rec {
        initial_session =
          let hyprland-pkg = inputs.hyprland.packages.${pkgs.system}.hyprland;
          in {
            command = "${hyprland-pkg}/bin/Hyprland";
            user = "michaell";
          };
        default_session = initial_session;
      };
    };
    mpd = {
      enable = true;
      # musicDirectory = /home/${user}/Music;
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "My PipeWire Output"
        }
      '';
      user = "michaell";
    };
    udisks2.enable = true;
    gvfs.enable = true;
    xserver.xkb = {
      layout = "au";
      variant = "";
    };
    getty.autologinUser = "michaell";
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      wireplumber = { enable = true; };
    };
  };
  # hardware.graphics.enable
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    pulseaudio = { support32Bit = true; };
  };

  #
  # # List packages installed in system profile. To search, run:
  # # $ nix search wget
  environment = {
    systemPackages = [
      #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      #  wget
    ];
    sessionVariables = rec {
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";

      # Not officially in the specification
      XDG_BIN_HOME = "$HOME/.local/bin";
      PATH = [ "${XDG_BIN_HOME}" ];

      # Firefox use wayland
      MOZ_ENABLE_WAYLAND = "1";

      QT_IM_MODULE = "fcitx";
      # GTK_IM_MODUL = "fcitx"; # not for wayland
      SDL_IM_MODULE = "fcitx";
      GLFW_IM_MODULE = "fcitx";
      XMODIFIER = "@im=fcitx";
      QT_IM_MODULES = "wayland;fcitx;ibus";
    };
  };

  security = { polkit = { enable = true; }; };

}

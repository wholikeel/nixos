{ config, pkgs, inputs, ...}:

{
  home = rec {
    username = "michaell";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
    packages = with pkgs; [
      neofetch
      git
      cowsay
      nixos-icons
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
    
    firefox = 
      let 
        global-settings = {
	  "browser.startup.homepage" = "https://searx.aicampground.com";
	  "browser.search.defaultenginename" = "Searx";
	  "browser.search.order.1" = "Searx";
	};
        nurNoPkgs = import inputs.nur {
          inherit pkgs;
          nurpkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
        };
      in {
      enable = true;
      profiles = {
        michaell = {
	  id = 0;
	  name = "michaell";
	  isDefault = true;
	  settings = global-settings;
	  search = {
	    force = true;
	    default = "Searx";
	    order = [ "Searx" "Google" ];
	    engines = {
	      "Nix Packages" = {
	        urls = [{
		  template = "https://search.nixos.org/packages";
		  params = [
		    { name = "type"; value = "packages"; }
		    { name = "query"; value = "{searchTerms}"; }
		  ];
		}];
		icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@np" ];
	      };
	      "NixOS Wiki" = {
                urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "@nw" ];
              };
              "Searx" = {
                urls = [{ template = "https://searx.aicampground.com/?q={searchTerms}"; }];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "@searx" ];
              };
              "Bing".metaData.hidden = true;
              "Google".metaData.alias = "@g";
	    };
	  };
          extensions = with nurNoPkgs.repos.rycee.firefox-addons; [
	    ublock-origin
	    bitwarden
	    darkreader
	    vimium
	  ];
	};
	michaell-work = {
          id = 1;
	  name = "michaell-work";
	  isDefault = false;
	  settings = global-settings;
	};
      };
    };

    wezterm = {
      enable = true;
    };

    kitty = {
      enable = true;
    };

  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      decoration = {
        shadow_offset = "0 5";
	"col.shadow" = "rgba(00000099)";
      };

      "$mod" = "SUPER";

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];
      bind = [
        "$mod SHIFT, E, exec, pkill Hyprland"
	"$mod, Q, killactive,"
	"$mod, F, fullscreen,"
	"$mod, G, togglegroup,"
	"$mod SHIFT, N, changegroupactive, f"
	"$mod SHIFT, P, changegroupactive, b"
	"$mod, R, togglesplit,"
	"$mod, T, togglefloating,"
	# "$mod, P, psuedo,"
	"$mod ALT, ,resizeactive,"

	"$mod, M, exec, wezterm"
	"$mod, N, exec, kitty"
	"$mod, B, exec, firefox"

	"$mode, H, movefocus, l"
	"$mode, J, movefocus, d"
	"$mode, K, movefocus, u"
	"$mode, L, movefocus, r"

      ];
    };
  };

  imports = [
  ];

}

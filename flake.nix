{
  description = "NixOS and Home-manager flake";

  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixos-24.05";
    };
    nixpkgs-unstable = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };
    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      inputs = {
        nixpkgs = {
          follows = "nixpkgs";
        };
      };
    };
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      # url = "git+https://github.com/hyprwm/Hyprland?submodules=1&rev=f642fb97df5c69267a03452533de383ff8023570";
      # ref = "v0.41.2";
      inputs = {
        nixpkgs = {
          follows = "nixpkgs";
        };
      };
    };
    hyprkeys = {
      type = "github";
      owner = "hyprland-community";
      repo = "hyprkeys";
      inputs = {
        nixpkgs = {
          follows = "nixpkgs";
        };
      };
    };
    hyprland-plugins = {
        url = "github:hyprwm/hyprland-plugins";
        inputs.hyprland.follows = "hyprland";
    };
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        ags.follows = "ags"; 
      };
    };
    nur = {
      type = "github";
      owner = "nix-community";
      repo = "NUR";
    };
    gitu = {
      type = "github";
      owner = "altsem";
      repo = "gitu";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
    nix-gl = {
      type = "github";
      owner = "nix-community";
      repo = "nixGL";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim = {
      type = "github";
      owner = "nix-community";
      repo = "neovim-nightly-overlay";
      inputs = {
        nixpkgs = {
          follows = "nixpkgs-unstable";
        };
      };
    };
    zen-browser = {
        url = "github:MarceColl/zen-browser-flake";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nix-gl,
    ...
  } @ inputs: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/desktop
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };
    homeConfigurations = {
      michaell = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          overlays = [nix-gl.overlay];
        };
        modules = [./home/laptop.nix];

        extraSpecialArgs = {
          inherit inputs;
        };
      };
    };
  };
}

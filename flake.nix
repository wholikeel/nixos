
{

  description = "Dell Inspiron 5402 NixOS Flake Configuration";

  outputs = {self, nixpkgs, home-manager, nur, ...}@inputs: 
  let
    system = "x86_64-linux";
    pkgs = "nixpkgs.legacyPackages.${system}";
  in {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
	  # nur.nixosModules.nur
	  {nixpkgs.overlays = [ nur.overlay ]; }
          ./configuration.nix
	  home-manager.nixosModules.home-manager
          ./home-manager.nix
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };
  };


  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    # nix-super.url = "git+https://git.privatevoid.net/max/nix-super";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    nur.url = "github:nix-community/NUR";
    sops-nix.url = "github:Mic92/sops-nix";
  };

}

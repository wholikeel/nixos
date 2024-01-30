
{

  description = "Dell Inspiron 5402 NixOS Flake Configuration";

  outputs = {self, nixpkgs, home-manager, ...}@inputs: 
  let
    system = "x86_64-linux";
    pkgs = "nixpkgs.legacyPackages.${system}";
  in {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
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
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

}

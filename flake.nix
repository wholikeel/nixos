{
  description = "Dell Inspiron 5402 NixOS Flake Configuration";

  outputs = {nixpkgs, ...}@inputs: 
  {
    nixosConfigurations = import ./hosts (inputs // {users = import ./users nixpkgs; });
  };


  inputs = let
    fh-src = org: project: version-range:
      "https://flakehub.com/f/${org}/${project}/${version-range}.tar.gz";
  in {
    nixpkgs.url = fh-src "NixOS" "nixpkgs" "*";
    hyprland.url = fh-src "hyprwm" "Hyprland" "0.34.0";
    sops.url = fh-src "Mic92" "sops-nix" "0.1.726";
    home-manager.url = fh-src "nix-community" "home-manager" "0.2311.3174";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-super.url = "git+https://git.privatevoid.net/max/nix-super";
    nur.url = "github:nix-community/NUR";
  };

}

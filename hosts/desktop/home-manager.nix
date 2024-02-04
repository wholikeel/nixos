#{ lib, config, pkgs, home-manager, ...}@inputs:

#{
  # https://github.com/nix-community/home-manager/blob/master/flake.nix
#  imports = [ home-manager.nixosModules.default ];

#}



{ config, pkgs, inputs, ...}@args:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    inherit (inputs) users;
    extraSpecialArgs = {
      inherit inputs;
    };
  };
}

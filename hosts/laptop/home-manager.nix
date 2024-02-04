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

{ config, pkgs, inputs, ...}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      michaell = import ./users/michaell;
    };

    extraSpecialArgs = {
      inherit inputs;
    };
  };
}

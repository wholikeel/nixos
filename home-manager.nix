{ config, pkgs, inputs, ...}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      michaell = import ./users/michaell;
    };
  };
  modules = [ inputs.home-manager.nixosModules.home-manager ];
}

{
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs;};
    backupFileExtension = "backup";
    users = {
      michaell = {
        imports = [
          inputs.ags.homeManagerModules.default
          ./programs
          ./packages.nix
          ./xdg.nix
          ./services.nix
          ./files.nix
          ./hyprland
        ];
        home = {
          username = "michaell";
          homeDirectory = "/home/michaell";
          stateVersion = "24.05";
        };
        programs.home-manager.enable = true;
      };
    };
  };
}

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
    backupFileExtension = "backup2";
    users = {
      michaell = {
        imports = [
          inputs.ags.homeManagerModules.default
          ./programs
          ./packages.nix
          ./xdg.nix
          ./services.nix
          ./files.nix
          ./i18n.nix
          ./hyprland
        ];
        home = {
          username = "michaell";
          homeDirectory = "/home/michaell";
          stateVersion = "24.05";
          enableNixpkgsReleaseCheck = false;
        };
        programs.home-manager.enable = true;
      };
    };
  };
}

inputs: {

  system = "x86_64-linux";

  modules = [
    ./configuration.nix
    inputs.home-manager.nixosModules.home-manager
    ./home-manager.nix
  ];

  specialArgs = {
    inherit inputs;
  };
}

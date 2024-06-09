{
  inputs,
  outputs,
  nixpkgs,
  nur,
  home-manager,
  ...
}:
let
  system = "x86_64-linux";
  specialArgs = {
    inherit inputs;
  };
  modules = [
    # > Our main NixOS configuration file <
    ./configuration.nix

    nur.nixosModules.nur

    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.nanachi = import ../home-manager/home.nix;
        backupFileExtension = "backup";
        extraSpecialArgs = {
          inherit inputs outputs;
        };
      };
    }
  ];
in
{
  nixos = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    inherit specialArgs;
    inherit modules;
  };
}

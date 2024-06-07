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

    { nixpkgs.overlays = [ nur.overlay ]; }
    (
      { pkgs, ... }:
      let
        nur-no-pkgs = import nur { nurpkgs = import nixpkgs { system = "x86_64-linux"; }; };
      in
      {
        imports = [ nur-no-pkgs.repos.iopq.modules.xraya ];
        services.xraya.enable = true;
      }
    )

    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.nanachi = import ../home-manager/home.nix;
        extraSpecialArgs = {
          inherit inputs outputs system;
        };
      };
    }
  ];
in
{
  nanachi = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    inherit specialArgs;
    inherit modules;
  };
}

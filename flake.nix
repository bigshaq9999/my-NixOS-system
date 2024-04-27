{
  description = "My NixOS system configuration";

  inputs = {
    ## -- system modules --  ##
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    # NixOS User Repository
    nur.url = "github:nix-community/NUR";
    ## -- system modules -- ##

    ## -- additional modules
    vscode-server.url = "github:nix-community/nixos-vscode-server";
    ## -- additional modules

    # vscode extensions set of packages(nixpkgs doesn't contain needed extensions)
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    # firefox addons set of packages
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    # @ashuramaruzxc/@meanvoid - Touhou Project and other anime-styled cursors
    meanvoid.url = "github:meanvoid/nixos-overlay";

    # Redefinitions
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    vscode-server.inputs.nixpkgs.follows = "nixpkgs";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";
    firefox-addons.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nur,
      vscode-server,
      nix-vscode-extensions,
      meanvoid,
      ...
    }@inputs:
    let
      inherit (self) outputs;
    in
    {
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          # > Our main nixos configuration file <
          modules = [ ./nixos/configuration.nix ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        "kunny@nixos" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [ ./home-manager/home.nix ];
        };
      };
    };
}

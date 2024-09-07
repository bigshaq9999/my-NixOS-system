{
  description = "My NixOS system configuration";

  inputs = {
    ## -- system modules --  ##
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    # NixOS User Repository
    nur.url = "github:nix-community/NUR";
    ## -- system modules -- ##

    # vscode extensions set of packages(nixpkgs doesn't contain needed extensions)
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    # firefox addons set of packages
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    # @ashuramaruzxc/@meanvoid - Touhou Project and other anime-styled cursors
    meanvoid.url = "github:meanvoid/nixos-overlay";
    # @donteatoreo - dis is a simple tool to compress videos 
    dis.url = "github:DontEatOreo/dis";

    # Redefinitions
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";

    nixcord.url = "github:kaylorben/nixcord";
  };

  outputs =
    inputs:
    let
      hostName = "nixos";
      userName = "nanachi";
    in
    {
      nixosConfigurations = {
        ${hostName} = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./nixos/configuration.nix
            inputs.nur.nixosModules.nur
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${userName} = {
                  imports = [
                    ./home-manager/programs/nvim/default.nix

                    ./home-manager/programs/vscode/default.nix
                    ./home-manager/programs/vscode/extensions.nix
                    ./home-manager/programs/vscode/settings.nix

                    ./home-manager/programs/chromium.nix
                    ./home-manager/programs/direnv.nix
                    ./home-manager/programs/nixcord.nix
                    ./home-manager/programs/packages.nix
                    ./home-manager/programs/zsh.nix
                    ./home-manager/home.nix

                    inputs.nixcord.homeManagerModules.nixcord
                  ];

                  home = {
                    stateVersion = "24.05";
                  };
                };
                backupFileExtension = "backup";
                extraSpecialArgs = {
                  inherit inputs;
                };
              };
            }
          ];
        };
      };
    };
}

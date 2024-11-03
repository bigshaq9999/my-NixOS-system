{
  description = "My NixOS system configuration";

  inputs = {
    ## -- system modules --  ##
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # NixOS User Repository
    nur.url = "github:nix-community/NUR";
    ## -- system modules -- ##

    # vscode extensions set of packages(nixpkgs doesn't contain needed extensions)
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";

    # @donteatoreo - dis is a simple tool to compress videos 
    dis.url = "github:DontEatOreo/dis";
    dis.inputs.nixpkgs.follows = "nixpkgs";

    nixcord.url = "github:kaylorben/nixcord";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
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
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${userName} = {
                  imports = [
                    ./home-manager/programs/nixvim.nix

                    ./home-manager/programs/vscode/default.nix
                    ./home-manager/programs/vscode/extensions.nix
                    ./home-manager/programs/vscode/settings.nix

                    ./home-manager/programs/firefox/firefox.nix
                    ./home-manager/programs/discord/nixcord.nix
                    ./home-manager/programs/chromium.nix
                    ./home-manager/programs/direnv.nix
                    ./home-manager/programs/kitty.nix
                    ./home-manager/programs/packages.nix
                    ./home-manager/programs/zsh.nix
                    ./home-manager/home.nix

                    inputs.nixcord.homeManagerModules.nixcord
                    inputs.nur.nixosModules.nur
                    inputs.nixvim.homeManagerModules.nixvim
                  ];

                  home = {
                    stateVersion = "24.05";
                  };
                };
                backupFileExtension = "backup1";
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

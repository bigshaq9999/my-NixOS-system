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

    # Niri, the scrollable-tiling wayland compositor
    # niri.url = "github:sodiboo/niri-flake";
    # niri.inputs.nixpkgs.follows = "nixpkgs";

    catppuccin.url = "github:catppuccin/nix";
    catppuccin.inputs.nixpkgs.follows = "nixpkgs";

    ibus-bamboo.url = "github:BambooEngine/ibus-bamboo";
    ibus-bamboo.inputs.nixpkgs.follows = "nixpkgs";
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
                    ./home-manager/programs/helix.nix

                    ./home-manager/programs/vscode/default.nix
                    ./home-manager/programs/vscode/extensions.nix
                    ./home-manager/programs/vscode/settings.nix

                    ./home-manager/programs/ghostty.nix
                    ./home-manager/programs/theming.nix
                    ./home-manager/programs/dconf.nix
                    # ./home-manager/programs/niri.nix
                    # ./home-manager/programs/wlogout.nix
                    ./home-manager/programs/firefox/firefox.nix
                    # ./home-manager/programs/discord/nixcord.nix
                    ./home-manager/programs/chromium.nix
                    ./home-manager/programs/direnv.nix
                    ./home-manager/programs/kitty.nix
                    # ./home-manager/programs/taskwarrior.nix
                    ./home-manager/programs/packages.nix
                    ./home-manager/programs/zsh.nix
                    ./home-manager/programs/nushell.nix
                    ./home-manager/home.nix

                    inputs.nixcord.homeModules.nixcord
                    inputs.nur.modules.homeManager.default
                    inputs.nixvim.homeManagerModules.nixvim
                    # inputs.niri.homeModules.niri
                    inputs.catppuccin.homeManagerModules.catppuccin
                  ];

                  home = {
                    stateVersion = "24.11";
                  };
                };
                backupFileExtension = "bak";
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

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
    {
      self,
      nixpkgs,
      home-manager,
      nur,
      nix-vscode-extensions,
      meanvoid,
      dis,
      ...
    }@inputs:
    let
      commonAttrs = {
        inherit self;
        inherit inputs;
        inherit (self) outputs;
        inherit nixpkgs;
        inherit (nixpkgs) lib;
        inherit home-manager;
        inherit nur;
        inherit nix-vscode-extensions;
        inherit (dis) dis;
      };
    in
    {
      nixosConfigurations = import ./nixos commonAttrs;
    };
}

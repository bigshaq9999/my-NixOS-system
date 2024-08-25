{ inputs, ... }:
{
  imports = [
    ./programs/nvim/default.nix

    ./programs/vscode/default.nix
    ./programs/vscode/extensions.nix
    ./programs/vscode/settings.nix

    ./programs/chromium.nix
    ./programs/direnv.nix
    ./programs/nixcord.nix
    ./programs/packages.nix
    ./programs/zsh.nix
    inputs.nixcord.homeManagerModules.nixcord
  ];

  nixpkgs = {
    # overlays = [];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "nanachi";
    homeDirectory = "/home/nanachi";
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}

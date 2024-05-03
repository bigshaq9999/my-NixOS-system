# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  # You can import other NixOS modules here
  imports = [
    ./hardware-configuration.nix
    ./configs/fonts.nix
    ./configs/input.nix
    ./configs/plasma.nix
    ./configs/power.nix
    ./configs/program-config.nix
  ];

  nixpkgs = {
    overlays = [ ];
    config = {
      allowUnfree = true;
    };
  };

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  nix.registry = (lib.mapAttrs (_: flake: { inherit flake; })) (
    (lib.filterAttrs (_: lib.isType "flake")) inputs
  );

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = [ "/etc/nix/path" ];
  environment.etc = lib.mapAttrs' (name: value: {
    name = "nix/path/${name}";
    value.source = value.flake;
  }) config.nix.registry;

  nix.settings = {
    # Enable flakes and new 'nix' command
    experimental-features = "nix-command flakes";
    # Deduplicate and optimize nix store
    auto-optimise-store = true;
  };

  # Needed for store VSCode auth token
  services.gnome.gnome-keyring.enable = true;

  # Automated services
  nix.gc = {
    automatic = true;
    dates = "monthly";
  };

  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;

  networking.hostName = "nixos";
  networking.networkmanager = {
    enable = true;
    plugins = builtins.attrValues { inherit (pkgs) networkmanager-openvpn; };
  };

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Fonts
  fonts.packages = builtins.attrValues {
    inherit (pkgs)
      comic-mono
      hack-font
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      ;
    nerdfonts = pkgs.nerdfonts.override {
      fonts = [
        "FiraCode"
        "DroidSansMono"
      ];
    };
  };
  fonts.fontDir.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    options = "eurosign:e";
  };

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Enable sound.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    audio.enable = true;
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  users.users = {
    kunny = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "libvirtd"
      ];
    };
  };

  # Virt-manager
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  services.flatpak.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}

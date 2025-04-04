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
    # ./configs/plasma.nix
    ./configs/niri.nix
    ./configs/power.nix
    ./configs/program-config.nix
  ];

  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
      inputs.niri.overlays.niri
    ];
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

  # Secret portal for window managers
  services.gnome.gnome-keyring.enable = true;

  # Automated services
  nix.gc = {
    automatic = true;
    dates = "monthly";
  };

  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      plugins = builtins.attrValues { inherit (pkgs) networkmanager-openvpn; };
      wifi.powersave = true;
    };
  };

  # VPN
  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

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
  boot.initrd.luks.devices."luks-92b50b02-632d-47ab-9c84-a28c1d4ded01".device =
    "/dev/disk/by-uuid/92b50b02-632d-47ab-9c84-a28c1d4ded01";

  # Enable sound.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    audio.enable = true;
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber = {
      enable = true;
    };
    jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  users.users = {
    nanachi = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "libvirtd"
        "video"
      ];
    };
  };

  # Gaming
  programs.steam = {
    enable = true;
  };

  # Virt-manager
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Docker
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
  # MySQL
  services.mysql = {
    enable = false;
    package = pkgs.mysql84;
  };

  services.flatpak.enable = true;
  services.earlyoom.enable = true;

  programs.htop.enable = true;

  # Set default editor
  environment.variables = {
    EDITOR = "nvim";
    FREETYPE_PROPERTIES = "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0";
  };

  # Experimenting with systemd to get swaybg to work on niri
  systemd.user.services = {
    swaybg = {
      description = "wallpaper";
      serviceConfig = {
        Type = "simple";
        ExecStart = "${lib.getExe pkgs.swaybg} -i /home/nanachi/Downloads/Media/wallpapers/16-9_IMG_7584.png";
        Restart = "on-failure";
      };
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}

{ lib, pkgs, ... }: {
  services = {
    xserver.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  security.polkit.enable = true; # also for niri

  environment.sessionVariables = {
    # GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    MOZ_USE_XINPUT2 = "1"; # For firefox, see wiki/Firefox#Use_xinput2
    NIXOS_OZONE_WL = "1";
    GTK_USE_PORTAL = "1";
  };

  programs.xwayland = {
    enable = true;
  };

  programs.light.enable = true;
  programs.niri.enable = true;

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
}

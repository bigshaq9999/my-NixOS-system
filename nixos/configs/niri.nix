_: {
  services = {
    xserver.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  security.polkit.enable = true; # also for niri

  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    MOZ_USE_XINPUT2 = "1"; # For firefox, see wiki/Firefox#Use_xinput2
    NIXOS_OZONE_WL = "1";
    GTK_USE_PORTAL = "1";
  };

  programs.xwayland = {
    enable = true;
  };

  # security.pam.services.kwallet = {
  #   name = "kwallet";
  #   enableKwallet = true;
  # };

  programs.light.enable = true;
  programs.niri.enable = true;
}

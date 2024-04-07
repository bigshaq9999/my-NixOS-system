_: {
  services = {
    xserver = {
      enable = true;
      displayManager.defaultSession = "plasmawayland";
      displayManager.sddm.enable = true;
    };
    desktopManager.plasma6.enable = true;
  };
}

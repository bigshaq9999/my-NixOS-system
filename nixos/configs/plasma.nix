_: {
  services = {
    xserver = {
      enable = true;
      isplayManager.defaultSession = "plasmawayland";
      displayManager.sddm.enable = true;
    };
    desktopManager.plasma6.enable = true;
  };
}

_: {
  services = {
    displayManager.defaultSession = "plasmawayland";
    displayManager.sddm.enable = true;
    xserver = {
      enable = true;
      desktopManager.plasma5.enable = true;
    };
  };
}

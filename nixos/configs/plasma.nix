_: {
  services = {
    xserver = {
      enable = true;
      displayManager.defaultSession = "plasma";
      displayManager.sddm.enable = true;
    };
    desktopManager.plasma6.enable = true;
  };
}

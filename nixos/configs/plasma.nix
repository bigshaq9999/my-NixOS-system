_: {
  services = {
    xserver = {
      enable = true;
      displayManager.defaultSession = "plasma";
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
    };
  };
}

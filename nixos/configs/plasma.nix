_: {
  services = {
    xserver = {
      enable = true;
      displayManager.defaultSession = "plasma-wayland";
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
    };
  };
}

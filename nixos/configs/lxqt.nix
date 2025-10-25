_: {
  services = {
    displayManager.defaultSession = "lxqt";
    xserver = {
      enable = true;

      displayManager.lightdm = {
        enable = true;
      };

      desktopManager.lxqt = {
        enable = true; 
      };
    };
  };

  programs.xwayland.enable = true;
  programs.labwc.enable = true;
}

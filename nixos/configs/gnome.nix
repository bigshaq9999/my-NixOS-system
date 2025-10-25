{ pkgs, ... }:{
  services.gnome = {
    sushi.enable = true;
    glib-networking.enable = true;
    tinysparql.enable = true;
    localsearch.enable = true;
    gnome-keyring.enable = true;
    at-spi2-core.enable = true;
    core-developer-tools.enable = true;
    core-utilities.enable = true;
    gnome-settings-daemon.enable = true;
    gnome-online-accounts.enable = true;
    gnome-remote-desktop.enable = false;
  };

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  programs.xwayland = {
    enable = true;
  };

  environment.systemPackages = with pkgs.gnomeExtensions; [
    pop-shell
    appindicator
    clipboard-history
  ];
}

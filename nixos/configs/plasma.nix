{ pkgs, ... }:
{
  services = {
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;
  };

  environment.plasma6.excludePackages = builtins.attrValues {
    inherit (pkgs.kdePackages) discover;
    inherit (pkgs) orca;
  };
}

{
  pkgs,
  lib,
  config,
  ...
}: {
  system.fsPackages = [pkgs.bindfs];
  fileSystems =
    lib.mapAttrs
    (_: v:
      v
      // {
        fsType = "fuse.bindfs";
        options = ["ro" "resolve-symlinks" "x-gvfs-hide"];
      })
    {
      # "/usr/share/icons".device = "/run/current-system/sw/share/icons";
      "/usr/share/fonts".device =
        pkgs.buildEnv
        {
          name = "system-fonts";
          paths = config.fonts.packages;
          pathsToLink = ["/share/fonts"];
        }
        + "/share/fonts";
    };

  fonts.packages = with pkgs; [
    comic-mono
    hack-font
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override {fonts = ["FiraCode" "DroidSansMono"];})
  ];
  fonts.fontDir.enable = true;
}

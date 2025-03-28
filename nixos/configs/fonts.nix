# Special thanks to @ashuramaruzxc for this fix
{
  pkgs,
  lib,
  config,
  ...
}:
{
  system.fsPackages = [ pkgs.bindfs ];
  fileSystems =
    lib.mapAttrs
      (
        _: v:
        v
        // {
          fsType = "fuse.bindfs";
          options = [
            "ro"
            "resolve-symlinks"
            "x-gvfs-hide"
          ];
        }
      )
      {
        # "/usr/share/icons".device = "/run/current-system/sw/share/icons";
        "/usr/share/fonts".device =
          pkgs.buildEnv {
            name = "system-fonts";
            paths = config.fonts.packages;
            pathsToLink = [ "/share/fonts" ];
          }
          + "/share/fonts";
      };

  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
        monospace = [ "Hack" ];
        emoji = [ "Twitter Color Emoji" ];
      };
    };
    packages = builtins.attrValues {
      inherit (pkgs)
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        twitter-color-emoji
        ;
      inherit (pkgs.nerd-fonts)
        jetbrains-mono
        ;
    };
    fontDir.enable = true;
  };
}

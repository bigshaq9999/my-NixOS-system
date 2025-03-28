{ pkgs, ... }:
{
  i18n = {
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.waylandFrontend = true;
      fcitx5.addons = builtins.attrValues {
        inherit (pkgs)
          fcitx5-mozc
          fcitx5-unikey
          fcitx5-gtk
          ;
      };
    };
  };
}

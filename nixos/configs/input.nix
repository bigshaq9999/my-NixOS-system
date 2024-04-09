{ pkgs, ... }:
{
  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  i18n = {
    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = builtins.attrValues {
        inherit (pkgs) fcitx5-mozc fcitx5-unikey;
        fcitx5-qt = pkgs.libsForQt5.fcitx5-qt;
      };
    };
  };
}

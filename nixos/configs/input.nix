{ pkgs, ... }:
{
  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    MOZ_USE_XINPUT2 = "1"; # For firefox, see wiki/Firefox#Use_xinput2
  };

  i18n = {
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = builtins.attrValues { inherit (pkgs) fcitx5-mozc fcitx5-unikey; };
    };
  };
}

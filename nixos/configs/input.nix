{pkgs, ...}: {
  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  i18n = {
    inputMethod = {
      enabled = "fcitx5";
      # fcitx.engines = with pkgs.fcitx-engines; [ mozc unikey ];
      fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-unikey
        libsForQt5.fcitx5-qt
      ];
    };
  };
}

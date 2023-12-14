{pkgs, ...}: {
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

{ pkgs, inputs, ... }:
{
  home.packages = builtins.attrValues {
    # CLI
    dis = inputs.dis.packages.${pkgs.system}.default;

    inherit (pkgs)
      appimage-run
      bat
      duf
      eza
      hugo
      imagemagick
      nixfmt-rfc-style
      octaveFull
      pandoc
      pdftk
      rar
      steam-run
      tldr
      tree
      unzip
      xclip
      yt-dlp
      zip
      ;

    # Programming
    inherit (pkgs) git github-cli gitui;

    # Videos
    inherit (pkgs) ffmpeg_6-full mpv vlc;

    # Social
    inherit (pkgs)
      element-desktop
      nchat
      signal-desktop
      tdesktop
      thunderbird
      ;

    # Sound
    inherit (pkgs) pavucontrol qpwgraph;

    # Torrent
    inherit (pkgs) qbittorrent;

    # Windows
    wineWow-stable = pkgs.wineWowPackages.stable;
    inherit (pkgs) winetricks;

    # Educational
    inherit (pkgs) libreoffice-qt-still zoom-us;

    # KDE Plasma
    inherit (pkgs.libsForQt5) ark kolourpaint okular;

    inherit (pkgs)
      anki-bin
      bitwarden
      brave
      calyx-vpn
      gImageReader
      gimp
      networkmanager-openvpn
      mullvad-vpn
      obs-studio
      treesheets
      riseup-vpn
      ;
  };
}

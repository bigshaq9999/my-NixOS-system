{pkgs, ...}: let
  tex = pkgs.texlive.combine {
    inherit
      (pkgs.texlive)
      scheme-tetex
      collection-langcyrillic
      latexmk
      enumitem
      was
      ;
  };
in {
  home.packages = with pkgs; [
    # CLI
    eza
    tldr
    tree
    steam-run
    appimage-run
    neofetch
    unzip
    zip
    yt-dlp
    imagemagick
    duf
    rar
    pdftk
    xclip
    bat
    pandoc

    # Programming
    github-cli
    git
    python310
    #gcc
    clang_12
    clang-tools_12
    cmake

    # SDK
    nodejs
    openjdk

    # videos
    ffmpeg_5
    mpv
    vlc

    # Social
    thunderbird
    tdesktop
    # element-desktop
    fluffychat

    # Sound
    pavucontrol
    qpwgraph

    # torrent
    qbittorrent

    # windows
    wineWowPackages.stable
    winetricks

    # educational
    onlyoffice-bin
    zoom-us
    tex
    gImageReader
    libsForQt5.okular
    # obsidian
    anki

    # kde plasma
    libsForQt5.kcalc
    libsForQt5.ark

    # other
    teamviewer
    brave
    microsoft-edge
    obs-studio
    gimp
    # bitwarden
    tor-browser-bundle-bin

    # network
    riseup-vpn
    calyx-vpn
    networkmanager-openvpn
  ];
}

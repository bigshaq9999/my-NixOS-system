{pkgs, ...}: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
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
      nheko
      vesktop
      # Sound
      
      pavucontrol
      qpwgraph
      # torrent
      
      qbittorrent
      ;

    # windows
    wineWow-stable = pkgs.wineWowPackages.stable;
    inherit
      (pkgs)
      winetricks
      # educational
      
      onlyoffice-bin
      zoom-us
      ;
    tex = pkgs.texlive.combine {
      inherit
        (pkgs.texlive)
        scheme-tetex
        latexmk
        enumitem
        was
        lastpage
        titlesec
        ebgaramond
        microtype
        fontaxes
        ;
    };
    inherit (pkgs) gImageReader;
    okular = pkgs.libsForQt5.okular;
    inherit
      (pkgs)
      # obsidian
      
      anki-bin
      ;

    # kde plasma
    kcalc = pkgs.libsForQt5.kcalc;
    ark = pkgs.libsForQt5.ark;
    kolourpaint = pkgs.libsForQt5.kolourpaint;

    inherit
      (pkgs)
      # other
      
      treesheets
      teamviewer
      brave
      microsoft-edge
      obs-studio
      gimp
      bitwarden
      tor-browser-bundle-bin
      # network
      
      riseup-vpn
      calyx-vpn
      networkmanager-openvpn
      ;
  };
}

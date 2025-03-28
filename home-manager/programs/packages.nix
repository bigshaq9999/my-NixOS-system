{ pkgs, inputs, ... }:
let
  krisp-patcher =
    pkgs.writers.writePython3Bin "krisp-patcher"
      {
        libraries = with pkgs.python3Packages; [
          capstone
          pyelftools
        ];
        flakeIgnore = [
          "E501" # line too long (82 > 79 characters)
          "F403" # 'from module import *' used; unable to detect undefined names
          "F405" # name may be undefined, or defined from star imports: module
        ];
      }
      (
        builtins.readFile (
          pkgs.fetchurl {
            url = "https://raw.githubusercontent.com/sersorrel/sys/7806b21ce74ef7953c3d38edb0116cc9d0851302/hm/discord/krisp-patcher.py";
            sha256 = "sha256-h8Jjd9ZQBjtO3xbnYuxUsDctGEMFUB5hzR/QOQ71j/E=";
          }
        )
      );
in
# in your system packages or home packages
{
  home.packages = builtins.attrValues {
    # CLI
    dis = inputs.dis.packages.${pkgs.system}.default;
    krisp-patcher = krisp-patcher;

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
    inherit (pkgs)
      git
      github-cli
      gitui
      nil
      mycli
      emacs
      ripgrep
      ;

    # Videos
    inherit (pkgs) ffmpeg_6-full mpv vlc;

    # Social
    inherit (pkgs)
      element-desktop
      nchat
      signal-desktop
      tdesktop
      thunderbird-bin
      mailspring
      ;

    # Sound
    inherit (pkgs) pavucontrol qpwgraph;

    # Torrent
    inherit (pkgs) qbittorrent;

    # Windows
    wineWow-stable = pkgs.wineWowPackages.stable;
    inherit (pkgs) winetricks;

    # Educational
    inherit (pkgs) libreoffice-still zoom-us;

    # KDE Plasma
    inherit (pkgs.kdePackages)
      ark
      kolourpaint
      okular
      kclock
      # dolphin
      ;

    inherit (pkgs)
      anki-bin
      bitwarden
      gImageReader
      gimp
      mullvad-vpn
      networkmanager-openvpn
      obs-studio
      treesheets
      francis
      nekoray
      ollama
      ;

    # for Niri
    inherit (pkgs)
      cliphist
      fuzzel
      libayatana-appindicator
      mako
      pcmanfm
      # Extends pcmanfm #
      libgsf # opendocument thumbnail
      ffmpegthumbnailer # video thumbnail
      evince # pdf thumbnail
      ###
      polkit_gnome
      swaybg
      swayidle
      swaylock
      waybar
      wl-clipboard
      wlogout
      #  xwayland-satellite
      ;
  };
}

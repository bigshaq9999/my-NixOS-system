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
            url = "https://raw.githubusercontent.com/sersorrel/sys/afc85e6b249e5cd86a7bcf001b544019091b928c/hm/discord/krisp-patcher.py";
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
      sqlfluff
      mycli
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
      mullvad-vpn
      networkmanager-openvpn
      obs-studio
      riseup-vpn
      treesheets
      francis
      ;
  };
}

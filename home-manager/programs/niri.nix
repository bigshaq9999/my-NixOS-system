{
  pkgs,
  config,
  lib,
  ...
}:
{
  home.pointerCursor = {
    enable = true;
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
    size = 64;
    gtk.enable = true;
    x11 = {
      enable = true;
      defaultCursor = "phinger-cursors-light";
    };
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Catppuccin-Frappe-Dark-Cursors";
      package = pkgs.catppuccin-cursors.frappeDark;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    catppuccin = {
      enable = true;
      flavor = "frappe";
      accent = "rosewater";
      size = "standard";
      tweaks = [ "normal" ];
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "kde6";
    style.name = "breeze-dark";
  };

  services.kanshi = {
    enable = true;
    settings = [
      {
        profile = {
          name = "docked";
          outputs = [
            {
              criteria = "eDP-1";
              status = "disable";
            }
            {
              criteria = "HDMI-A-1";
              status = "enable";
              mode = "1920x1080@60.000";
            }
          ];
        };
      }
      {
        profile = {
          name = "undocked";
          outputs = [
            {
              criteria = "eDP-1";
              status = "enable";
            }
          ];
        };
      }
    ];
  };

  catppuccin = {
    enable = true;
    flavor = "frappe";
    accent = "rosewater";
    waybar.enable = false;
    kvantum.enable = false;
  };

  xdg = {
    enable = true;
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config = {
        common = {
          default = [
            "gtk"
            "gnome"
          ];

          # For screensharing to work on discord, etc...
          "org.freedesktop.impl.portal.ScreenCast" = "gnome";
          "org.freedesktop.impl.portal.Screenshot" = "gnome";
          "org.freedesktop.impl.portal.RemoteDesktop" = "gnome";
        };
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
        xdg-desktop-portal-shana
        xdg-desktop-portal-wlr
      ];
      configPackages = with pkgs; [ gnome-session ];
    };
    mime.enable = true;
  };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 20;
        modules-left = [ "niri/workspaces" ];
        modules-center = [ "niri/window" ];
        modules-right = [
          "idle_inhibitor"
          "pulseaudio"
          "network"
          "bluetooth"
          "power-profiles-daemon"
          "cpu"
          "memory"
          "temperature"
          "backlight"
          "keyboard-state"
          "battery"
          "clock"
          "tray"
        ];
        keyboard-state = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };
        tray = {
          spacing = 10;
        };
        clock = {
          format = "{:%Y-%m-%d %H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };
        memory = {
          format = "{}% ";
        };
        temperature = {
          format = "{temperatureC}°C";
        };
        backlight = {
          format = "{percent}% {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };
        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-full = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
        power-profiles-daemon = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };
        network = {
          format-wifi = "{bandwidthTotalBits} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr}";
          tooltip-format = "{ifname} via {gwaddr}";
          format-linked = "{ifname} (No IP)";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{essid}: {ipaddr}/{cidr}";
        };
        pulseaudio = {
          scroll-step = 1; # %, can be a float
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
        };
        bluetooth = {
          format = "  {status} ";
          format-off = "";
          format-connected = " {num_connections} connected";
          tooltip-format = "{controller_alias}\t{controller_address}";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
        };
      };
    };
  };

  programs.niri = {
    enable = true;
    # TODO: check on this issue https://github.com/sodiboo/niri-flake/issues/921
    # package = pkgs.niri-stable.overrideAttrs (prev: {
    #   buildInputs = prev.buildInputs ++ [ pkgs.libgbm ];
    # });
    settings = {
      environment = {
        QT_QPA_PLATFORM = "wayland";
        DISPLAY = ":0";
      };
      input = {
        touchpad = {
          tap = true;
          natural-scroll = false;
          accel-profile = "flat";
          accel-speed = 0.2;
          scroll-factor = 0.2;
        };
      };
      layout = {
        gaps = 10;
        preset-column-widths = [
          { proportion = 1. / 3.; }
          { proportion = 1. / 2.; }
          { proportion = 2. / 3.; }
        ];
        default-column-width = {
          proportion = 0.9;
        };
        focus-ring = {
          width = 4;
          active.color = "#7fc8ff";
          inactive.color = "#505050";
        };
        border = {
          enable = false;
        };
        shadow = {
          enable = true;
        };
        # center-focused-column = "on-overflow";
      };
      spawn-at-startup = [
        # { command = [ (lib.getExe pkgs.swaybg) "-i" "/home/nanachi/Downloads/Media/wallpapers/16-9_IMG_7584.png" ]; }
        { command = [ (lib.getExe pkgs.waybar) ]; }
        {
          command = [
            (lib.getExe' pkgs.wl-clipboard "wl-paste")
            "--watch"
            "cliphist"
            "store"
          ];
        }
        { command = [ (lib.getExe pkgs.xwayland-satellite) ]; }
        {
          command = [
            (lib.getExe pkgs.swaylock)
            "-w"
            "timeout"
            "601"
            "'niri msg action power-off-monitors'"
            "timeout"
            "600"
            "'swaylock -f'"
            "before-sleep"
            "'swaylock -f'"
          ];
        }
      ];
      prefer-no-csd = true;
      screenshot-path = "~/Pictures/Screenshots/Screenshot_%Y%m%d_%H%M%S.png";
      window-rules = [
        {
          # credit to github:linuxmobile/kaku
          geometry-corner-radius =
            let
              radius = 16.0;
            in
            {
              bottom-left = radius;
              bottom-right = radius;
              top-left = radius;
              top-right = radius;
            };
          clip-to-geometry = true;
        }
      ];
      binds =
        with config.lib.niri.actions;
        let
          sh = spawn "sh" "-c";
        in
        {
          "Mod+Shift+Slash".action = show-hotkey-overlay;
          "Mod+T".action = spawn "kitty";
          "Mod+D".action = spawn "fuzzel";
          "Super+Alt+L".action =
            spawn "swaylock" "-i"
              "./Downloads/Media/wallpapers/scaled_16-9-IMG_7584.png";

          "XF86AudioRaiseVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+";
          "XF86AudioLowerVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-";
          "XF86AudioMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
          "XF86AudioMicMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";

          "XF86MonBrightnessUp".action = spawn "light" "-T" "1.1";
          "XF86MonBrightnessDown".action = spawn "light" "-T" "0.9";

          "Mod+Q".action = close-window;

          "Mod+Left".action = focus-column-left;
          "Mod+Down".action = focus-window-down;
          "Mod+Up".action = focus-window-up;
          "Mod+Right".action = focus-column-right;
          "Mod+H".action = focus-column-left;
          "Mod+J".action = focus-window-down;
          "Mod+K".action = focus-window-up;
          "Mod+L".action = focus-column-right;

          "Mod+Ctrl+Left".action = move-column-left;
          "Mod+Ctrl+Down".action = move-window-down;
          "Mod+Ctrl+Up".action = move-window-up;
          "Mod+Ctrl+Right".action = move-column-right;
          "Mod+Ctrl+H".action = move-column-left;
          "Mod+Ctrl+J".action = move-window-down;
          "Mod+Ctrl+K".action = move-window-up;
          "Mod+Ctrl+L".action = move-column-right;

          "Mod+Home".action = focus-column-first;
          "Mod+End".action = focus-column-last;
          "Mod+Ctrl+Home".action = move-column-to-first;
          "Mod+Ctrl+End".action = move-column-to-last;

          "Mod+Shift+Left".action = focus-monitor-left;
          "Mod+Shift+Down".action = focus-monitor-down;
          "Mod+Shift+Up".action = focus-monitor-up;
          "Mod+Shift+Right".action = focus-monitor-right;
          "Mod+Shift+H".action = focus-monitor-left;
          "Mod+Shift+J".action = focus-monitor-down;
          "Mod+Shift+K".action = focus-monitor-up;
          "Mod+Shift+L".action = focus-monitor-right;

          "Mod+Shift+Ctrl+Left".action = move-column-to-monitor-left;
          "Mod+Shift+Ctrl+Down".action = move-column-to-monitor-down;
          "Mod+Shift+Ctrl+Up".action = move-column-to-monitor-up;
          "Mod+Shift+Ctrl+Right".action = move-column-to-monitor-right;
          "Mod+Shift+Ctrl+H".action = move-column-to-monitor-left;
          "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
          "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
          "Mod+Shift+Ctrl+L".action = move-column-to-monitor-right;

          "Mod+Page_Down".action = focus-workspace-down;
          "Mod+Page_Up".action = focus-workspace-up;
          "Mod+U".action = focus-workspace-down;
          "Mod+I".action = focus-workspace-up;
          "Mod+Ctrl+Page_Down".action = move-column-to-workspace-down;
          "Mod+Ctrl+Page_Up".action = move-column-to-workspace-up;
          "Mod+Ctrl+U".action = move-column-to-workspace-down;
          "Mod+Ctrl+I".action = move-column-to-workspace-up;

          "Mod+Shift+Page_Down".action = move-workspace-down;
          "Mod+Shift+Page_Up".action = move-workspace-up;
          "Mod+Shift+U".action = move-workspace-down;
          "Mod+Shift+I".action = move-workspace-up;

          "Mod+WheelScrollDown".action = focus-workspace-down;
          "Mod+WheelScrollUp".action = focus-workspace-up;
          "Mod+Ctrl+WheelScrollDown".action = move-column-to-workspace-down;
          "Mod+Ctrl+WheelScrollUp".action = move-column-to-workspace-up;

          "Mod+WheelScrollRight".action = focus-column-right;
          "Mod+WheelScrollLeft".action = focus-column-left;
          "Mod+Ctrl+WheelScrollRight".action = move-column-right;
          "Mod+Ctrl+WheelScrollLeft".action = move-column-left;

          "Mod+Shift+WheelScrollDown".action = focus-column-right;
          "Mod+Shift+WheelScrollUp".action = focus-column-left;
          "Mod+Ctrl+Shift+WheelScrollDown".action = move-column-right;
          "Mod+Ctrl+Shift+WheelScrollUp".action = move-column-left;

          "Mod+1".action = focus-workspace 1;
          "Mod+2".action = focus-workspace 2;
          "Mod+3".action = focus-workspace 3;
          "Mod+4".action = focus-workspace 4;
          "Mod+5".action = focus-workspace 5;
          "Mod+6".action = focus-workspace 6;
          "Mod+7".action = focus-workspace 7;
          "Mod+8".action = focus-workspace 8;
          "Mod+9".action = focus-workspace 9;
          "Mod+Ctrl+1".action = move-column-to-workspace 1;
          "Mod+Ctrl+2".action = move-column-to-workspace 2;
          "Mod+Ctrl+3".action = move-column-to-workspace 3;
          "Mod+Ctrl+4".action = move-column-to-workspace 4;
          "Mod+Ctrl+5".action = move-column-to-workspace 5;
          "Mod+Ctrl+6".action = move-column-to-workspace 6;
          "Mod+Ctrl+7".action = move-column-to-workspace 7;
          "Mod+Ctrl+8".action = move-column-to-workspace 8;
          "Mod+Ctrl+9".action = move-column-to-workspace 9;

          "Mod+Tab".action = focus-workspace-previous;

          "Mod+BracketLeft".action = consume-or-expel-window-left;
          "Mod+BracketRight".action = consume-or-expel-window-right;

          "Mod+Comma".action = consume-window-into-column;
          "Mod+Period".action = expel-window-from-column;

          "Mod+R".action = switch-preset-column-width;
          "Mod+Shift+R".action = switch-preset-window-height;
          "Mod+Ctrl+R".action = reset-window-height;
          "Mod+F".action = maximize-column;
          "Mod+Shift+F".action = fullscreen-window;

          "Mod+Ctrl+F".action = expand-column-to-available-width;

          "Mod+C".action = center-column;

          "Mod+Minus".action = set-column-width "-2%";
          "Mod+Equal".action = set-column-width "+2%";

          "Mod+Shift+Minus".action = set-window-height "-2%";
          "Mod+Shift+Equal".action = set-window-height "+2%";

          "Mod+V".action = toggle-window-floating;
          "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;

          "Mod+W".action = toggle-column-tabbed-display;

          "Print".action = screenshot;
          "Ctrl+Print".action = {
            screenshot-screen = {
              write-to-disk = true;
            };
          };
          "Alt+Print".action = screenshot-window;

          "Mod+Escape".action = toggle-keyboard-shortcuts-inhibit;

          "Mod+Shift+E".action = quit;
          "Ctrl+Alt+Delete".action = quit;

          "Mod+Shift+P".action = power-off-monitors;

          "Mod+Apostrophe".action = spawn "wlogout";

          "Mod+Slash".action = sh "cliphist list | fuzzel --dmenu | cliphist decode | wl-copy";
        };
    };
  };
}

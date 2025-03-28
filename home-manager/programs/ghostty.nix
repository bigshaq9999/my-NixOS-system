{
  lib,
  ...
}:
let
  superKey = "ctrl";
  mkSuper = k: c: "${superKey}+${k}=${c}";
  mkSuperPerf = k: c: "performable:${superKey}+${k}=${c}";
  mkSuperShift = k: c: "${superKey}+shift+${k}=${c}";
  mkSuperShiftNested =
    p: k: c:
    "${superKey}+shift+${p}>${k}=${c}";

  # Source: https://vt100.net/docs/vt100-ug/chapter3.html
  # Converter: https://www.rapidtables.com/convert/number/hex-to-octal.html
  ctrl =
    let
      x = "\\x";
    in
    {
      # SOH (Function Mnemonic) = 001 (Octal Code Transmitted) -> "\x01" (string literal)
      SOH = "${x}01"; # Start of heading
      ENQ = "${x}05"; # Enquiry
      ESC = "${x}1b"; # Escape

      # "2 ↓" Key on Physical Keypad Keyboard
      WORD_BACK = "${x}62"; # b
      # "6 →" Key on Physical Keypad Keyboard
      WORD_FORWARD = "${x}66"; # f
    };

  directions = {
    up = "top";
    down = "bottom";
    left = "left";
    right = "right";
  };

  mkKeybindings = {
    cursor = [
      (mkSuper "left" "text:${ctrl.ESC}${ctrl.WORD_BACK}")
      (mkSuper "right" "text:${ctrl.ESC}${ctrl.WORD_FORWARD}")

      "alt+left=text:${ctrl.SOH}"
      "alt+right=text:${ctrl.ENQ}"
    ];

    splits =
      let
        # k: is used for new_split/resize_split commands (up/down/left/right)
        # v: is used for goto_split commands which expect top/bottom/left/right
        mkSplitCommands = k: v: [
          (mkSuperShiftNested "s" k "new_split:${k}")
          (mkSuperShiftNested "r" k "resize_split:${k},30")
          (mkSuperShift k "goto_split:${v}")
        ];
      in
      lib.flatten (lib.mapAttrsToList mkSplitCommands directions)
      ++ [
        (mkSuper "t" "new_tab")
        (mkSuper "e" "equalize_splits")
      ];

    screen = [
      (mkSuper "k" "clear_screen")
      (mkSuper "g" "write_screen_file:open")
      (mkSuperShift "left" "scroll_page_up")
      (mkSuperShift "right" "scroll_page_down")
    ];

    font = [
      (mkSuper "0" "reset_font_size")

      (mkSuper "equal" "increase_font_size:1")
      "${superKey}+shift+equal=increase_font_size:1"

      (mkSuper "minus" "decrease_font_size:1")
      "${superKey}+shift+minus=decrease_font_size:1"
    ];

    clipboard = [
      (mkSuperPerf "c" "copy_to_clipboard")
      (mkSuperPerf "v" "paste_from_clipboard")
    ];

    misc = [
      (mkSuper "a" "select_all")
      (mkSuper "," "reload_config")
      (mkSuperShift "backspace" "close_window")
    ];

    tabs = map (n: mkSuper (toString n) "goto_tab:${toString n}") (lib.range 1 9);
  };
in
{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    clearDefaultKeybinds = true;
    settings = {
      # General

      ## Theme
      theme = "catppuccin-frappe";

      ## Scroll
      scrollback-limit =
        let
          mkMillion = m: m * 1000000;
        in
        mkMillion 100;

      ## Mouse & Cursor
      cursor-style-blink = false;
      mouse-scroll-multiplier = 3;

      # Line height
      adjust-underline-position = 4;

      ## Keybinds
      keybind = lib.flatten (lib.attrValues mkKeybindings);

      # Misc
      confirm-close-surface = false;
      quit-after-last-window-closed = true;
      clipboard-paste-protection = false;
    };
  };
}

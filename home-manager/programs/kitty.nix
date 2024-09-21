_: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font = {
      name = "FiraCode Nerd Font Mono";
      size = 12;
    };
    theme = "Solarized Dark - Patched";
    settings = {
      draw_minimal_borders = "yes";

      hide_window_decorations = "no";
    };
    keybindings = {
      "ctrl+b" = "select_tab";
    };
  };
}

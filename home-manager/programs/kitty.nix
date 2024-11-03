_: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font = {
      name = "Hack Nerd Font";
      size = 12;
    };
    themeFile = "Solarized_Dark_-_Patched";
    settings = {
      draw_minimal_borders = "yes";

      hide_window_decorations = "no";
    };
    keybindings = {
      "ctrl+b" = "select_tab";
    };
  };
}

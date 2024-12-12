_: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font = {
      name = "JetBrainsMonoNL Nerd Font Mono";
      size = 12;
    };
    themeFile = "ayu_light";
    settings = {
      draw_minimal_borders = "yes";

      hide_window_decorations = "no";
    };
  };
}

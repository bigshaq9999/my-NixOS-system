_: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;

    themeFile = "Catppuccin-Latte";
    font = {
      name = "JetBrainsMonoNL Nerd Font Mono";
      size = 12;
    };

    settings = {
      draw_minimal_borders = "yes";
      hide_window_decorations = "no";
    };
    
    keybindings = {
      "f1" = "launch --stdin-source=@screen_scrollback --type=tab vi";
    };
  };
}

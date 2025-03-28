_: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;

    themeFile = "Catppuccin-Frappe";
    font = {
      name = "JetBrainsMonoNL Nerd Font Mono";
      size = 12;
    };

    settings = {
      draw_minimal_borders = false;
      hide_window_decorations = true;
      window_border_width = "0px";
      tab_bar_edge = "top";
      tab_bar_margin_width = "0.0";
      tab_bar_style = "fade";
      placement_strategy = "top-left";
    };

    keybindings = {
      "f1" = "launch --stdin-source=@screen_scrollback --type=tab vi";
    };
  };
}

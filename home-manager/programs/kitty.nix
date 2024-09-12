{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font Mono";
      size = "12"; 
      theme = "Solarized Light";
    };
    shellIntegration.enableZshIntegration = true;
  };
}

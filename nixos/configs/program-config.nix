{ pkgs, ... }:
{
  users.defaultUserShell = pkgs.zsh;
  programs = {
    nano = {
      enable = true;
      syntaxHighlight = true;
    };
    zsh.enable = true;
    dconf.enable = true;
  };
}

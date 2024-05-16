{ pkgs, ... }:
{
  users.defaultUserShell = pkgs.zsh;
  programs = {
    nano.syntaxHighlight = true;
    zsh.enable = true;
    dconf.enable = true;
  };
}

{pkgs, ...}: {
  programs.htop.enable = true;
  programs.nano.syntaxHighlight = true;

  # Vim
  programs.vim = {
    defaultEditor = true;
  };

  # zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  programs.dconf.enable = true;
}

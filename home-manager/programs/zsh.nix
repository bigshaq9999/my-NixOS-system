{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    defaultKeymap = "emacs";
    shellAliases = {
      ll = "eza -lah";
      upgrade = "cd /etc/nixos && nixos-rebuild switch --use-remote-sudo -v --flake .#nixos";
      garbage = "sudo nix-collect-garbage --delete-older-than 14d";
      todo = "vi /home/nanachi/todo/";
      cfg = "cd /etc/nixos && vi ./";
      copydir = "pwd | xclip -selection clipboard";
      gpp = "c++ -Wall -Weffc++ -Wextra -Wsign-conversion -pedantic-errors -Werror";
      gpp17 = "c++ -Wall -Weffc++ -Wextra -Wsign-conversion -pedantic-errors -Werror -std=c++17";
      gpp20 = "c++ -Wall -Weffc++ -Wextra -Wsign-conversion -pedantic-errors -Werror -std=c++20";
      gcf = "c++ -Wall -O2 -std=c++20 -g";
      runjava = ''f() { javac "''$1" && java "''${1%.java}"; }; f'';
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "dirhistory"
        "copybuffer"
        "copyfile"
      ];
    };
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k.config";
        src = ../programs;
        file = "p10k.zsh";
      }
    ];
  };
}

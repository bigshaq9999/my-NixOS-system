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
      cfg = "cd /etc/nixos && vi ./nixos/configuration.nix";
      copydir = "pwd | xclip -selection clipboard";
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

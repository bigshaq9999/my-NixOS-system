{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    defaultKeymap = "emacs";
    shellAliases = {
      ll = "ls -lah";
      update = "nix-channel --update";
      sysupgrade = "cd /etc/nixos/ && nixos-rebuild switch --use-remote-sudo --flake .#nixos --show-trace";
      homeupgrade = "cd /etc/nixos/ && sudo home-manager switch --flake .#kunny@nixos --show-trace --impure";
      garbage = "sudo nix-collect-garbage --delete-older-than 14d";
      todo = "vim /home/kunny/todo.md";
      cfg = "sudo vim /etc/nixos/";
      copydir = "pwd | xclip -selection clipboard";
      gpp = "c++ -Wall -Weffc++ -Wextra -Wsign-conversion -pedantic-errors -Werror";
      gpp17 = "c++ -Wall -Weffc++ -Wextra -Wsign-conversion -pedantic-errors -Werror -std=c++17";
      gpp20 = "c++ -Wall -Weffc++ -Wextra -Wsign-conversion -pedantic-errors -Werror -std=c++20";
      gcf = "c++ -Wall -O2 -std=c++20 -g";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "dirhistory"
        "copybuffer"
        "copyfile"
      ];
      theme = "lukerandall";
    };
  };
}

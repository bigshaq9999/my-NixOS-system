{ pkgs, ... }:
{
  programs.nushell = {
    enable = true;
    shellAliases = {
      now = ''date now | format date "%H:%M:%S"'';
      nowtime = "date now";
      nowdate = ''date now | format date "%d-%m-%Y"'';
      nowunix = "date now | format date '%s'";

      ls = "ls";
      lt = "ls --all | sort-by size -r";
      ll = "ls --all";
      llf = ''ls --all | where type == "file"'';
      ld = ''ls --all | find --regex "^\\."'';

      upgrade = "nixos-rebuild switch --use-remote-sudo -v --flake /etc/nixos";
      update = "nix flake update --flake /etc/nixos";
      check = "nix flake check /etc/nixos";
    };

    plugins = builtins.attrValues {
      inherit (pkgs.nushellPlugins)
        formats
        highlight
        query
        # units
        ;
    };

    configFile.text = ''
      # Generic
      $env.EDITOR = "nvim";
      $env.VISUAL = "nvim";
      $env.config.show_banner = false;
      $env.config.buffer_editor = "nvim";

      # Vi
      $env.config.edit_mode = "vi";
      $env.config.cursor_shape.vi_insert = "line"
      $env.config.cursor_shape.vi_normal = "block"

      let $config = {
        rm_always_trash: true
        shell_integration: true
        highlight_resolved_externals: true
        use_kitty_protocol: true
        completion_algorithm: "fuzzy"
      }
    '';

    extraConfig =
      let
        customCompletions = pkgs.fetchFromGitHub {
          owner = "nushell";
          repo = "nu_scripts";
          rev = "10b22626f73077c362409e24b77db329f29a7c98";
          hash = "sha256-1qU5e1lNEeOVQhu91nq7EpuCExpEZ95DuJzuvByK8jw=";
        };
        completionTypes = [
          "bat"
          "curl"
          "gh"
          "git"
          "man"
          "nix"
          "ssh"
          "vscode"
        ];
        sourceCommands = map (
          t: "source ${customCompletions}/custom-completions/${t}/${t}-completions.nu"
        ) completionTypes;
      in
      builtins.concatStringsSep "\n" sourceCommands;
  };
}

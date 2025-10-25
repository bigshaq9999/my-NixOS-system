{ lib, ... }:
let
  language-server = {
    bash-language-server = {
      args = [ "start" ];
      command = "bash-language-server";
      config.enable = true;
    };
    nil = {
      command = "nil";
      config.nil.formatting.command = [ "nixfmt" ];
    };
    yaml-language-server = {
      command = "yaml-language-server";
      args = [ "--stdio" ];
      config = {
        yaml = {
          format.enable = true;
          validation = true;
          schemas.https = true;
        };
      };
    };
    taplo = {
      command = "taplo";
      args = lib.splitString " " "lsp stdio";
      config.formatter.alignEntries = true;
      config.formatter.columnWidth = 100;
    };
    ruff = {
      command = "ruff";
      args = lib.splitString " " "server --preview";
      config.lineLength = 100;
      config.lint.extendSelect = [ "I" ];
    };
    pylsp = {
      command = "pylsp";
      plugins.pylsp_mypy.enable = true;
      plugins.pylsp_mypy.live_mode = true;
    };
    jedi = {
      command = "jedi-language-server";
    };
  };

  language = [
    {
      name = "nix";
      auto-format = true;
      language-servers = [ "nil" ];
    }
    {
      name = "python";
      auto-format = true;
      language-servers = [
        "ruff"
        "pylsp"
        "jedi"
      ];
    }
    {
      name = "bash";
      auto-format = true;
      diagnostic-severity = "warning";
      formatter.args = [ "-w" ];
      formatter.command = "shfmt";
      language-servers = [ "bash-language-server" ];
    }
    {
      name = "yaml";
      auto-format = true;
      language-servers = [ "yaml-language-server" ];
    }
    {
      name = "toml";
      auto-format = true;
      language-servers = [ "taplo" ];
    }
  ];
  editor = {
    # Core
    auto-format = true;
    auto-save = false;
    idle-timeout = 50;

    # Visual
    color-modes = true;
    cursorline = true;
    cursor-shape = {
      insert = "bar";
      normal = "block";
      select = "underline";
    };
    gutters = [
      "diagnostics"
      "line-numbers"
      "spacer"
      "diff"
    ];
    indent-guides.render = true;
    line-number = "relative";
    rulers = [
      72
      80
    ];
    statusline.center = [ "position-percentage" ];
    true-color = true;
    whitespace.characters = {
      nbsp = "⍽";
      newline = "⏎";
      space = "·";
      tab = "→";
      tabpad = "·";
      trail = "•";
    };

    # LSP and Completion
    completion-replace = true;
    completion-trigger-len = 1;
    lsp = {
      display-messages = true;
      display-inlay-hints = true;
    };

    # File and Buffer
    bufferline = "always";
    file-picker = {
      git-global = true;
      git-ignore = true;
      hidden = false;
    };
    soft-wrap.enable = true;

    # Search
    search = {
      smart-case = true;
      wrap-around = true;
    };

    mouse = true;
  };
in
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    languages = { inherit language-server language; };
    settings = {
      theme = "catppuccin_frappe";
      inherit editor;
      keys = {
        normal = {
          space.space = "file_picker";
          esc = [
            "collapse_selection"
            "keep_primary_selection"
          ];
        };
        select = { };
      };
    };
  };
}

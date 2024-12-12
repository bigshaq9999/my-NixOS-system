_: {
  programs.vscode.userSettings = {
    "zenMode.fullScreen" = false;
    "zenMode.hideLineNumbers" = false;

    "editor.fontSize" = 13;
    "editor.fontFamily" = "JetBrainsMonoNL Nerd Font Mono";
    "editor.fontLigatures" = true;
    "editor.cursorSurroundingLines" = 2;
    "editor.rulers" = [ 80 ];
    "editor.minimap.enabled" = false;
    "editor.mouseWheelZoom" = true;
    "editor.guides.bracketPairs" = "active";
    "editor.bracketPairColorization.independentColorPoolPerBracketType" = true;
    "security.workspace.trust.enabled" = false;
    "editor.accessibilitySupport" = "off";
    "editor.lineNumbers" = "relative";

    "debug.console.fontSize" = 13;
    "security.workspace.trust.untrustedFiles" = "open";
    "terminal.integrated.fontFamily" = "JetBrainsMonoNL Nerd Font Mono";
    "window.menuBarVisibility" = "toggle";
    "window.zoomLevel" = 0.75;
    "workbench.sideBar.location" = "right";

    "workbench.colorTheme" = "Solarized Dark";

    "latex-workshop.latex.autoBuild.run" = "never";

    "cSpell.language" = "en";

    "vim.useSystemClipboard" = true;

    "markdown.extension.list.indentationSize" = "inherit";

    "codium.enabled" = true;

    "[python]" = {
      "editor.formatOnType" = true;
    };

    "[html]" = {
      "editor.defaultFormatter" = "vscode.html-language-features";
    };

    "alejandra.program" = "nixfmt";
    "[nix]" = {
      "editor.defaultFormatter" = "kamadorueda.alejandra";
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;
      "editor.formatOnType" = false;
    };

    "github.copilot.enable" = {
      "*" = true;
      "plaintext" = false;
      "markdown" = false;
      "scminput" = false;
      "nix" = false;
      "lock" = false;
      "tape" = false;
    };
  };
}

{
  pkgs,
  inputs,
  ...
}: let
  system = "x86_64-linux";
  inherit (inputs.nix-vscode-extensions.extensions.${system}) vscode-marketplace;
in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with vscode-marketplace; [
      ms-vscode-remote.vscode-remote-extensionpack
      github.copilot
      github.copilot-chat
      vscode-icons-team.vscode-icons
      ms-vsliveshare.vsliveshare
      visualstudioexptteam.vscodeintellicode

      mads-hartmann.bash-ide-vscode

      bbenoist.nix
      jnoortheen.nix-ide
      kamadorueda.alejandra

      ms-python.python
      ms-python.vscode-pylance
      ms-toolsai.jupyter

      ms-vscode.vscode-typescript-next
      mgmcdermott.vscode-language-babel
      steoates.autoimport
      dbaeumer.vscode-eslint

      davidanson.vscode-markdownlint
      james-yu.latex-workshop
      redhat.vscode-xml
      aykutsarac.jsoncrack-vscode
      streetsidesoftware.code-spell-checker

      llvm-vs-code-extensions.vscode-clangd

      vscodevim.vim
      oderwat.indent-rainbow
      esbenp.prettier-vscode
      ryu1kn.partial-diff
      usernamehw.errorlens
      jdinhlife.gruvbox
    ];
    mutableExtensionsDir = true;
    userSettings = {
      "zenMode.fullScreen" = false;
      "zenMode.hideLineNumbers" = false;

      "editor.fontSize" = 16;
      "editor.cursorSurroundingLines" = 6;
      "editor.fontFamily" = "'Comic Mono', 'monospace', monospace";
      "editor.rulers" = [80];
      "editor.minimap.enabled" = false;
      "editor.mouseWheelZoom" = true;
      "editor.guides.bracketPairs" = "active";
      "editor.bracketPairColorization.independentColorPoolPerBracketType" = true;
      "security.workspace.trust.enabled" = false;
      "editor.accessibilitySupport" = "off";

      "debug.console.fontSize" = 16;
      "security.workspace.trust.untrustedFiles" = "open";
      "terminal.integrated.fontFamily" = "Hack";
      "window.menuBarVisibility" = "toggle";
      "window.zoomLevel" = 0.75;
      "workbench.sideBar.location" = "right";

      "workbench.colorTheme" = "Gruvbox Dark Medium";

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

      "[nix]" = {
        "editor.defaultFormatter" = "kamadorueda.alejandra";
        "editor.formatOnPaste" = true;
        "editor.formatOnSave" = true;
        "editor.formatOnType" = false;
      };
      "alejandra.program" = "alejandra";

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
  };
}

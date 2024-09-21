{ pkgs, inputs, ... }:
let
  inherit
    (inputs.nix-vscode-extensions.extensions.${pkgs.system}.forVSCodeVersion pkgs.vscode.version)
    vscode-marketplace
    ;
  inherit
    (inputs.nix-vscode-extensions.extensions.${pkgs.system}.forVSCodeVersion pkgs.vscode.version)
    vscode-marketplace-release
    ;
in
{
  programs.vscode.extensions = builtins.attrValues {
    # General Development
    vscode-remote-extensionpack = vscode-marketplace.ms-vscode-remote.vscode-remote-extensionpack;
    vsliveshare = vscode-marketplace.ms-vsliveshare.vsliveshare;
    vscodeintellicode = vscode-marketplace.visualstudioexptteam.vscodeintellicode;

    # Language Specific
    # Bash
    bash-ide-vscode = vscode-marketplace.mads-hartmann.bash-ide-vscode;

    # Javascript/Typescript
    vscode-language-babel = vscode-marketplace.mgmcdermott.vscode-language-babel;
    steoates-autoimport = vscode-marketplace.steoates.autoimport;
    vscode-eslint = vscode-marketplace.dbaeumer.vscode-eslint;
    vscode-typescript-next = vscode-marketplace.ms-vscode.vscode-typescript-next;

    # Nix
    bbenoist-nix = vscode-marketplace.bbenoist.nix;
    nix-ide = vscode-marketplace.jnoortheen.nix-ide;
    alejandra = vscode-marketplace.kamadorueda.alejandra;

    # Python
    python = vscode-marketplace.ms-python.python;
    vscode-pylance = vscode-marketplace.ms-python.vscode-pylance;
    jupyter = vscode-marketplace.ms-toolsai.jupyter;
    direnv = vscode-marketplace.mkhl.direnv;

    # C/C++
    vscode-clangd = vscode-marketplace.llvm-vs-code-extensions.vscode-clangd;

    # LaTeX
    latex-workshop = vscode-marketplace.james-yu.latex-workshop;

    # XML
    vscode-xml = vscode-marketplace.redhat.vscode-xml;

    # JSON
    jsoncrack-vscode = vscode-marketplace.aykutsarac.jsoncrack-vscode;

    # Markup and Documentation
    vscode-markdownlint = vscode-marketplace.davidanson.vscode-markdownlint;
    code-spell-checker = vscode-marketplace.streetsidesoftware.code-spell-checker;

    # UI Enhancement
    vscode-icons = vscode-marketplace.vscode-icons-team.vscode-icons;
    gruvbox = vscode-marketplace.jdinhlife.gruvbox;
    indent-rainbow = vscode-marketplace.oderwat.indent-rainbow;
    errorlens = vscode-marketplace.usernamehw.errorlens;

    # Code Formatting and Diff
    prettier-vscode = vscode-marketplace.esbenp.prettier-vscode;
    partial-diff = vscode-marketplace.ryu1kn.partial-diff;

    # Editor Enhancements
    vim = vscode-marketplace.vscodevim.vim;
  };
}

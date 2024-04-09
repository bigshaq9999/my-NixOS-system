{
  pkgs,
  inputs,
  ...
}: let
  inherit (inputs.nix-vscode-extensions.extensions.${pkgs.system}.forVSCodeVersion pkgs.vscode.version) vscode-marketplace;
  inherit (inputs.nix-vscode-extensions.extensions.${pkgs.system}.forVSCodeVersion pkgs.vscode.version) vscode-marketplace-release;
in {
  programs.vscode.extensions = builtins.attrValues {
    vscode-remote-extensionpack = vscode-marketplace.ms-vscode-remote.vscode-remote-extensionpack;
    vscode-icons = vscode-marketplace.vscode-icons-team.vscode-icons;
    vsliveshare = vscode-marketplace.ms-vsliveshare.vsliveshare;
    vscodeintellicode = vscode-marketplace.visualstudioexptteam.vscodeintellicode;

    bash-ide-vscode = vscode-marketplace.mads-hartmann.bash-ide-vscode;

    bbenoist-nix = vscode-marketplace.bbenoist.nix;
    nix-ide = vscode-marketplace.jnoortheen.nix-ide;
    brettm12345-nixfmt-vscode = vscode-marketplace.brettm12345.nixfmt-vscode;

    python = vscode-marketplace.ms-python.python;
    vscode-pylance = vscode-marketplace.ms-python.vscode-pylance;
    jupyter = vscode-marketplace.ms-toolsai.jupyter;
    vscode-typescript-next = vscode-marketplace.ms-vscode.vscode-typescript-next;

    vscode-language-babel = vscode-marketplace.mgmcdermott.vscode-language-babel;
    steoates-autoimport = vscode-marketplace.steoates.autoimport;
    vscode-eslint = vscode-marketplace.dbaeumer.vscode-eslint;

    davidanson-c = vscode-marketplace.davidanson.c;
    latex-workshop = vscode-marketplace.james-yu.latex-workshop;
    vscode-xml = vscode-marketplace.redhat.vscode-xml;
    jsoncrack-vscode = vscode-marketplace.aykutsarac.jsoncrack-vscode;
    code-spell-checker = vscode-marketplace.streetsidesoftware.code-spell-checker;

    vscode-clangd = vscode-marketplace.llvm-vs-code-extensions.vscode-clangd;

    vim = vscode-marketplace.vscodevim.vim;
    indent-rainbow = vscode-marketplace.oderwat.indent-rainbow;
    prettier-vscode = vscode-marketplace.esbenp.prettier-vscode;
    partial-diff = vscode-marketplace.ryu1kn.partial-diff;
    errorlens = vscode-marketplace.usernamehw.errorlens;
    gruvbox = vscode-marketplace.jdinhlife.gruvbox;

    copilot = vscode-marketplace-release.github.copilot;
    copilot-chat = vscode-marketplace-release.github.copilot-chat;
  };
}

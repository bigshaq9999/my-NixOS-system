{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    plugins = builtins.attrValues {
      ale = {
        plugin = pkgs.vimPlugins.ale;
        config = "let g:ale_completion_enabled = 1";
      };
      deoplete-nvim = {
        plugin = pkgs.vimPlugins.deoplete-nvim;
        config = "let g:deoplete#enable_at_startup = 1";
      };
      inherit (pkgs.vimPlugins)
        lightline-vim
        vim-markdown
        gruvbox
        vim-nix
        vimtex
        auto-pairs
        vim-sensible
        ;
    };
    extraConfig = builtins.readFile ./settings.vim;
  };
}

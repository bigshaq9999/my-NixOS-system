{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;

    vimAlias = true;
    viAlias = true;
    vimdiffAlias = true;

    plugins = builtins.attrValues {
      nvim-treesitter = {
        plugin = pkgs.vimPlugins.nvim-treesitter.withPlugins (_: pkgs.tree-sitter.allGrammars);
      };

      inherit (pkgs.vimPlugins)
        cmp-buffer
        cmp-nvim-lsp
        cmp-path
        cmp-spell
        cmp-treesitter
        cmp-vsnip
        friendly-snippets
        gitsigns-nvim
        indent-blankline-nvim
        lspkind-nvim
        lualine-nvim
        mini-nvim
        none-ls-nvim
        nvim-autopairs
        nvim-cmp
        nvim-colorizer-lua
        nvim-lspconfig
        nvim-tree-lua
        nvim-web-devicons
        plenary-nvim
        telescope-fzy-native-nvim
        telescope-nvim
        vim-sensible
        vim-solarized8
        vim-vsnip
        which-key-nvim
        ;
    };

    extraPackages = with pkgs; [
      gcc
      ripgrep
      fd
    ];

    extraConfig =
      let
        luaRequire = module: builtins.readFile (builtins.toString ./config + "/${module}.lua");
        luaConfig = builtins.concatStringsSep "\n" (
          map luaRequire [
            "filetree"
            "init"
            # "lspconfig"
            "nvim-cmp"
            "theming"
            # "treesitter"
            "utils"
            "which-key"
          ]
        );
      in
      ''
        lua << 
        ${luaConfig}
        
      '';
  };
}

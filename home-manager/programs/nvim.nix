{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      {
        plugin = ale;
        config = "let g:ale_completion_enabled = 1";
      }
      lightline-vim
      vim-markdown
      gruvbox
      vim-nix
      vimtex
      auto-pairs
      vim-sensible
      {
        plugin = deoplete-nvim;
        config = "let g:deoplete#enable_at_startup = 1";
      }
    ];
    extraConfig = ''
      filetype on
      filetype plugin on
      filetype indent on
      syntax on
      set nowrap
      set number
      set mouse=v
      set ignorecase
      set tabstop=4
      set smartindent
      set shiftwidth=4
      set history=1000
      set wildmenu
      set scrolloff=4
      set nobackup
      set noswapfile
      set cursorline
      set cursorlineopt=number
      set clipboard+=unnamed,unnamedplus
      colorscheme gruvbox
      set expandtab
      set smartcase
      set incsearch
      set showcmd
      set showmatch
      set showmode
      set hlsearch
      set nocompatible
      set noshowmode
    '';
  };
}

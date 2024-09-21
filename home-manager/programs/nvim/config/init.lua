vim.cmd([[
colorscheme solarized8
filetype indent on
filetype on
filetype plugin on
syntax on
]])
-- Create an abbreviation for date timestamp
vim.api.nvim_set_keymap('i', 'dts', 'strftime("%F")', { expr = true, noremap = true })

-- Set various options
vim.opt.timeoutlen = 0
vim.opt.cc = "80"
vim.opt.clipboard:append("unnamed,unnamedplus")
vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"
vim.opt.expandtab = true
vim.opt.history = 1000
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.backup = false
vim.opt.compatible = false
vim.opt.showmode = false
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 4
vim.opt.shiftwidth = 4
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.wildmenu = true

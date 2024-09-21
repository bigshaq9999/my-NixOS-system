-- set colorscheme
vim.cmd 'set termguicolors'

vim.cmd [[colorscheme solarized8]]

-- enable colorizer
require'colorizer'.setup()

-- set sign
vim.cmd 'sign define DiagnosticSignError text=  linehl= texthl=DiagnosticSignError numhl='
vim.cmd 'sign define DiagnosticSignHint text=  linehl= texthl=DiagnosticSignHint numhl='
vim.cmd 'sign define DiagnosticSignInfo text=  linehl= texthl=DiagnosticSignInfo numhl='
vim.cmd 'sign define DiagnosticSignWarn text=  linehl= texthl=DiagnosticSignWarn numhl='

-- set lualine theme to solarized
require('lualine').setup{
    options = {
        theme = "solarized_dark",
        disabled_filetypes = {'NvimTree'}
    }
}

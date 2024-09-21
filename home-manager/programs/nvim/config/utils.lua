-- telescope
require('telescope').load_extension('fzy_native')

-- none-ls
local nb = require('null-ls').builtins

require('null-ls').setup {
    sources = {
        nb.formatting.nixfmt,
        nb.completion.spell,
        -- nb.completion.luasnip, -- TODO: Set up luasnip
    },
}

require("gitsigns").setup()

-- autopairs
require('nvim-autopairs').setup()

-- indent-blankline-nvim
require("ibl").setup()

-- copy to system clipboard
vim.api.nvim_set_keymap( 'v', '<Leader>y', '"+y', {noremap = true})
vim.api.nvim_set_keymap( 'n', '<Leader>y', ':%+y<CR>', {noremap = true})

-- paste from system clipboard
vim.api.nvim_set_keymap( 'n', '<Leader>p', '"+p', {noremap = true})

-- toggle file tree
vim.api.nvim_set_keymap( 'n', '<C-n>', '<cmd>NvimTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap( 'n', '<leader>e', '<cmd>NvimTreeFocus<CR>', {noremap = true})

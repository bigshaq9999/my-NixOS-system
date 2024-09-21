vim.g.mapleader = " "

local wk = require("which-key")

wk.setup {
    options = {
        registers = true;
        preset = "modern";
        notify = false;
    }
}

wk.register{
    ["<leader>"] = {
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        ["/"] = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        p = { "\"+p", "Paste from clipboard" },
        P = { "\"+P", "Paste from clipboard before cursor" },
        y = { "\"+y", "Yank to clipboard" },
    },
}

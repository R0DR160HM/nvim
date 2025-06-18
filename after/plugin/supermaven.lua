require("supermaven-nvim").setup({
    keymaps = {
        accept_suggestion = "<C-j>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-w>",
    },
    ignore_filetypes = { "env", "npmrc", "log", "dump" },
    ignore_patterns = { "node_modules", "target", "build", "dist", "vendor" },
})

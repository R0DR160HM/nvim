vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.w)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("i", "<C-j>", "<C-n>")
vim.keymap.set("i", "<C-k>", "<C-p>")

vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "<leader>t", vim.cmd.Term)

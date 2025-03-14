vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_user_command("Term", function()
    -- Look for an existing terminal buffer
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == "terminal" then
            -- Switch to the first terminal buffer found
            vim.api.nvim_set_current_buf(buf)
            return
        end
    end

    -- If no terminal buffer exists, create a new one
    vim.cmd("terminal")
end, {})

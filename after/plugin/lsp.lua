-- Load Mason and LSPConfig
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.gleam.setup{}
require'lspconfig'.angularls.setup{}
require'lspconfig'.ts_ls.setup{}
require'lspconfig'.html.setup{
    capabilities = capabilities
}
require'lspconfig'.emmet_language_server.setup{}

mason.setup()
mason_lspconfig.setup({
    ensure_installed = { "lua_ls", "pyright", "html", "cssls", "angularls", "html", "jdtls", "zls", "emmet_language_server" }, -- Add LSPs here
    automatic_installation = true,
})

-- Define LSP attach function
local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
end

-- Configure each LSP
mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            on_attach = on_attach,
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })
    end
})

local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  }
})


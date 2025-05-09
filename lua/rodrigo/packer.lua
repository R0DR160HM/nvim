vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer plugin manager
	use 'wbthomason/packer.nvim'

	-- Telescope fuzzy finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		requires = {
            {'nvim-lua/plenary.nvim'},
        }
	}

	-- Theming 
	use ({
		"catppuccin/nvim",
		as = "catppuccin",
	})
    use({
        "rose-pine/nvim",
        as = "rose-pine"
    })
    use({
        "Mofiqul/dracula.nvim",
        as = "dracula"
    })

	-- Treesitter
	use (
		'nvim-treesitter/nvim-treesitter',
		{ run = ':TSUpdate' }
	)

	-- Git
	use('tpope/vim-fugitive')
    use('f-person/git-blame.nvim')

    -- Undotree
    use('mbbill/undotree')

	-- LSP
	use {
		{'neovim/nvim-lspconfig'},
		      "williamboman/mason.nvim",           -- LSP Installer
      "williamboman/mason-lspconfig.nvim", -- Bridge between Mason and lspconfig
      "hrsh7th/nvim-cmp",                  -- Completion plugin
      "hrsh7th/cmp-nvim-lsp",              -- LSP source for nvim-cmp
      "nvim-lua/plenary.nvim",             -- Required for some LSPs
	}

    -- Markdown
    use({
        'MeanderingProgrammer/render-markdown.nvim',
        after = { 'nvim-treesitter' },
        requires = {
            { 'echasnovski/mini.nvim', opt = true },
            { 'nvim-tree/nvim-web-devicons', opt = true}
        }, -- if you use the mini.nvim suite
        -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
        -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
        config = function()
            require('render-markdown').setup({})
        end,
    })

    -- Status bar
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
end)

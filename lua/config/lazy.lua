local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- misc plugins
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"lervag/vimtex",
	"ThePrimeagen/harpoon",
	"mbbill/undotree",
	"tpope/vim-fugitive",
	"akinsho/bufferline.nvim",
	"sainnhe/everforest",

	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{"nvim-treesitter/playground"},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		  dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
	  "folke/which-key.nvim",
	  event = "VeryLazy",
	  init = function()
	    vim.o.timeout = true
	    vim.o.timeoutlen = 300
	  end,
	  opts = {
	    -- your configuration comes here
	    -- or leave it empty to use the default settings
	    -- refer to the configuration section below
	  }
	},
	{
		"dstein64/vim-startuptime",
		-- lazy-load on a command
		cmd = "StartupTime",
		-- init is called during startup. Configuration for vim plugins typically should be set in an init function
		init = function()
			vim.g.startuptime_tries = 10
		end,
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'hrsh7th/cmp-buffer'}, -- Optional
			{'hrsh7th/cmp-path'}, -- Optional
			{'hrsh7th/cmp-cmdline'}, -- Optional
			{'hrsh7th/nvim-cmp'}, -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},     -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	},
}

local opts = {}

require("lazy").setup(plugins, opts)

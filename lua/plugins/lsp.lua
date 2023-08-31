-- LSP Support
return {
    {
	'neovim/nvim-lspconfig', -- Required
	event = { "BufReadPre", "BufNewFile" },
	config = function()
	    -- Setup language servers.
	    local lspconfig = require('lspconfig')
	    lspconfig.pyright.setup {}

	    -- Global mappings.
	    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
	    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
	    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
	    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
	    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

	    -- Use LspAttach autocommand to only map the following keys
	    -- after the language server attaches to the current buffer
	    vim.api.nvim_create_autocmd('LspAttach', {
		group = vim.api.nvim_create_augroup('UserLspConfig', {}),
		callback = function(ev)
		    -- Enable completion triggered by <c-x><c-o>
		    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		    -- Buffer local mappings.
		    -- See `:help vim.lsp.*` for documentation on any of the below functions
		    local opts = { buffer = ev.buf }
		    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		    vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		    end, opts)
		    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		    vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		    end, opts)
		end,
	    })
	end
    },  -- formatters
    {
    "jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "mason.nvim" },
	opts = function()
	local nls = require("null-ls")
	return {
	    root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
	    sources = {
		nls.builtins.formatting.fish_indent,
		nls.builtins.diagnostics.fish,
		nls.builtins.formatting.stylua,
		nls.builtins.formatting.shfmt,
		-- nls.builtins.diagnostics.flake8,
	    },
	}
	end,
    },
     -- Optional
    {
	'williamboman/mason.nvim',
	cmd = "Mason",
	keys = { { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" } },
	build = ":MasonUpdate",
	opts = {
	    ensure_intalled = {
		"stylua",
	    }
	},
	config = function()
	    require("mason").setup()
	end
    },           
    {
	'williamboman/mason-lspconfig.nvim',
	dependencies = {
	    'williamboman/mason.nvim',
	    'neovim/nvim-lspconfig',
	},
	config = function()
	    require("mason-lspconfig").setup()
	end
    },
}
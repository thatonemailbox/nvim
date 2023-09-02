return {
    'akinsho/toggleterm.nvim',
    version = "*",
    -- explicitly setup, as per documentation: https://github.com/akinsho/toggleterm.nvim#setup
    config = function()
	require("toggleterm").setup{
	    size = 12,
	    open_mapping = [[<C-\>]],
	    autochdir = true,
	    direction = "horizontal",
	    shade_terminal = true,
	    shading_factor = -100,
	    hide_numbers = true,
	}

	function _G.set_terminal_keymaps()
	  local opts = {buffer = 0}
	  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
	  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
	  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
	  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
	  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
	  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
	end

	-- if you only want these mappings for toggle term use term://*toggleterm#* instead
	vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
    end,
}

return {
    {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function(_, opts)
	    require('bufferline').setup(opts)
	end
    },
    {
	'nvim-lualine/lualine.nvim',
	dependencies = {"nvim-tree/nvim-web-devicons"},
	opts = { theme = "onedark" },
	config = function(_, opts)
	    require('lualine').setup(opts)
	end
    },
}

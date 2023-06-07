local options = {
	clipboard = "unnamedplus",
	belloff = "all",
	mouse = "a",
	updatetime = 300,
	shiftwidth = 4,
	termguicolors = true, -- more color options
	tabstop = 4,
	cursorline = true,
	number = true,
	relativenumber = false,

	-- indentation
	showtabline = 2,
	smartindent = true,
}

for k,v in pairs(options) do
	vim.opt[k] = v
end

-- default terminal is powershell
if vim.fn.has('win32') == 1 then
  vim.o.shell = 'pwsh.exe'
end

vim.cmd([[
	" This will enable code folding.
	" Use the marker method of folding.
	augroup filetype_vim
		autocmd!
		autocmd FileType vim, lua setlocal foldmethod=marker
	augroup END
]])

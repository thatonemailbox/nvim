local options = {
	clipboard = "unnamedplus",
	belloff = "all",
	mouse = "a",
	updatetime = 300,
	shiftwidth = 4,
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

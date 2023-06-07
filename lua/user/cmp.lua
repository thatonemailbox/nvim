local cmp_status_ok, cmp = pcall(require, "cmp") 
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

local check_backspace = function()
	local col = vim.fn.col("." - 1)
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

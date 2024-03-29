OS = vim.loop.os_uname().sysname

require("config")

-- bootstrap lazy.nvim
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

local opts = {
install = {
  colorscheme = { "onedark" }
  },
  ui = {
    size = {width = 0.8, height = 0.725},
    wrap = true,
    border = "shadow"
  }
}

require("lazy").setup("plugins", opts)

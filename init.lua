--setting the leader key
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.wo.relativenumber = true
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.neovide_transparency = 0.9
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0


vim.keymap.set("n", "<leader>e", ":Ex<CR>")

-- Helix-inspired buffer settings
vim.opt.hidden = true  -- Allow switching between modified buffers
vim.opt.switchbuf = "useopen,usetab"  -- Smart buffer switching

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
local opts = {}

require("lazy").setup("plugins")

-- Load theme system
require("config.themes")
-- Load buffer management system
require("config.buffers")
-- Load language-specific configs
require("config.zig")



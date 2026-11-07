-- ==========================================
-- Basic Settings
-- ==========================================

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.mouse = "a"

-- ==========================================
-- Leader Key
-- ==========================================

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- ==========================================
-- Load configuration
-- ==========================================

require("config.options")
require("config.keymaps")

-- ==========================================
-- Bootstrap lazy.nvim
-- ==========================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"

  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
    }, true, {})

    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- ==========================================
-- Plugins
-- ==========================================

require("lazy").setup("plugins")



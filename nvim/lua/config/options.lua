
-- ==========================================
-- General
-- ==========================================

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

-- ==========================================
-- Indentation
-- ==========================================

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

-- ==========================================
-- Search
-- ==========================================

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- ==========================================
-- UI
-- ==========================================

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- ==========================================
-- Editing
-- ==========================================

vim.opt.undofile = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- ==========================================
-- Splits
-- ==========================================

vim.opt.splitright = true
vim.opt.splitbelow = true

-- ==========================================
-- Performance / Behaviour
-- ==========================================

vim.opt.updatetime = 250
vim.opt.timeoutlen = 400
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- ==========================================
-- Register Doxygen filetypes
-- ==========================================
vim.filetype.add({
    pattern = {
        [".*%.c%.doxygen"] = "c",
        [".*%.cpp%.doxygen"] = "cpp",
    },
})

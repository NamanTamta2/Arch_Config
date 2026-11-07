-- =================================
-- Leader key
-- =================================
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- =================================
-- Save file
-- =================================
vim.keymap.set("n", "<leader>w", "<cmd>write<CR>",
    { desc = "Save File" })

-- =================================
-- Quit
-- =================================
vim.keymap.set("n", "<leader>q", "<cmd>quit<CR>",
    { desc = "Quit Neovim" })

-- =================================
-- Save and quit
-- =================================
vim.keymap.set("n", "<leader>wq", "<cmd>wq<CR>",
    { desc = "Save and Quit" })

-- =================================
-- Clear search highlighting
-- =================================
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>",
    { desc = "Clear Search Highlight" })

-- =================================
-- Better window navigation
-- =================================
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- =================================
-- Move selected lines
-- =================================
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- =================================
-- Neo Tree
-- =================================
vim.keymap.set("n", "<C-e>", "<cmd>Neotree toggle<CR>",
    { desc = "Toggle Neo-tree" })


-- =================================
-- LSP Keymaps
-- =================================

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)

        local opts = { buffer = event.buf }

        -- Documentation
        vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover,
            vim.tbl_extend("force", opts, { desc = "Hover Documentation" }))

        -- Navigation
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition,
            vim.tbl_extend("force", opts, { desc = "Go to Definition" }))

        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references,
            vim.tbl_extend("force", opts, { desc = "Find References" }))

        -- Refactoring
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,
            vim.tbl_extend("force", opts, { desc = "Rename Symbol" }))

        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
            vim.tbl_extend("force", opts, { desc = "Code Action" }))

        -- Diagnostics
        vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float,
            vim.tbl_extend("force", opts, { desc = "Show Diagnostics" }))

        -- Formater none-ls
        vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({
                async = true,
                filter = function(client)
                    return client.name == "null-ls"
                end,
            })
        end, vim.tbl_extend("force", opts, {
        desc = "Format Code",
        }))
    end,
})

-- =================================
-- Switch Buffers
-- =================================
vim.keymap.set("n", "<leader>bb",
    "<cmd>Telescope buffers<CR>",
    { desc = "Switch Buffers" })

-- =================================
-- C/C++ Build and Run
-- =================================

vim.keymap.set("n", "<F6>", function()
    local file = vim.fn.expand("%:p")
    local output = vim.fn.expand("%:p:r")

    vim.cmd("write")

    local compiler = vim.bo.filetype == "c" and "gcc" or "g++"

    local command = string.format(
        "%s -std=c++20 -Wall -Wextra -g -O0 %s -o %s",
        compiler,
        vim.fn.shellescape(file),
        vim.fn.shellescape(output)
    )

    vim.cmd("!" .. command)
end, { desc = "Build C/C++ File" })

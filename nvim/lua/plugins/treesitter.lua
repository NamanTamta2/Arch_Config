return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",

        config = function()
            -- Install parsers for the languages you use
            require("nvim-treesitter").install({
                "c",
                "cpp",
                "lua",
                "vim",
                "vimdoc",
                "python",
                "bash",
                "cmake",
                "json",
            })

            -- Enable Treesitter highlighting
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start, 0)
                end,
            })
        end,
    },
}

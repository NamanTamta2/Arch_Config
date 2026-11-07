return {
    -- Catppuccin
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "mocha",
        },
    },

    -- Tokyo Night
    {
        "folke/tokyonight.nvim",
        priority = 1000,
    },

    -- Gruvbox
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
    },

    -- Kanagawa
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
    },

    -- Rose Pine
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
    },

    -- Dracula
    {
        "Mofiqul/dracula.nvim",
        priority = 1000,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        opts = {
            flavour = "mocha",
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}

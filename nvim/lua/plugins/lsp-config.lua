return {
    {
        "neovim/nvim-lspconfig",

        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },

        config = function()

            -- Completion capabilities
            local capabilities =
                require("cmp_nvim_lsp").default_capabilities()

            -- C++ : clangd
            vim.lsp.config("clangd", {
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                },
            })

            vim.lsp.enable("clangd")

            -- Lua : lua_ls
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,

                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },

                        workspace = {
                            checkThirdParty = false,
                        },

                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })
        end,
    },
}

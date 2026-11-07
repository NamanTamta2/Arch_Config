return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
        },

        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Debug UI
            dapui.setup()

            -- Automatically open and close debug UI
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end

            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end

            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            -- CodeLLDB adapter
            dap.adapters.codelldb = {
                type = "executable",
                command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
            }

            -- C++ debugging configuration
            dap.configurations.cpp = {
                {
                    name = "Launch C++",
                    type = "codelldb",
                    request = "launch",

                    program = function()
                        return vim.fn.input(
                            "Executable path: ",
                            vim.fn.getcwd() .. "/",
                            "file"
                        )
                    end,

                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},
                },
            }

            -- C uses the same debugger configuration
            dap.configurations.c = dap.configurations.cpp

            -- Debugging keymaps
            vim.keymap.set("n", "<F5>", dap.continue,
                { desc = "Debug: Continue" })

            vim.keymap.set("n", "<F10>", dap.step_over,
                { desc = "Debug: Step Over" })

            vim.keymap.set("n", "<F11>", dap.step_into,
                { desc = "Debug: Step Into" })

            vim.keymap.set("n", "<F12>", dap.step_out,
                { desc = "Debug: Step Out" })

            vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint,
                { desc = "Debug: Toggle Breakpoint" })

            vim.keymap.set("n", "<leader>du", dapui.toggle,
                { desc = "Debug: Toggle UI" })
        end,
    },
}

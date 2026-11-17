return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")

        -- ========= 断点标志 =========
        vim.fn.sign_define("DapBreakpoint", {
        text = "●",
        texthl = "DapBreakpoint",
        linehl = "",
        numhl = "",
        })
        vim.fn.sign_define("DapBreakpointCondition", {
        text = "◆",
        texthl = "DapBreakpointCondition",
        })
        vim.fn.sign_define("DapStopped", {
        text = "▶",
        texthl = "DapStopped",
        linehl = "DapStoppedLine",
        })

        -- 系统原生 lldb-dap 适配器
        dap.adapters.lldb = {
            type = "executable",
            command = "/usr/bin/lldb-vscode-14", -- 替换为你上面查到的真实路径
            name = "lldb",
        }

        -- C++ 启动配置
        dap.configurations.cpp = {
            {
                name = "Launch (lldb-dap)",
                type = "lldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {},
            },
        }
        dap.configurations.c = dap.configurations.cpp
    end,
}

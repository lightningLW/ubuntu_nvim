return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")

        -- ========= 断点标志 =========
        vim.fn.sign_define("DapBreakpoint", {
        text = "◉",
        texthl = "DapBreakpointRed",
        linehl = "",
        numhl = "",
        })
        vim.fn.sign_define("DapBreakpointCondition", {
        text = "◆",
        texthl = "DapBreakpointOrange",
        })
        vim.fn.sign_define("DapStopped", {
        text = "▶",
        texthl = "DapBreakpointGreen",
        linehl = "DapStoppedLine", -- 整行高亮
        })

    -- 定义高亮颜色（这里可以自由改色号，#rrggbb）
    vim.api.nvim_set_hl(0, "DapBreakpointRed", { fg = "#ee0000" })
    vim.api.nvim_set_hl(0, "DapBreakpointOrange", { fg = "#ff9e64" })
    vim.api.nvim_set_hl(0, "DapBreakpointCyan", { fg = "#7dcfff" })
    vim.api.nvim_set_hl(0, "DapBreakpointGreen", { fg = "#00ff00" })
    vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#28344a" }) -- 暂停行底色


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

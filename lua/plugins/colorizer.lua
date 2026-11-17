return {
    {
        "norcalli/nvim-colorizer.lua",
        event = "BufRead",
        opts = {
            RGB = true,
            RRGGBB = true,
            names = true,
            RRGGBBAA = true,
            AARRGGBB =true,
            rgb_fn = true,          --CSS 的 rgb(255,255,255)
            hsl_fn = true,          --CSS 的 hsl(0, 100%, 50%)
            mode ='background',
            --控制是否在缓冲区失去焦点时（例如，打开自动补全菜单、浮动帮助文档时）也持续更新颜色高亮。
            always_update = false,
            -- 关键在这里：指定需要高亮的文件类型
            -- filetypes = {
                -- '*', -- 为所有文件类型启用（如果性能可接受）
                -- 或者精确指定你需要的类型，例如：
                -- 'css', 'html', 'javascript', 'cpp', 'lua', 'vim'
            -- },
            -- 你可以排除一些不想高亮的大文件类型
            -- exclude = {
                -- 'help', -- 帮助文档
                -- 'dashboard', -- 某些启动仪表面板
                -- '*.cpp', -- 如果你不想为cpp启用，可以在这里排除
            -- }
        },
        config = function(_, opts)
            require("colorizer").setup(opts)
        end,
    }
}


return {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    branch = "master", -- 详见本系列的附录
    event = "VeryLazy",
    opts = {
        -- ensure_installed = { "lua" },
    ensure_installed = {
        "cpp",
        "c",
        "lua",        -- 配置语言
        "vim",        -- vim 脚本
        "vimdoc",     -- vim 文档
        "bash",       -- shell 脚本
        "cmake",      -- CMake 构建系统
        "make",       -- Makefile
        "python",     -- 常用于构建脚本
        "markdown",   -- 文档
        "json",       -- 配置文件
        "yaml",       -- 配置文件
        "comment",    -- 更好的注释处理
    },
    highlight = { enable = true }
    },
}

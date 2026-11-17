-- project.nvim 项目管理插件 完整配置
return {
  -- 插件仓库
  "Zeioth/project.nvim",

  -- 依赖：必须安装 Telescope 才能使用项目搜索功能
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim"
  },

  -- 插件加载事件：打开文件/启动 nvim 时加载
  event = { "VeryLazy" },

  -- 自定义快捷键（推荐，可自行修改）
  keys = {
    -- 打开项目列表（核心快捷键）
    { "<leader>pp", "<cmd>Telescope projects<cr>", desc = "项目列表 Projects List" },
    -- 手动刷新项目根目录
    { "<leader>pr", "<cmd>ProjectRoot<cr>", desc = "刷新项目根目录 Refresh Project Root" },
    -- 手动添加当前目录为项目
    { "<leader>pa", "<cmd>AddProject<cr>", desc = "添加当前目录为项目 Add Project" },
  },

  -- 核心配置（全部带中文注释，按需修改）
  config = function()
    require("project_nvim").setup({
      -- ======================================
      -- 基础功能配置
      -- ======================================
      active = true,            -- 启用插件
      manual_mode = false,      -- 自动切换项目根目录（false=自动，true=手动）
      silent_chdir = true,      -- 切换目录时不显示提示信息
      show_hidden = true,       -- 显示隐藏项目/目录
      ignore_lsp = {},          -- 忽略指定 LSP 项目检测（一般不用改）

      -- ======================================
      -- 项目根目录检测方式（优先级从高到低）
      -- ======================================
      -- lsp：使用 LSP 自动识别项目根
      -- pattern：使用标识文件识别项目根
      detection_methods = { "lsp", "pattern" },

      -- ======================================
      -- 项目根目录标识文件（最关键配置）
      -- 只要目录下有这些文件/文件夹，就判定为项目根
      -- ======================================
      patterns = {
        ".git",               -- Git 仓库（最常用）
        "_darcs", ".hg", ".bzr", ".svn",  -- 其他版本控制
        "Makefile",           -- Make 项目
        "package.json",       -- Node /前端项目
        "Cargo.toml",         -- Rust 项目
        "go.mod",             -- Go 项目
        "pom.xml",            -- Java Maven 项目
        "build.gradle",       -- Java Gradle 项目
        "requirements.txt",   -- Python 项目
        "CMakeLists.txt",     -- C/C++ CMake 项目
        ".nvim.lua",          -- Neovim 项目配置文件
      },

      -- ======================================
      -- 排除不需要识别的目录（避免误判项目）
      -- 填写绝对路径，支持通配符 *
      -- ======================================
      exclude_dirs = {
        "~/.cache/*",
        "~/.cargo/*",
        "~/.npm/*",
        "~/.local/share/nvim/*",
        "/tmp/*",
        "/proc/*",
      },

      -- ======================================
      -- 项目历史数据存储路径（默认即可）
      -- ======================================
      datapath = vim.fn.stdpath("data"), -- 项目历史文件：~/.local/share/nvim/project_nvim
    })

    -- ======================================
    -- 必须加载 Telescope 扩展
    -- 否则无法使用项目搜索功能
    -- ======================================
    local telescope = require("telescope")
    telescope.load_extension("projects")

    -- ======================================
    -- 可选：自动打开最近打开的项目（启动 Neovim 时）
    -- ======================================
    -- vim.cmd("autocmd VimEnter * ++nested Telescope projects theme=dropdown layout_config={width=0.6,height=0.5}")
  end,
}

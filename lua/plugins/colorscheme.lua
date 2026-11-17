-- == tokyonight 主题设置
return {
  "folke/tokyonight.nvim",
  lazy = false,       -- 禁止懒加载，启动第一时间加载主题
  priority = 1000,    -- 优先级拉满，比所有其他插件先加载
  config = function()
    -- 手动执行 setup，确保所有配置 100% 生效
    require("tokyonight").setup({
      style = "moon",
      transparent = false,                  -- 关闭tokyonight自带透明！ Neovide不支持NONE
      terminal_colors = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
        comments = { italic = true },  -- 注释关闭斜体
        keywords = { italic = true },
        functions = { italic = false },
        types = { italic = true },
        variables = { italic = false },
      },
    })
    -- 强制设置为启动默认主题
    vim.cmd.colorscheme("tokyonight")
  end,
}
-- !== tokyonight 主题设置

-- == nightfox主题设置
-- return {
--   "EdenEast/nightfox.nvim",
--   priority = 1000, -- 主题必须最高优先级
--   lazy = false,
--
--   config = function()
--     require("nightfox").setup({
--       options = {
--         transparent = false,    -- 透明背景，Neovide 可用
--         terminal_colors = true, -- 内置终端配色
--         dim_inactive = true,   -- 非活动窗口变暗
--
--         -- 全局语法样式（所有变体生效）
--         styles = {
--           comments = "italic",    -- 注释："italic" 开斜体 / "NONE" 关斜体
--           keywords = "italic",
--           functions = "NONE",
--           types = "italic",
--           constants = "NONE",
--           variables = "NONE",
--         },
--       },
--
--       -- 自定义高亮组（所有变体生效）
--       groups = {
--         all = {
--           -- ✅ 正确写法：样式放在 style 字段里
--           Comment = { fg = "#71839b", style = "italic" },
--           ["@comment"] = { fg = "#71839b", style = "italic" },
--
--           -- LSP 内联提示颜色
--           ["@lsp.type.hint"] = { fg = "#506480" },
--           ["@lsp.mod.parameter"] = { fg = "#506480" },
--
--           -- 浮动窗口透明
--           NormalFloat = { bg = "NONE" },
--           FloatBorder = { bg = "NONE", fg = "#545e78" },
--
--           -- 选中区域
--           Visual = { bg = "#2a3b54" },
--         },
--       },
--     })
--
--     -- 选择主题变体：carbonfox / nightfox / duskfox / nordfox / terafox / carbonfox
--     vim.cmd("colorscheme terafox")
--   end,
-- }
-- !== nightfox主题设置

-- == catppuccin主题设置
-- return {
--   "catppuccin/nvim",
--   name = "catppuccin", --必须写name
--   priority = 1000,
--   lazy = false,
--
--   config = function()
--     require("catppuccin").setup({
--       flavour = "frappe", -- 选最深的mocha；可选 mocha/macchiato/frappe/latte
--       transparent_background = false, -- 全局主窗口透明，Neovide看到桌面改为true
--       term_colors = true, -- nvim内置终端继承主题颜色
--
--       float = {
--         transparent = true, -- ✔浮动弹窗自动透明，不需要手动写NormalFloat
--         solid = false,
--       },
--
--       dim_inactive = {
--         enabled = false, -- 不把非激活窗口变暗
--       },
--
--       -- 全局强制关闭斜体、粗体
--       no_italic = true,  -- 全部不斜体（注释、关键字）
--       no_bold = false,
--       no_underline = false,
--
--       styles = {
--         -- no_italic=true会覆盖这里，这里可以留空
--         comments = {},
--         keywords = {},
--         functions = {},
--         types = {},
--       },
--
--       -- 自定义高亮覆盖
--       custom_highlights = function(colors)
--         return {
--           -- LSP内联提示
--           LspInlayHint = { fg = colors.surface2 },
--
--           -- V模式选中选区
--           Visual = { bg = colors.surface1 },
--         }
--       end,
--
--       -- 插件集成，开启常用插件适配
--       integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         telescope = true,
--         treesitter = true,
--         lsp_saga = true,
--       },
--     })
--
--     vim.cmd("colorscheme catppuccin")
--   end,
-- }
-- !== catppuccin主题设置

-- == gruvbox主题设置
-- return {
--   "morhetz/gruvbox",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("gruvbox")
--     --设置对比度 hard medium soft
--     vim.g.gruvbox_contrast_dark = 'hard'
--     --启动斜体
--     -- vim.g.gruvbox_italic = 1
--     --下划线
--     -- vim.g.gruvbox_underline = 1
--     -- vim.g.gruvbox_transparent_mode = 1
--     -- vim.g.gruvbox_undercurl = 1
--   end
-- }
-- !== gruvbox主题设置

-- == rose-pine主题设置
-- return {
--   "rose-pine/neovim",
--   name = "rose-pine", -- 必须写name
--   priority = 1000,
--   lazy = false,
--
--   config = function()
--     require("rose-pine").setup({
--       variant = "auto",
--       dark_variant = "moon", -- ✔深色默认用moon（更深）main dawn
--       dim_inactive_windows = false,   -- 非激活窗口不变暗
--       extend_background_behind_borders = true,
--
--       enable = {
--         terminal = true,              -- nvim内置终端继承主题
--         legacy_highlights = true,
--       },
--
--       styles = {
--         bold = false,
--         italic = false,               -- ✔全局关闭斜体（注释、关键字全部不斜体）
--         transparency = false,         -- 全局透明开关，Neovide看到桌面就改为true
--       },
--
--       -- 自定义高亮组
--       highlight_groups = {
--         -- 注释
--         Comment = { fg = "muted", italic = false },
--         ["@comment"] = { fg = "muted", italic = false },
--
--         -- LSP内联提示
--         LspInlayHint = { fg = "#6e7894", italic = false },
--
--         -- 浮动弹窗透明
--         NormalFloat = { bg = "NONE" },
--         FloatBorder = { bg = "NONE", fg = "highlight_med" },
--
--         -- V模式选中选区
--         Visual = { bg = "surface" },
--       },
--     })
--
--     vim.cmd("colorscheme rose-pine")
--   end,
-- }
-- !== rose-pine主题设置

-- LazyVim 适配 | ibl v3 + 彩虹括号 同色匹配线 无报错版
return {
  {
    "lukas-reineke/indent-blankline.nvim",
    -- 核心修复：强制依赖彩虹括号，保证先加载颜色组
    dependencies = { "HiPhish/rainbow-delimiters.nvim" },
    main = "ibl",
    opts = function()
      local hooks = require("ibl.hooks")
      -- 彩虹括号颜色（和你的插件完全对应）
      local rainbow = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      }

      -- 注册钩子：延迟加载高亮，避免找不到颜色组
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

      return {
        -- 缩进线配置
        indent = {
          char = "│",
          highlight = rainbow,
        },
        -- 花括号匹配线（核心功能）
        scope = {
          enabled = true,
          char = "│",
          show_start = true,
          show_end = true,
          highlight = rainbow,
        },
        -- 去除空白行干扰
        exclude = {
          filetypes = {
            "lazy", "dashboard", "help",
            "mason", "notify", "terminal"
          },
        },
      }
    end,
  },
}

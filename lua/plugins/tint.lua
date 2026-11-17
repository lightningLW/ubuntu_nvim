return {
  "levouh/tint.nvim",
  event = { "WinNew", "BufWinEnter" },
  opts = {
    tint = -40,       -- 变暗幅度，负数越深，推荐 -20 ~ -40
    saturation = 0.3, -- 饱和度，0=完全灰度，1=保持原饱和度
    -- 排除不需要变暗的窗口类型
    ignore = {
      filetypes = {
        "neo-tree",
        "grug-far",
        "snacks_terminal",
        "TelescopePrompt",
        "help",
      },
      buftypes = { "terminal", "prompt", "nofile" },
    },
  },
}

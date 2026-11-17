return {
  "MagicDuck/grug-far.nvim",
  opts = {
    headerMaxWidth = 80,
    -- keymaps = {
    --   replace = { n = "R" },
    --   syncLocations = { n = "S" },
    --   qflist = { n = "Q" },
    --   close = { n = "<ESC>" },
    -- },
  },
  cmd = { "GrugFar", "GrugFarWithin" },
  keys = {
    -- <leader>sr 完整查找替换
    {
      "<leader>sf",
      function()
        local grug = require("grug-far")
        grug.open({
          transient = true,
          prefills = {},
        })
      end,
      mode = { "n", "x" },
      desc = "GrugFar Search",
    },

    -- ✅ 合并后的 <leader>sf：智能纯搜索
    -- 普通模式：自动带入光标下单词；可视模式：自动带入选中文本
    {
      "<leader>sr",
      function()
        local grug = require("grug-far")
        local mode = vim.fn.mode()
        local open_opts = {
          transient = true,
          -- static = { showReplace = false },
          prefills = {},
        }

        if mode == "n" then
          -- 普通模式：取光标下单词
          local word = vim.fn.expand("<cword>")
          if word ~= "" then
            open_opts.prefills.search = word
          end
        else
          -- 可视模式：自动带入选中内容
          open_opts.visualSelection = true
        end

        grug.open(open_opts)
      end,
      mode = { "n", "x" },
      desc = "GrugFar Search (cursor word / selection)",
    },
  },
}

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      mode = "buffers",
      -- ✅官方numbers函数：每个标签前面输出内容
      numbers = function(opts)
        -- opts.ordinal 标签序号，opts.id 就是bufnr
        local current_buf = vim.api.nvim_get_current_buf()
        if opts.id == current_buf then
          -- return " "  -- 当前激活buffer的前缀符号，可以改成★ 👉 ◆ ▶
          return "▶"  -- 当前激活buffer的前缀符号，可以改成★ 👉 ◆ ▶
        else
          return ""
        end
      end,
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
    highlights = {
      buffer_selected = { bold = true, italic = false },
    },
  },
}

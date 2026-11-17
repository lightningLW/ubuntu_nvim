return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    -- 确保 buffers 配置存在
    opts.buffers = opts.buffers or {}

    -- 设置 buffers 源的特定配置
    opts.buffers.window = opts.buffers.window or {}
    opts.buffers.window.mappings = opts.buffers.window.mappings or {}

    -- 确保 d 键映射到 buffer_delete
    opts.buffers.window.mappings["d"] = "buffer_delete"
  end,
  keys = {
    {
      "<leader>bb",
      "<cmd>Neotree toggle buffers right<cr>",
      desc = "Toggle Buffers Sidebar",
    },
  },
}

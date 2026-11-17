-- 会话保存：记录每个项目的打开文件、布局、光标位置
return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {
    -- 按项目保存会话（完美匹配 project.nvim）
    dir = vim.fn.expand(vim.fn.stdpath("state") .. "/persistence/"),
    -- 忽略的文件类型
    options = { "buffers", "curdir", "tabpages", "winsize" },
    pre_save = nil,
  },
  keys = {
    -- 🔥 恢复当前项目「上次退出时的所有打开文件」(核心功能)
    { "<leader>ps", function() require("persistence").load() end, desc = "恢复项目会话(打开文件)" },
    -- 恢复最后一次的会话(跨项目)
    { "<leader>pl", function() require("persistence").load({ last = true }) end, desc = "恢复最后一次会话" },
    -- 手动保存当前会话(退出时自动保存,一般不用)
    { "<leader>pd", function() require("persistence").stop() end, desc = "不保存当前会话" },
  },
}

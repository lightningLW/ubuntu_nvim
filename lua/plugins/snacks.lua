return {
  "folke/snacks.nvim",
  opts = {
    terminal = {},
  },
  keys = {
    {
      "<C-/>",
      mode = {"n", "t"},
      function()
        Snacks.terminal.toggle(nil, {
          win = {
            position = "bottom",
            height = 0.25,
            width = 1,
          },
        })
      end,
      desc = "Toggle Terminal",
    },
  },
}

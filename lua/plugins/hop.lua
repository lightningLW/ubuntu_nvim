--光标跳转到单词
return {
    "smoka7/hop.nvim",
    opts = {
        -- hint_position = 3,
    },
    cmd = { "HopWord" },
    keys = {
        { "<leader>hp", "<Cmd>HopWord<CR>", desc = "hop word", silent = true },
    },
}


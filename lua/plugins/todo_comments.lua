return {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = "LazyFile",
  opts = {
	    -- 符号设置
    signs = true, -- 在标记列显示图标
    sign_priority = 8, -- 符号优先级
    -- 自定义标签关键词
    keywords = {
      FIX = {
        icon = " ", -- 图标用于标记和搜索结果
        -- icon =  "  ",
        color = "#DC2626", -- 可以是十六进制颜色或命名颜色
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "REPAIR" }, -- 映射到此FIX关键词的其他关键词
        -- signs = false, -- 可以单独为某些关键词配置是否显示标记
      },
      TODO = {
        icon = " ",
        color = "#b9ff98",
        alt = { "TASK" }
      },
      HACK = {
        icon = " ",
        color = "#fbbf24",
        alt = { "WORKAROUND" }
      },
      WARN = {
        icon = " ",
        color = "#fbbf24",
        alt = { "WARNING", "XXX", "CAUTION", "ATTENTION" }
      },
      PERF = {
        icon = " ",
        color = "#ff00ff",
        alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "OPTIMIZATION" }
      },
      NOTE = {
        icon = " ",
        color = "#2563eb",
        alt = { "INFO", "NOTICE", "COMMENT" }
      },
      TEST = {
        icon = "⏲ ",
        color = "#fdd09d",
        alt = { "TESTING", "PASSED", "FAILED", "UNITTEST" }
      },
      -- 新增自定义标签
      QUESTION = {
        icon = " ",
        color = "#ff00ff",
        alt = { "QUESTION", "QUEST", "Q?", "HELP" }
      },
      DEBUG = {
        icon = " ",
        color = "#fdd09d",
        -- alt = { "TEST", "PASSED", "FAILED", "UNITTEST" }
      },

      REVIEW = {
        --icon = " ",  -- 大眼睛
        icon = " ",   -- 小眼睛
        color = "#2563eb",
        alt = { "REVIEW", "REVIEWME", "CHECK", "VERIFY" }
      },
      -- DEPRECATED = {
      --   icon = "󰀪 ",
      --   color = "error",
      --   alt = { "DEPRECATED", "LEGACY", "OBSOLETE", "OUTDATED" }
      -- },
      IDEA = {
        icon = "󰛩 ",
        color = "#00ff00",
        alt = { "IDEA", "THOUGHT", "CONCEPT", "SUGGESTION" }
      },
       --新增的 __LW__ 标签
      __LW__ = {
        icon = " ", -- 这里使用了"加号"图标，你可以替换为上面推荐的其他图标代码
        --icon = " ",
        -- icon = " ",
        color = "#a8a8a8", -- 建议颜色，可改为 "hint", "warning", "default" 或自定义颜色
        -- alt = { "NEWCONTENT", "ADDITION" } -- 可选的别名
      },
      MARK = {
        icon =" ",
        color = "test",
      },
    },
    -- 合并关键词设置
    merge_keywords = true, -- 为true时，自定义关键词将与默认值合并
    -- GUI样式
    -- gui_style = {
    --   fg = "NONE", -- 用于前景色高亮组的GUI样式
    --   bg = "BOLD", -- 用于背景色高亮组的GUI样式
    -- },
    -- 高亮设置
    -- highlight = {
    --   multiline = true, -- 启用多行todo注释
    --   multiline_pattern = "^.", -- 用于从匹配关键词开始匹配下一多行的lua模式
    --   multiline_context = 10, -- 更改行时将重新评估的额外行数
    --   before = "", -- "fg" 或 "bg" 或空
    --   keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" 或空
    --   after = "fg", -- "fg" 或 "bg" 或空
    --   pattern = [[.*<(KEYWORDS)\s*:?]], -- 用于高亮的模式或模式表 (vim正则)
    --   comments_only = true, -- 使用treesitter仅匹配注释中的关键词
    --   max_line_len = 400, -- 忽略长于此值的行
    --   exclude = {}, -- 要排除高亮的文件类型列表
    -- },
    -- 颜色定义
    colors = {
      error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
      warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
      info = { "DiagnosticInfo", "#2563EB" },
      hint = { "DiagnosticHint", "#10B981" },
      default = { "Identifier", "#7C3AED" },
      test = { "Identifier", "#FF00FF" }
    },
    -- 搜索设置
    -- search = {
    --   command = "rg",
    --   args = {
    --     "--color=never",
    --     "--no-heading",
    --     "--with-filename",
    --     "--line-number",
    --     "--column",
    --   },
    --   -- 用于匹配关键词的正则表达式
    --   pattern = [[\b(KEYWORDS):]], -- ripgrep正则
    -- }
  },
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
	-- 结合插件trouble
    { "<leader>tt", "<cmd>Trouble todo toggle<cr>", desc = "Todo...(Trouble)" },
	{ "<leader>tT", "<cmd>Trouble todo toggle filter = {tag = {TODO}}<cr>", desc = "Todo(Trouble)" },
    { "<leader>tF", "<cmd>Trouble todo toggle filter = {tag = {BUG, FIX, FIXME}}<cr>", desc = "Bug/Fix/Fixme(Trouble)" },
    { "<leader>tN", "<cmd>Trouble todo toggle filter = {tag = {NOTE}}<cr>", desc = "Note (Trouble)" },
	{ "<leader>tR", "<cmd>Trouble todo toggle filter = {tag = {REVIEW}}<cr>", desc = "REVIEW (Trouble)" },
	{ "<leader>tD", "<cmd>Trouble todo toggle filter = {tag = {DEBUG,TEST}}<cr>", desc = "Debug/Test(Trouble)" },
	{ "<leader>tH", "<cmd>Trouble todo toggle filter = {tag = {HACK}}<cr>", desc = "Hack(Trouble)" },
	{ "<leader>tW", "<cmd>Trouble todo toggle filter = {tag = {WARN}}<cr>", desc = "Warn/Xxx(Trouble)" },
	{ "<leader>tP", "<cmd>Trouble todo toggle filter = {tag = {PERF}}<cr>", desc = "perf(Trouble)" },
	{ "<leader>tQ", "<cmd>Trouble todo toggle filter = {tag = {QUESTION}}<cr>", desc = "Question(Trouble)" },
	{ "<leader>tM", "<cmd>Trouble todo toggle filter = {tag = {MARK}}<cr>", desc = "mark(Trouble)" },
	{ "<leader>tI", "<cmd>Trouble todo toggle filter = {tag = {IDEA}}<cr>", desc = "Idea(Trouble)" },
	{ "<leader>tL", "<cmd>Trouble todo toggle filter = {tag = {__LW__}}<cr>", desc = "__LW__(Trouble)" },
	-- 以窗口的形式显示
	{ "<leader>Tt", "<cmd>TodoTelescope keywords=TODO,BUG,FIX,FIXME,NOTE,REVIEW,DEBUG,TEST,HACK,WARN,XXX,PERF,OPTIMIZE,QUESTION,IDEA,__LW__<cr>", desc = "Todo..." },
    { "<leader>TT", "<cmd>TodoTelescope keywords=TODO<cr>", desc = "Todo" },
	{ "<leader>TF", "<cmd>TodoTelescope keywords=BUG,FIX,FIXME<cr>", desc = "Bug/Fix/Fixme" },
	{ "<leader>TN", "<cmd>TodoTelescope keywords=NOTE<cr>", desc = "Note" },
	{ "<leader>TR", "<cmd>TodoTelescope keywords=REVIEW<cr>", desc = "Review" },
	{ "<leader>TD", "<cmd>TodoTelescope keywords=DEBUG,TEST<cr>", desc = "debug/test" },
	{ "<leader>TH", "<cmd>TodoTelescope keywords=HACK<cr>", desc = "hack" },
	{ "<leader>TW", "<cmd>TodoTelescope keywords=WARN,XXX<cr>", desc = "warn/xxx" },
	{ "<leader>TP", "<cmd>TodoTelescope keywords=PERF,OPTIMIZE<cr>", desc = "perf/optimize" },
	{ "<leader>TQ", "<cmd>TodoTelescope keywords=QUESTION<cr>", desc = "question" },
	{ "<leader>TM", "<cmd>TodoTelescope keywords=MARK<cr>", desc = "mark" },
	{ "<leader>TI", "<cmd>TodoTelescope keywords=IDEA<cr>", desc = "idea" },
	{ "<leader>TL", "<cmd>TodoTelescope keywords=__LW__<cr>", desc = "__LW__" },
  },
}



-- "󰃃 "
-- " "
-- " "
-- "󱦟 "
-- " "
-- " "
-- " "

-- " "
-- " "
-- " "
-- " "
-- " "
-- " "
-- " "

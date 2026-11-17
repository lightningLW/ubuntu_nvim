return
{
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    -- PERF: we don't need this lualine require madness 🤷
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local icons = LazyVim.config.icons

    vim.o.laststatus = vim.g.lualine_laststatus

    local opts = {
      options = {
        theme = "auto",
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },

        lualine_c = {
          LazyVim.lualine.root_dir(),
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { LazyVim.lualine.pretty_path() },
        },
        lualine_x = {
          Snacks.profiler.status(),
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = function() return { fg = Snacks.util.color("Statement") } end,
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = function() return { fg = Snacks.util.color("Constant") } end,
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = function() return { fg = Snacks.util.color("Debug") } end,
          },
          -- stylua: ignore  待更新的插件数量
          -- {
          --   require("lazy.status").updates,
          --   cond = require("lazy.status").has_updates,
          --   color = function() return { fg = Snacks.util.color("Special") } end,
          -- },
          -- 显示文件的编码格式
          {
            function()
              local encoding = vim.bo.fileencoding
              local format = vim.bo.fileformat
              if encoding == "" then
                encoding = vim.o.encoding
              end
              return string.format("%s[%s]", encoding:upper(), format)
            end,
              color = function() return { fg = Snacks.util.color("Special") } end,
          },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },
        -- lualine_y = {
        --   { "progress", separator = " ", padding = { left = 1, right = 0 } },
        --   { "location", padding = { left = 0, right = 1 } },
        -- },
        -- 显示总行数
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          {
            function()
              local total_lines = vim.api.nvim_buf_line_count(0)
              local current_line = vim.api.nvim_win_get_cursor(0)[1]
              local current_col = vim.api.nvim_win_get_cursor(0)[2] + 1
              return string.format("[%d/%d]:%d", current_line, total_lines,current_col )
            end,
            padding = { left = 0, right = 1 }
          },
        },
        lualine_z = {
          function()
            -- local im_select_path = "C:/Users/Pi_Nn/AppData/Local/nvim/tools/im-select.exe"
            -- -- -使用 io.popen 执行命令并获取输出
            -- local handle = io.popen( im_select_path )
            -- if handle then
            --     local result = handle:read( "*a" )
            --     handle:close()
            -- -- 清理输出结果（去除换行符等）
            --     if result then
            --         result = result:gsub("%s+", "")
            --         -- 将输入法标识符转换为易读格式
            --         -- 您可以根据自己系统的实际返回值进行修改和扩充
            --         local im_map = {
            --             ["1033"] = "En", -- 英语（美国）
            --             ["2052"] = "中", -- 中文（简体，中国）
            --             -- 您可以在此添加更多的输入法标识符映射
            --             -- ["其他标识符"] = "显示名称",
            --         }
            --         -- 返回映射后的名称，如果未知则返回原标识符
            --         -- return im_map[result] or result
            --         return "[" .. im_map[result] .. "]" .. "|" .. " " .. os.date("%R")
            --     end
            -- end
            --如果获取失败,显示为问号
            -- return "[?] | " .. " " .. os.date( "%R" )
            return " " .. os.date("%R")
          end,
        },
      },
      extensions = { "neo-tree", "lazy", "fzf" },
    }

    -- do not add trouble symbols if aerial is enabled
    -- And allow it to be overriden for some buffer types (see autocmds)
    if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        hl_group = "lualine_c_normal",
      })
      table.insert(opts.sections.lualine_c, {
        symbols and symbols.get,
        cond = function()
          return vim.b.trouble_lualine ~= false and symbols.has()
        end,
      })
    end

    return opts
  end,
}

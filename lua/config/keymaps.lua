-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- insert模式 --> normal模式
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "kk", "<Esc>", { noremap = true, silent = true })

-- insert模式下 光标直接到行尾/行首, 向左/向右，并保持insert
-- vim.keymap.set("i", "jl", "<C-o>$", { noremap = true, silent = true })
-- vim.keymap.set("i", "jh", "<C-o>^", { noremap = true, silent = true })
-- vim.keymap.set("i", "hh", "<Left>", { noremap = true, silent = true })
-- vim.keymap.set("i", "ll", "<Right>", { noremap = true, silent = true })
-- vim.keymap.set("i", "jj", "<Down>", { noremap = true, silent = true })
-- vim.keymap.set("i", "kk", "<Up>", { noremap = true, silent = true })

-- insert 光标单个字符上下左右
-- vim.keymap.set("i", "<C-k>", "<Up>", { noremap = true, silent = true })
-- vim.keymap.set("i", "<C-j>", "<Down>", { noremap = true, silent = true })
vim.keymap.set("i", "<A-k>", "<Up>", { noremap = true, silent = true })
vim.keymap.set("i", "<A-j>", "<Down>", { noremap = true, silent = true })
vim.keymap.set("i", "<A-h>", "<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "<A-l>", "<Right>", { noremap = true, silent = true })
-- insert模式下， 按单词左右移动光标
vim.keymap.set("i", "<A-b>", "<S-Left>", { noremap = true, silent = true })
-- vim.keymap.set("i", "jb", "<S-Left>", { noremap = true, silent = true })
vim.keymap.set("i", "<A-w>", "<S-Right>", { noremap = true, silent = true })
-- vim.keymap.set("i", "jw", "<S-Right>", { noremap = true, silent = true })
-- insert模式下， 行首/尾
vim.keymap.set("i", "<A-a>", "<Home>", { noremap = true, silent = true })
-- vim.keymap.set("i", "jh", "<Home>", { noremap = true, silent = true })
vim.keymap.set("i", "<A-e>", "<End>", { noremap = true, silent = true })
-- vim.keymap.set("i", "jl", "<End>", { noremap = true, silent = true })

--vim.keymap.set("i", "kk", "<Up>", { noremap = true, silent = true })
--撤销he恢复撤销
vim.keymap.set({ "n", "i" }, "<C-z>", "<Cmd>undo<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i" }, "<C-r>", "<Cmd>redo<CR>", { noremap = true, silent = true })


--vim.keymap.set("i", "hh", "<Left>", { noremap = true, silent = true })
--vim.keymap.set("i", "jj", "<Down>", { noremap = true, silent = true })
--vim.keymap.set("i", "ll", "<Right>", { noremap = true, silent = true })

--HopWord插件
-- vim.keymap.set({"n", "i"}, "<A-s>", "<Cmd>HopWord<CR>", { noremap = true, silent = true });
vim.keymap.set({"n", "i"}, "<A-g>", "<Cmd>HopWord<CR>", { noremap = true, silent = true });

-- 移动行功能 - 使用 Leader 键（默认是空格键）
-- 普通模式：移动当前行
-- vim.keymap.set("n", "<leader>j", ":move .+1<CR>==", { noremap = true, silent = true, desc = "Move line down" })
-- vim.keymap.set("n", "<leader>k", ":move .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })
-- 可视模式：移动选中的行
-- vim.keymap.set("v", "<leader>j", ":move '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection down" })
-- vim.keymap.set("v", "<leader>k", ":move '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection up" })
-- !@移动行功能 - 使用 Leader 键（默认是空格键）

--GrupFar插件
-- vim.keymap.set( { "n", "i" }, "<C-f>", "<Cmd>GrugFar<CR>",  { noremap = true, silent = true } )
-- local function is_grug_far_open()
--     for _, win in ipairs(vim.api.nvim_list_wins()) do
--         local buf = vim.api.nvim_win_get_buf(win)
--         -- 通过文件类型检测Grug Far缓冲区
--         if vim.api.nvim_buf_get_option(buf, 'filetype') == 'grug-far' then
--             return true
--         end
--     end
--     return false
-- end
--
-- local function close_grug_far()
--     for _, win in ipairs(vim.api.nvim_list_wins()) do
--         local buf = vim.api.nvim_win_get_buf(win)
--         if vim.api.nvim_buf_get_option(buf, 'filetype') == 'grug-far' then
--             vim.api.nvim_win_close(win, true)
--         end
--     end
-- end
--
-- -- 设置全局切换快捷键
-- vim.keymap.set({ 'n', 'i' }, '<C-f>', function()
--     if is_grug_far_open() then
--         close_grug_far()
--     else
--         vim.cmd('GrugFar')
--     end
-- end, { noremap = true, silent = true, desc = 'Toggle Grug Far' })

--=========================================GrupFar插件   20260903=========================================

-- 检测 GrugFar 是否已打开
local function is_grug_far_open()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.api.nvim_buf_get_option(buf, 'filetype') == 'grug-far' then
            return true
        end
    end
    return false
end
-- !@检测 GrugFar 是否已打开

-- 关闭所有 GrugFar 窗口
local function close_grug_far()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.api.nvim_buf_get_option(buf, 'filetype') == 'grug-far' then
            vim.api.nvim_win_close(win, true)
        end
    end
    -- ✅ 关闭后强制回到 Normal 普通模式
    -- 无论之前是插入模式还是可视模式，都切回普通模式
    vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
        "n",
        false
    )
end
-- !@关闭所有 GrugFar 窗口

-- 打开：光标下单词搜索
local function open_grug_far_like_sf()
    local grug = require("grug-far")
    local mode = vim.fn.mode()
    local open_opts = {
        transient = true,
        static = { showReplace = false }, -- 纯搜索，隐藏替换栏
        -- 忽略大小写和不使用正则查找
        prefills = {
          flags = "--fixed-strings --ignore-case",
        },
    }

    if mode == "n" or mode == "i" then
        -- 普通/插入模式：取光标下单词
        local word = vim.fn.expand("<cword>")
        if word ~= "" then
            open_opts.prefills.search = word
        end
    elseif mode == "v" or mode == "V" then
        -- 可视模式：带入选中文本
        open_opts.visualSelection = true
    end

    grug.open(open_opts)
end
-- !@打开：光标下单词搜索

-- 全局切换快捷键 Ctrl+Shift+f  光标下单词搜索
vim.keymap.set({ 'n', 'i', 'v' }, '<C-S-f>', function()
    if is_grug_far_open() then
        close_grug_far()
    else
        open_grug_far_like_sf()
    end
end, { noremap = true, silent = true, desc = 'Toggle GrugFar (Search for the world under the cursor)' })
-- !@全局切换快捷键 Ctrl+Shift+f  光标下单词搜索

-- 全局切换快捷键 Ctrl+f
vim.keymap.set({ 'n', 'i', 'v' }, '<C-f>', function()
    if is_grug_far_open() then
        close_grug_far()
    else
        -- 忽略大小写和不使用正则查找
        -- vim.cmd('GrugFar')
        local grug = require("grug-far")
        grug.open({
            prefills = {
                flags = "--fixed-strings --ignore-case"
            }
        })
    end
end, { noremap = true, silent = true, desc = 'Toggle GrugFar (Search only)' })
-- !@全局切换快捷键 Ctrl+f
--=========================================!GrupFar插件   20260903=========================================

-- =========================================只删除,不复制=========================================
-- 1. dd → 只删不复制（黑洞寄存器）
vim.keymap.set("n", "dd", '"_dd', { noremap = true, silent = true, desc = "Delete line (no yank)" })
-- 2. xx → 整行剪切（原dd功能，存入默认寄存器）
vim.keymap.set("n", "xx", "dd", { noremap = true, silent = true, desc = "Cut line (yank)" })

-- 可选：同步 d 系列（dw/d$/dG等）也只删不复制，保持一致
-- vim.keymap.set("n", "d", '"_d', { noremap = true, silent = true, desc = "Delete (no yank)" })
vim.keymap.set({ "n", "x" }, "d", '"_d', { noremap = true, silent = true })
-- vim.keymap.set("v", "d", '"_d', { noremap = true, silent = true, desc = "Delete selection (no yank)" })
vim.keymap.set("n", "D", '"_D', { noremap = true, silent = true })

vim.keymap.set({ "n", "x" }, "c", '"_c', { noremap = true, silent = true })
vim.keymap.set("n", "cc", '"_cc', { noremap = true, silent = true })
vim.keymap.set("n", "C", '"_C', { noremap = true, silent = true })

-- 可选：x/X 也只删字符不复制
-- vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })
-- vim.keymap.set("n", "X", '"_X', { noremap = true, silent = true })
-- =========================================!@只删除,不复制=========================================

-- 在 Windows 资源管理器中打开当前文件所在目录
-- vim.keymap.set("n", "<leader>fo", function()
--       local dir = vim.fn.expand("%:p:h") -- 当前文件目录
--       vim.fn.system('explorer.exe "' .. dir .. '"')
-- end, { silent = true, desc = "Open folder in Explorer" })

-- 可选：直接定位并选中当前文件
-- vim.keymap.set("n", "<leader>fO", function()
--       local file = vim.fn.expand("%:p") -- 当前文件完整路径
--       vim.fn.system('explorer.exe /select,"' .. file .. '"')
-- end, { silent = true, desc = "Reveal file in Explorer" })

-- 【Windows 稳定版】在资源管理器打开当前文件夹
vim.keymap.set("n", "<leader>fo", function()
      local dir = vim.fn.expand("%:p:h")
  -- vim.cmd('silent !start explorer.exe "' .. dir .. '"')
  -- Macos在访达这打开当前文件夹
  vim.cmd('silent !open "' .. dir .. '"')
end, { desc = "Explorer: Open folder" })

-- 【Windows 稳定版】定位并选中当前文件
-- vim.keymap.set("n", "<leader>fO", function()
--       local file = vim.fn.expand("%:p")
-- vim.cmd('silent !start explorer.exe /select,"' .. file .. '"')
-- end, { desc = "Explorer: Reveal file" })
-- Macos在访达这打开当前文件夹并选中该文件
vim.keymap.set("n", "<leader>fO", function()
  local file = vim.fn.expand("%:p")
  if file == "" or vim.fn.filereadable(file) == 0 then
    vim.notify("文件未保存，无法定位", vim.log.levels.WARN)
    return
  end
  -- 转义路径中的双引号，避免 AppleScript 语法错误
  local esc = file:gsub('"', '\\"')
  vim.fn.system({
    "osascript", "-e",
    string.format('tell application "Finder" to reveal POSIX file "%s"', esc),
    "-e", "tell application \"Finder\" to activate"
  })
end, { desc = "Finder: Reveal file" })


-- @调试模式下快捷键设置-- F5：启动调试 / 继续运行
-- F5：启动调试 / 继续运行
vim.keymap.set("n", "<F5>", function()
  require("dap").continue()
end, { noremap = true, silent = true, desc = "DAP: 启动/继续调试" })

-- Shift+F5：停止调试，终止会话 在neovide下本身按键
vim.keymap.set("n", "<S-F5>", function()
-- vim.keymap.set("n", "<F17>", function()
  require("dap").terminate()
end, { noremap = true, silent = true, desc = "DAP: 终止调试" })

-- F9：切换普通断点
vim.keymap.set("n", "<F9>", function()
  require("dap").toggle_breakpoint()
end, { noremap = true, silent = true, desc = "DAP: 切换断点" })

-- F10：单步步过 Step Over
vim.keymap.set("n", "<F10>", function()
  require("dap").step_over()
end, { noremap = true, silent = true, desc = "DAP: 步过 Step Over" })

-- F11：单步进入 Step Into
vim.keymap.set("n", "<F11>", function()
  require("dap").step_into()
end, { noremap = true, silent = true, desc = "DAP: 步入 Step Into" })

-- Shift+F11：单步跳出 Step Out 在neovide下本身按键
vim.keymap.set("n", "<S-F11>", function()
-- vim.keymap.set("n", "<F23>", function()
  require("dap").step_out()
end, { noremap = true, silent = true, desc = "DAP: 步出 Step Out" })
-- @!调试模式下快捷键设置

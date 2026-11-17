-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.basic")
require( "config.higtlight" )

vim.g.autoformat = false

-- @直接修改背景色，fg设为NONE保留原文字颜色 20260920
vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "#1e5f1e", fg = "#ffffff" })
-- 可选：区分读/写引用的背景色
vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = "#1e5f1e", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = "#1e5f1e", fg = "#ffffff" })
-- @!直接修改背景色，fg设为NONE保留原文字颜色 20260920

-- winbar 设置在buffer页先显示绝对路径
-- 永久开启 winbar，显示完整系统绝对路径
-- vim.opt.winbar = "%{expand('%:p')}"
--mac 下设置: 用家目录缩写~
vim.opt.winbar = "%{expand('%:p:~')}"
-- !@ winbar 设置在buffer页先显示绝对路径
--每次退出nvim时, 强制自动删除main.shada.tmp.x文件

-- local function delete_shada_tmp()
--     local tmp_file = vim.fn.stdpath('data') .. '/shada/main.shada.tmp.x'
--     -- 检查文件是否存在，如果存在则删除
--     if vim.loop.fs_stat(tmp_file) then
--         vim.loop.fs_unlink(tmp_file)
--     end
-- end

-- vim.api.nvim_create_autocmd('VimLeave', {
--     callback = delete_shada_tmp,
-- })

-- 关闭自动延续注释 //
-- vim.opt.formatoptions:remove('c')
-- vim.opt.formatoptions:remove('r')
-- vim.opt.formatoptions:remove('o')

-- 全局禁用自动延续注释（所有文件类型）
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
        -- 可选：直接重设 formatoptions，彻底覆盖
        -- vim.opt_local.formatoptions = "jql" -- 保留常用，去掉 c r o
    end,
})

-- 专门针对 C/C++/Qt 再强化一次（防止被 ftplugin 覆盖）
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "h", "hpp", "qml" },
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

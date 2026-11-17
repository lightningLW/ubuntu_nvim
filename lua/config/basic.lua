vim.opt.cursorline = true --光标行高亮
vim.opt.cursorcolumn = true --光标列高亮
-- 可选：自定义竖线颜色（适配主题）
-- vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#333355", ctermbg = 236 })
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#222244", ctermbg = 235 })
vim.opt.colorcolumn = "120" --第100列高亮
-- 设置第100列的背景颜色（深灰色，适合深色主题）
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#3a3a3a", ctermbg = 237 })

-- 设置tab键为4个空格
vim.opt.expandtab = true --将制表符转换为空格
vim.opt.tabstop = 4 --一个制表符显示为4个空格的宽度
vim.opt.shiftwidth = 0 --自动缩进时使用的空格数
-- vim.opt.softabstop = 4          --插入模式下按<Tab>键插入4个空格（当expandtab开启时）

-- 设置自动刷新外部修改文件
vim.opt.autoread = true

-- 如果查找的内容中不存在大写，则大小写不敏感
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 不要在查找之后继续高亮匹配结果
--vim.opt.hlsearch = false

--将内容复制到剪切板
vim.opt.clipboard = "unnamedplus"

-- -- 设置诊断信息的高亮样式
-- --语法错误提示文字的颜色
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#ff0000" })
-- --警告信息提示文字的颜色
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#fbbf24" })
-- --提示信息文字的颜色
-- vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#7c3aed" })
-- --信息类消息文字的颜色
-- vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#00ffff" })
--
-- -- 设置虚拟文本和标志的高亮样式
-- --页面内用于标示错误的虚拟文本颜色
-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#cc0000" })
-- --侧边栏（行号旁）错误标志的颜色
vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#ff0000" })
-- --侧边栏（行号旁）警告标志的颜色
vim.api.nvim_set_hl(0, "DiagnosticSignWarning", { fg = "#fbbf24" })

--设置光标
-- 定义光标颜色
-- vim.api.nvim_set_hl(0, "Cursor", { fg = "#ff0000", bg = "#ff0000" }) -- 普通模式光标颜色
-- vim.api.nvim_set_hl(0, "iCursor", { fg = "#ff0000", bg = "#00ff00" }) -- 插入模式光标颜色 [citation:3]

-- 设置 guicursor 选项
vim.opt.guicursor = {
  "n-v-c-sm:block",
  "i-ci-ve:ver100-blinkwait700-blinkon400-blinkoff250",
  "r-cr-o:block-blinkwait300-blinkon400-blinkoff250",
}

-- 设置复制粘贴快捷键
local function setup_clipboard_keymaps()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- === 正常 (Normal) 与可视 (Visual) 模式 ===
  -- 复制选中内容到系统剪贴板
  keymap({ "v", "x" }, "<C-c>", '"+y', opts)
  -- 从系统剪贴板粘贴到光标后
  keymap("n", "<C-v>", '"+p', opts)
  -- 从系统剪贴板粘贴到光标前
  keymap("n", "<C-S-v>", '"+P', opts)

  -- === 插入 (Insert) 模式 ===
  -- 从系统剪贴板粘贴
  keymap("i", "<C-v>", "<C-r>+", opts)
  -- 复制当前行（在插入模式下按 Ctrl-C 会退出插入模式，此处映射为复制整行并保持插入模式）
  -- 注意：Ctrl-C 在插入模式默认行为是退出插入模式，这里重新映射
  keymap("i", "<C-c>", '<Esc>"+yygi', opts) -- 复制当前行并回到插入位置
end
-- 调用函数
setup_clipboard_keymaps()

-- 设置neovide -----------------------------------------------------------------begin

--光标设置
-- vim.g.neovide_cursor_vfx_mode = "pixiedust"  -- 粒子效果
-- vim.g.neovide_cursor_vfx_mode = "torpedo"   -- 鱼雷效果
vim.g.neovide_cursor_vfx_mode = "ripple"    -- 波纹效果
vim.o.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"
vim.api.nvim_set_hl(0, 'Cursor', { bg = '#00ff33', fg = '#ff0000' })
--
-- -- 设置GUI字体，注意格式与终端内不同
-- -- -- 例如：12磅、中等粗细、斜体的 JetBrainsMono Nerd Fon 
-- -- italic normal
vim.o.guifont = "JetBrainsMonoNL Nerd Font:h12:medium:normal"
-- -- 窗口透明度 (0.0 完全透明, 1.0 完全不透明)
vim.g.neovide_opacity = 1.0
--初始化字体大小缩放因子
vim.g.neovide_scale_factor = 1.3

-- 设置neovide ------------------------------------------------------------------.end

-- macOS 下将左右 Option 键均识别为 Meta/Alt 键
vim.g.neovide_input_macos_option_key_is_meta = 'both'
-- 仅左 Option 键作为 Meta 键（右 Option 保留原生字符输入）
-- vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
-- 仅右 Option 键作为 Meta 键
-- vim.g.neovide_input_macos_option_key_is_meta = 'only_right'

-- 窗口透明度
-- vim.opt.winblend = 20           --浮动窗口透明度
-- vim.opt.pumblend =20            -- 补全窗口透明度

-- 增强行号对比度设置
-- 设置普通行号的显示颜色（提高亮度和对比度）
-- vim.api.nvim_set_hl(0, "LineNr", { fg = "#9ca0b0", ctermfg = 242 })
-- 设置当前行号的显示颜色（更明显的颜色）
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", ctermfg = 231, bold = true })
-- 设置相对行号中，当前行之上的行号颜色
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#777777", ctermfg = 111 })
-- 设置相对行号中，当前行之下的行号颜色
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#777777", ctermfg = 111 })

-- ===自定义折叠文本显示（显示行号范围和行数）==
vim.opt.foldtext = "v:lua.custom_fold_text()"

function _G.custom_fold_text()
  local fold_start = vim.v.foldstart
  local fold_end = vim.v.foldend
  local line_count = fold_end - fold_start + 1

  -- 获取折叠内容的第一行
  local first_line = vim.api.nvim_buf_get_lines(0, fold_start - 1, fold_start, true)[1]

  -- 清理行内容（移除前后空格）
  local content = first_line:gsub("^%s*", ""):gsub("%s*$", "")
  -- 限制内容长度
  if #content > 50 then
    content = content:sub(1, 47) .. "..."
  end

  -- 创建折叠显示文本：行号范围 + 行数 + 内容预览
  return string.format("▼ %d-%d (%d lines): %s", fold_start, fold_end, line_count, content)
end
-- ===!自定义折叠文本显示（显示行号范围和行数）==

-- 注释颜色设置
-- 设置注释的显示颜色（提高对比度和可读性）
-- vim.api.nvim_set_hl(0, "Comment", { fg = "#777777", italic = true, ctermfg = 111 })
-- vim.api.nvim_set_hl(0, "Comment", { fg = "#6a9955", italic = true, ctermfg = 111 })
-- 设置特殊注释的颜色（如 TODO、FIXME 等）
-- vim.api.nvim_set_hl(0, "SpecialComment", { fg = "#f9c096", bold = true, ctermfg = 215 })

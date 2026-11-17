-- 代码补全
return {
    "saghen/blink.cmp",     --github链接
    version = "*",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    event = "VeryLazy",
    opts = {
        -- 显示帮助文档
        completion = {
            documentation = {
                auto_show = true,
            },
        },
         keymap = {
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            -- ['<A-e>'] = { 'hide', 'fallback' },
            ['<space>'] = { 'hide', 'fallback' },
            ['<C-y>'] = { 'select_and_accept', 'fallback' },
            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
            ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
            ['<Tab>'] = { 'select_next', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'fallback' },
            ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
        },
        -- 补全来源
        sources = {
            default = { "path", "snippets", "buffer", "lsp" },
        },
        cmdline = {
            sources = function()
                local cmd_type = vim.fn.getcmdtype()
                if cmd_type == "/" or cmd_type == "?" then
                    return { "buffer" }
                end
                if cmd_type == ":" then
                    return { "cmdline" }
                end
                return {}
            end,
           -- keymap = {
           --     preset = 'default',
           --},
            completion = {
                menu = {
                    auto_show = true,
                },
            },
        },
    },
}

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- 其他 LSP 服务器的配置...
        clangd = {
          capabilities = { offsetEncoding = "utf-8" }, -- 字符偏移编码，utf-8适配neovim
          init_options = {
            fallbackFlags = { "-std=c++11" }, -- 兜底编译参数：无compile_commands.json时使用C++11标准
          },
          cmd = {
            "/usr/bin/clangd", -- clangd程序路径
            "--query-driver=/usr/bin/clang++", -- 告知clangd编译器路径，用于识别系统头文件
            "--background-index", -- 后台异步索引项目，不阻塞编辑器
            "--clang-tidy", -- 开启clang-tidy静态代码检查
            "--clang-tidy-checks=*,-modernize-use-trailing-return-type,-modernize-use-auto", -- 开启全部tidy检查，关闭两类噪音大的现代化重构提示
            "--header-insertion=never",                     --关闭自动插入头文件
          },
        },
      },
    },
  },
}

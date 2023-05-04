local lsp = require('plugin.lsp')
local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')

lspconfig.clangd.setup{
    cmd = {
      'clangd',
      '--clang-tidy',
      '--background-index',
      '--suggest-missing-includes',
      '--all-scopes-completion',
      '--header-insertion=iwyu',
      '--completion-style=detailed',
      '--pch-storage=memory',
    },
    on_attach = lsp.on_attach,
    capabilities = vim.tbl_extend("keep", lsp.capabilities, lsp_status.capabilities),
    handlers = lsp_status.extensions.clangd.setup(),
    root_dir = lspconfig.util.root_pattern('CMakeLists.txt', '.git', 'Makefile', 'compile_commands.json', 'compile_flags.txt'),
    filetypes = {'c', 'cpp', 'cc', 'objc', 'objcpp'},
    init_options = {
      clangdFileStatus = true,
      usePlaceholders = true,
      completeUnimported = true,
      semanticHighlighting = true,
    },
}

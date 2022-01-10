local lsp = require('plugins.lsp')
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
    handlers = lsp_status.extensions.clangd.setup(),
    filetypes = {'c', 'cpp', 'cc', 'objc', 'objcpp'},
    init_options = {
      clangdFileStatus = true,
      usePlaceholders = true,
      completeUnimported = true,
      semanticHighlighting = true
    },
    root_dir = lspconfig.util.root_pattern('compile_commands.json', 'compile_flags.txt', '.git', 'CMakeLists.txt', 'Makefile'),
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
}

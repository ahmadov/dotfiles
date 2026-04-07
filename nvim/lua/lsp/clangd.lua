local lsp = require('lsp')
local lsp_status = require('lsp-status')

local M = {}

function M.setup()
  vim.lsp.config('clangd', {
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
      capabilities = lsp.capabilities,
      handlers = lsp_status.extensions.clangd.setup(),
      root_markers = { '.clangd', '.clang-tidy', '.clang-format', 'Makefile', 'compile_commands.json', 'compile_flags.txt', 'configure.ac', '.git' },
      filetypes = {'c', 'cpp', 'cc', 'objc', 'objcpp'},
      single_file_support = true,
      init_options = {
        clangdFileStatus = true,
        usePlaceholders = true,
        completeUnimported = true,
        semanticHighlighting = true,
      },
  })

  vim.lsp.enable('clangd')
end

return M

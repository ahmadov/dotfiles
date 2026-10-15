local M = {}

function M.setup()
  vim.lsp.config('clangd', {
      cmd = {
        'clangd',
        '--clang-tidy',
        '--background-index',
        '--all-scopes-completion',
        '--header-insertion=iwyu',
        '--completion-style=detailed',
        '--pch-storage=memory',
      },
      root_markers = { '.clangd', '.clang-tidy', '.clang-format', 'Makefile', 'compile_commands.json', 'compile_flags.txt', 'configure.ac', '.git' },
      filetypes = {'c', 'cpp', 'objc', 'objcpp'},
      init_options = {
        clangdFileStatus = true,
        usePlaceholders = true,
        completeUnimported = true,
      },
  })

  vim.lsp.enable('clangd')
end

return M

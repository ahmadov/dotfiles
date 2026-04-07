local M = {}

function M.config()
  require('conform').setup({
    formatters_by_ft = {
      c   = { 'clang_format' },
      cpp = { 'clang_format' },
    },
    formatters = {
      clang_format = {
        args = { '-style=file' },
      },
    },
  })
end

return M

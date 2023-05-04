local M = {}

function M.config()
  require('nvim-highlight-colors').setup({
    render = 'background',
  })
end

return M

local M = {}

function M.config()
  local notify = require('notify')
  notify.setup({
    stages = "slide",
    render = "default", -- minimal
    timeout = 3000,
  })
  -- vim.notify = notify
end

return M

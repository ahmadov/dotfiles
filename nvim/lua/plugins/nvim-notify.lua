local notify = require('notify')
local M = {}

function M.config()
  notify.setup({
    stages = "slide",
    render = "default", -- minimal
    timeout = 3000,
  })
  vim.notify = notify
end

return M

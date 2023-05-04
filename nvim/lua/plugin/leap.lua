local M = {}

function M.config()
  local leap = require('leap')
  leap.set_default_keymaps()
end

return M

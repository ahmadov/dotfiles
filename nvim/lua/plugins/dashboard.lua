local utils = require('utils')

local M = {}

function M.config()
  utils.map('n', '<Leader>ss', ':<C-u>SessionSave<CR>', opts)
  utils.map('n', '<Leader>sl', ':<C-u>SessionLoad<CR>', opts)
end

return M

local utils = require('utils')

local M = {}

function M.config()
  vim.cmd([[
    let g:dashboard_default_executive ='telescope'
    let g:indentLine_fileTypeExclude = ['dashboard']
  ]])
  utils.map('n', '<Leader>ss', ':<C-u>SessionSave<CR>')
  utils.map('n', '<Leader>sl', ':<C-u>SessionLoad<CR>')
end

return M

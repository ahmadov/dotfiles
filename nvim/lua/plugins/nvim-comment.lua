local M = {}

function M.config()
  require('nvim_comment').setup({
    marker_padding = true,
    comment_empty = false,
    create_mappings = false,
  })
end

return M


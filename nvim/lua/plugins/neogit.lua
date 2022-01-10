local M = {}

function M.config()
  require('neogit').setup {
    signs = {
      section = { '', '' },
      item = { '▸', '▾' },
      hunk = { '', '' },
    },
    integrations = {
      diffview = true,
    },
  }
end

return M

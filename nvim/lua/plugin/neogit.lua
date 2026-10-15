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

  -- Upstream `git submodule` runs `git describe` in every submodule, only paths are used
  require('neogit.lib.git.submodule').list = function()
    local paths = {}
    for _, line in ipairs(vim.fn.systemlist({ 'git', 'ls-files', '--stage' })) do
      local path = line:match('^160000 %x+ %d+\t(.+)$')
      if path then table.insert(paths, path) end
    end
    return paths
  end
end

return M

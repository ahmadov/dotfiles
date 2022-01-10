local M = {}

function M.config()
  require('nvim-treesitter.configs').setup {
    ensure_installed = 'maintained',
    highlight = {
      enable = true,
      use_languagetree = true
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = 'gn',
        node_incremental = 'gr',
        scope_incremental = 'gc',
        node_decremental = 'gm',
      },
    },
    indent = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
    autopairs = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
    },
    matchup = {
      enable = true,
    },
  }
end

return M

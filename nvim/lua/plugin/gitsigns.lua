local M = {}

function M.config()
  require('gitsigns').setup {
    signs = {
      add = {
        hl = 'GitSignsAdd',
        text = '▋',
        numhl = 'GitSignsAddNr',
        linehl = 'GitSignsAddLn',
      },
      change = {
        hl = 'GitSignsChange',
        text = '▋',
        numhl = 'GitSignsChangeNr',
        linehl = 'GitSignsChangeLn',
      },
      delete = {
        hl = 'GitSignsDelete',
        text = '▋',
        show_count = true,
        numhl = 'GitSignsDeleteNr',
        linehl = 'GitSignsDeleteLn',
      },
      topdelete = {
        hl = 'GitSignsDelete',
        text = '‾',
        show_count = true,
        numhl = 'GitSignsDeleteNr',
        linehl = 'GitSignsDeleteLn',
      },
      changedelete = {
        hl = 'GitSignsChange',
        text = '~',
        show_count = true,
        numhl = 'GitSignsChangeNr',
        linehl = 'GitSignsChangeLn',
      },
    },
    numhl = false,
    linehl = false,
    word_diff  = false,
    watch_gitdir = {
      interval = 500
    },
    sign_priority = 5,
    status_formatter = nil, -- Use default
    update_debounce = 100,
    diff_opts = {
      internal = true -- If luajit is present
    },
  }
end

return M

local M = {}

function M.config()
  require('gitsigns').setup {
    signs = {
--         add = {hl = 'DiffAdd', text = '▌', numhl = 'GitSignsAddNr'},
--         change = {hl = 'DiffChange', text = '▌', numhl = 'GitSignsChangeNr'},
--         delete = {hl = 'DiffDelete', text = '_', numhl = 'GitSignsDeleteNr'},
--         topdelete = {hl = 'DiffDelete', text = '‾', numhl = 'GitSignsDeleteNr'},
--         changedelete = {hl = 'DiffChange', text = '~', numhl = 'GitSignsChangeNr'}
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
    keymaps = {
      -- Default keymap options
      noremap = true,
      buffer = true,
      ['n ]c'] = {expr = true, "&diff ? ']c' : '<cmd>lua require(\"gitsigns.actions\").next_hunk()<CR>'"},
      ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require(\"gitsigns.actions\").prev_hunk()<CR>'"},
      ['n <leader>hs'] = "<cmd>lua require('gitsigns').stage_hunk()<CR>",
      ['n <leader>hu'] = "<cmd>lua require('gitsigns').undo_stage_hunk()<CR>",
      ['n <leader>hr'] = "<cmd>lua require('gitsigns').reset_hunk()<CR>",
      ['n <leader>hp'] = "<cmd>lua require('gitsigns').preview_hunk()<CR>",
      ['n <leader>hb'] = "<cmd>lua require('gitsigns').blame_line()<CR>"
    },
    watch_index = {
      interval = 500
    },
    sign_priority = 5,
    status_formatter = nil, -- Use default
    update_debounce = 100,
    use_decoration_api = true,
    use_internal_diff = true,  -- If luajit is present
  }
end

return M

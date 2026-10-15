local M = {}

function M.config()
  require('gitsigns').setup {
    -- signs = {
    --   add = {
    --     hl = 'GitSignsAdd',
    --     text = '▋',
    --     numhl = 'GitSignsAddNr',
    --     linehl = 'GitSignsAddLn',
    --   },
    --   change = {
    --     hl = 'GitSignsChange',
    --     text = '▋',
    --     numhl = 'GitSignsChangeNr',
    --     linehl = 'GitSignsChangeLn',
    --   },
    --   delete = {
    --     hl = 'GitSignsDelete',
    --     text = '▋',
    --     show_count = true,
    --     numhl = 'GitSignsDeleteNr',
    --     linehl = 'GitSignsDeleteLn',
    --   },
    --   topdelete = {
    --     hl = 'GitSignsDelete',
    --     text = '‾',
    --     show_count = true,
    --     numhl = 'GitSignsDeleteNr',
    --     linehl = 'GitSignsDeleteLn',
    --   },
    --   changedelete = {
    --     hl = 'GitSignsChange',
    --     text = '~',
    --     show_count = true,
    --     numhl = 'GitSignsChangeNr',
    --     linehl = 'GitSignsChangeLn',
    --   },
    -- },
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
    on_attach = function(bufnr)
      local gs = require('gitsigns')
      local function map(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
      end
      local function selection() return { vim.fn.line('.'), vim.fn.line('v') } end

      map('n', ']g', function() gs.nav_hunk('next') end)
      map('n', '[g', function() gs.nav_hunk('prev') end)
      map('n', '<leader>hs', gs.stage_hunk)
      map('v', '<leader>hs', function() gs.stage_hunk(selection()) end)
      map('n', '<leader>hu', gs.stage_hunk)
      map('n', '<leader>hr', gs.reset_hunk)
      map('v', '<leader>hr', function() gs.reset_hunk(selection()) end)
      map('n', '<leader>hp', gs.preview_hunk)
      map('n', '<leader>hb', gs.blame_line)
    end,
  }
end

return M

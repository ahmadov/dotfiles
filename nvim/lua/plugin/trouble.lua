local M = {}

M.keys = {
  { '<leader>Xx', '<cmd>Trouble diagnostics toggle<CR>', desc = 'Diagnostics (Trouble)' },
  { '<leader>Xb', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', desc = 'Buffer diagnostics (Trouble)' },
  { '<leader>Xq', '<cmd>Trouble qflist toggle<CR>', desc = 'Quickfix list (Trouble)' },
  { '<leader>Xl', '<cmd>Trouble loclist toggle<CR>', desc = 'Location list (Trouble)' },
}

function M.config()
  require('trouble').setup {
    indent_guides = false,
    icons = {
      indent = { fold_open = '▾ ', fold_closed = '▸ ' },
    },
    keys = { ['<tab>'] = 'fold_toggle' },
  }
  vim.api.nvim_set_hl(0, 'TroubleText', { link = 'CursorLineNr' })
end

return M

local aerial = require('aerial')
local M = {}

function M.config()
  aerial.setup({
    close_behavior = 'auto',
    default_bindings = true,
    default_direction = 'prefer_right',
    diagnostics_trigger_update = true,
    highlight_mode = 'split_width',
    highlight_on_jump = 300,
    link_tree_to_folds = true,
    link_folds_to_tree = false,
    manage_folds = 'manual',
    max_width = 50,
    min_width = 30,
    nerd_font = 'auto',
    open_automatic = false,
    -- open_automatic = function(bufnr)
    --   return vim.api.nvim_buf_line_count(bufnr) > 80
    --     and aerial.num_symbols(bufnr) > 4
    --     and not aerial.was_closed()
    -- end,
    post_jump_cmd = 'normal! zz',
    update_when_errors = true,
    filter_kind = {
      'Class',
      'Constructor',
      'Enum',
      'Function',
      'Interface',
      'Method',
      'Struct',
    },
  })
end

return M

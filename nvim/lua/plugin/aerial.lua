local M = {}

function M.config()
  require('aerial').setup({
    backends = { "lsp", "treesitter", "markdown" },
    -- close_behavior = 'auto',
    highlight_mode = 'split_width',
    highlight_on_jump = 300,
    -- ufo owns folding
    link_tree_to_folds = false,
    manage_folds = false,
    on_attach = function(bufnr)
      vim.keymap.set('n', '<leader>o', '<cmd>AerialToggle<CR>', { buffer = bufnr })
      vim.keymap.set('n', '[[', '<cmd>AerialPrev<CR>', { buffer = bufnr })
      vim.keymap.set('n', ']]', '<cmd>AerialNext<CR>', { buffer = bufnr })
    end,
    layout = {
      default_direction = 'prefer_right',
      max_width = 50,
      min_width = 30,
    },
    nerd_font = 'auto',
    open_automatic = false,
    -- open_automatic = function(bufnr)
    --   return vim.api.nvim_buf_line_count(bufnr) > 80
    --     and aerial.num_symbols(bufnr) > 4
    --     and not aerial.was_closed()
    -- end,
    post_jump_cmd = 'normal! zz',
    lsp = {
      diagnostics_trigger_update = true,
      update_when_errors = true,
    },
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

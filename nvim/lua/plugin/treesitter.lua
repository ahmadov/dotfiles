local M = {}

function M.config()
  -- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
  vim.defer_fn(function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {'c', 'cpp', 'rust', 'vim', 'lua', 'cmake', 'go', 'python', 'markdown', 'markdown_inline'},
      auto_install = false,
      highlight = {
        enable = true,
        disable = function(_, bufnr)
            return vim.api.nvim_buf_line_count(bufnr) > 5000
        end,
        additional_vim_regex_highlighting = { "latex" },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>',
          node_incremental = '<CR>',
          scope_incremental = '<S-CR>',
          node_decremental = '<BS>',
        },
      },
      indent = {
        enable = true,
      },
    }
    require('nvim-ts-autotag').setup()
  end, 0)
end

return M

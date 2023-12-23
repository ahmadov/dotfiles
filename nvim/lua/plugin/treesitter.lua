local M = {}

function M.config()
  -- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
  vim.defer_fn(function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {'c', 'cpp', 'rust', 'vim', 'lua', 'cmake', 'go', 'python', 'markdown', 'markdown_inline'},
      auto_install = false,
      highlight = { enable = true },
      textobjects = { enable = true },
      textsubjects = { enable = true },
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
      rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
      },
      autopairs = {
        enable = true,
      },
      matchup = {
        enable = true,
      },
    }
  end, 0)
end

return M

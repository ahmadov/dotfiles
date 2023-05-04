local M = {}

function M.config()
  require('nvim-treesitter.configs').setup {
    ensure_installed = {'c', 'cpp', 'rust', 'vim', 'lua', 'cmake', 'go', 'python'},
    highlight = {
      enable = true,
      -- use_languagetree = true
    },
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
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
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

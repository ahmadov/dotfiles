local utils = require('utils')

local M = {}

function M.config()
  require('telescope').setup{
    defaults = {
      vimgrep_arguments = {
        'rg',
  --       '--reverse',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case'
      },
      prompt_prefix = '> ',
      selection_caret = '> ',
      entry_prefix = '  ',
      initial_mode = 'insert',
      selection_strategy = 'reset',
      sorting_strategy = 'ascending',
      layout_strategy = 'horizontal',
      layout_config = {
        prompt_position = 'top',
        horizontal = {
          mirror = false,
          preview_width = 0.6
        },
        vertical = {
          mirror = false,
        },
      },
      file_sorter =  require('telescope.sorters').get_fuzzy_file,
      file_ignore_patterns = {},
      generic_sorter =  require('telescope.sorters').get_generic_fuzzy_sorter,
      winblend = 0,
      border = {},
      borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
      color_devicons = true,
      use_less = true,
      set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
      extensions = {
          media_files = {
              filetypes = {'png', 'webp', 'jpg', 'jpeg'},
  --             find_cmd = 'rg' -- find command (defaults to `fd`)
          },
          fzf = {
              fuzzy = true,                    -- false will only do exact matching
              override_generic_sorter = false, -- override the generic sorter
              override_file_sorter = true,     -- override the file sorter
              case_mode = 'smart_case',        -- or 'ignore_case' or 'respect_case'
                                               -- the default case_mode is 'smart_case'
          },
          fzf_writer = {
              minimum_grep_characters = 1,
              minimum_files_characters = 1,

              -- Disabled by default.
              -- Will probably slow down some aspects of the sorter, but can make color highlights.
              -- I will work on this more later.
              use_highlighter = false,
          }
      }
    }
  }

  require('telescope').load_extension('media_files')
  require('telescope').load_extension('fzy_native')
  
  utils.map('n', '<Leader>fm', [[<Cmd>lua require('telescope').extensions.media_files.media_files()<CR>]], {noremap = true, silent = true})
end

return M

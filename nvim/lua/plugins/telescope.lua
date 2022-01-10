local utils = require('utils')
local actions = require('telescope.actions')

local M = {}

function M.config()
  require('telescope').setup{
    defaults = {
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case'
      },
      mappings = {
        i = {
          ["<esc>"] = actions.close
        },
      },
      dynamic_preview_title = true,
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
              find_cmd = 'rg'
          },
          fzf = {
              fuzzy = true,
              override_generic_sorter = false,
              override_file_sorter = true,
              case_mode = 'smart_case',
          },
          fzf_writer = {
              minimum_grep_characters = 1,
              minimum_files_characters = 1,
              use_highlighter = false,
          }
      }
    }
  }

  require('telescope').load_extension('dap')
  require('telescope').load_extension('cmake')
  require('telescope').load_extension('media_files')
  require('telescope').load_extension('fzy_native')

  utils.map('n', '<Leader>fm', [[<Cmd>lua require('telescope').extensions.media_files.media_files()<CR>]], {noremap = true, silent = true})
end

return M

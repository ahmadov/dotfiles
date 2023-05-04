local utils = require('utils')

local M = {}

function M.config()
  vim.cmd([[
    let g:dashboard_default_executive ='telescope'
    let g:indentLine_fileTypeExclude = ['dashboard']
  ]])
  utils.map('n', '<Leader>ss', ':<C-u>SessionSave<CR>')
  utils.map('n', '<Leader>sl', ':<C-u>SessionLoad<CR>')
  -- db.preview_command = 'bat -p'
  -- db.preview_file_path = header()
  -- db.preview_file_height = 12
  -- db.preview_file_width = 80
  require('dashboard').setup({
    config = {
      center = {
        {
          icon = '  ',
          desc = 'Update Plugins                          ',
          shortcut = 'SPC p u',
          action ='PackerUpdate'
        },
        {
          icon = '  ',
          desc = 'Recently opened files                   ',
          action =  'Telescope oldfiles',
          shortcut = 'SPC f h'
        },
        {
          icon = '  ',
          desc = 'Find  File                              ',
          action = 'Telescope find_files find_command=rg,--hidden,--files',
          shortcut = 'SPC f f'
        },
        {
          icon = '  ',
          desc ='File Browser                            ',
          action =  'Telescope file_browser',
          shortcut = 'SPC f b'
        },
        {
          icon = '  ',
          desc = 'Find  word                              ',
          action = 'Telescope live_grep',
          shortcut = 'SPC f b'
        },
      }
    }
  })
end

return M

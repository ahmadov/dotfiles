local M = {}

function M.config()
  -- colors for active , inactive buffer tabs 
  require('bufferline').setup {
    options = {
      view = 'multiwindow',
      buffer_close_icon = '',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      enforce_regular_tabs = false,
      show_close_icon = false,
      show_buffer_close_icons = true,
      separator_style = 'thin',
      mapping = false,
    },
    highlights = {
      background = {
        guifg = comment_fg,
        guibg = '#282c34'
      },
      fill = {
        guifg = comment_fg,
        guibg = '#282c34'
      },
      buffer_selected = {
        guifg = normal_fg,
        guibg = '#3A3E44',
        gui = 'bold'
      },
      separator_visible = {
        guifg = '#282c34',
        guibg = '#282c34'
      },
      separator_selected = {
        guifg = '#282c34',
        guibg = '#282c34'
      },
      separator = {
        guifg = '#282c34',
        guibg = '#282c34'
      },
      indicator_selected = {
        guifg = '#282c34',
        guibg = '#282c34'
      },
      modified_selected = {
        guifg = string_fg,
        guibg = '#3A3E44'
      }
    }
  }
end

return M

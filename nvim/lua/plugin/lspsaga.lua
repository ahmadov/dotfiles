local M = {}

function M.config()
  require('lspsaga').setup({
    ui = {
      border = 'single',
      code_action = '💡',
    },
    lightbulb = {
      enable = true,
      sign = true,
      sign_priority = 20,
      virtual_text = true,
    },
    finder = {
      keys = {
        toggle_or_open = { '<CR>', 'o' },
        vsplit = 's',
        split = 'i',
        quit = { 'q', '<Esc>' },
      },
    },
    code_action = {
      keys = { quit = { 'q', '<Esc>' }, exec = '<CR>' },
    },
    rename = {
      keys = { quit = '<C-c>' },
    },
  })
end

return M

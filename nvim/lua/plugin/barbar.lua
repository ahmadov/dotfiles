local M = {}

function M.config()
  require('barbar').setup {
    animation = false,
    auto_hide = 1,
    tabpages = true,
    clickable = true,
    semantic_letters = true,
    maximum_length = 30,
    maximum_padding = 2,
    icons = {
      button = false,
      separator = { left = '▎' },
      inactive = { separator = { left = ' ' } },
      modified = { button = false },
    },
  }
end

return M

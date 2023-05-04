local M = {}

function M.config()
  require('lspsaga').setup({
    code_action_icon = '💡',
    diagnostic_header = { " ", " ", " ", "ﴞ " },
    -- show_diagnostic_source = true,
    -- code_action_prompt = {
    --   enable        = true,
    --   sign          = true,
    --   sign_priority = 20,
    --   virtual_text  = false,
    -- },
    code_action_lightbulb = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = true,
    },
    finder_action_keys = {
      open = {'<CR>', 'o'},
      vsplit = 's',
      split = 'i',
      quit = {'q', '<esc>', '<C-c>'},
      scroll_down = '<C-f>',
      scroll_up = '<C-b>'
    },
    code_action_keys = { quit = {'q', '<ESC>'}, exec = '<CR>' },
    -- rename_action_keys = { quit = {'<ESC>', '<C-c>'}, exec = '<CR>' },
    rename_action_quit = '<C-c>',
    border_style = "single",
    -- symbol_in_winbar = false,
    -- winbar_separator = '>',
    -- winbar_show_file = false,
    -- rename_prompt_prefix = "➤",
  })
end

return M

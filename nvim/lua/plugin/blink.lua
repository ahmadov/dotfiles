local M = {}

function M.config()
   require('blink.cmp').setup({
      auto_start = true,
      appearance = {
        nerd_font_variant = 'mono'
      },
      keymap = {
        preset = 'none',
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Enter>'] = { 'accept', 'fallback' },

        ['<C-e>'] = { 'show_documentation', 'fallback' },
        ['<C-k>'] = { 'show_signature', 'fallback' },
        ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
      },
      completion = {
        menu = {
          auto_show = true,
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind" }
            },
          }
        },
          -- Show documentation when selecting a completion item
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        -- Display a preview of the selected item on the current line
        ghost_text = { enabled = false },
      },
      signature = { enabled = true }
   })
end

return M

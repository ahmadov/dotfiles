local utils = require('utils')

local M = {}

function _G.completions()
    local npairs = require('nvim-autopairs')
    if vim.fn.pumvisible() == 1 then
        if vim.fn.complete_info()['selected'] ~= -1 then
            return vim.fn['compe#confirm']('<CR>')
        end
    end
    return npairs.check_break_line_char()
end

function M.config()
  vim.g.vsnip_snippet_dir = vim.fn.stdpath('config') .. '/snippets'
  require('compe').setup {
      enabled = true,
      autocomplete = true,
      debug = false,
      min_length = 1,
      preselect = 'enable',
      throttle_time = 80,
      source_timeout = 200,
      incomplete_delay = 400,
      max_abbr_width = 66,
      max_kind_width = 66,
      max_menu_width = 66,
      documentation = true,
      source = {
        path = true,
        buffer = true,
        calc = true,
        vsnip = true,
        nvim_lsp = true,
        nvim_lua = true,
        spell = true,
        tags = true,
        snippets_nvim = false,
        treesitter = false
      }
  }

  --  mappings
  utils.map('i', '<C-space>', 'compe#complete()', { expr = true })
  utils.map('i', '<CR>', 'v:lua.completions()', { expr = true })
  utils.map('i', '<Tab>', "pumvisible() ? '<C-n>' : '<Tab>'", { expr = true })
  utils.map('i', '<S-Tab>', "pumvisible() ? '<C-p>' : '<S-Tab>'", { expr = true })
end

return M



-- local t = function(str)
--     return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end
-- _G.tab_complete = function()
--   if vim.fn.pumvisible() == 1 then
--     return t '<C-n>'
--   elseif check_back_space() then
--     return t '<Tab>'
--   else
--     return vim.fn['compe#complete']()
--   end
-- end
-- _G.s_tab_complete = function()
--     if vim.fn.pumvisible() == 1 then
--         return t '<C-p>'
--     elseif vim.fn.call('vsnip#jumpable', {-1}) == 1 then
--         return t '<Plug>(vsnip-jump-prev)'
--     else
--         return t '<S-Tab>'
--     end
-- end
-- vim.api.nvim_set_keymap('i', '<C-Space>', 'v:lua.tab_complete()', {expr = true})
-- vim.api.nvim_set_keymap('s', '<C-Space>', 'v:lua.tab_complete()', {expr = true})
-- vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
-- vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})

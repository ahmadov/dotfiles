local g = vim.g
local api = vim.api
local M = {}

function M.config()
  g.fzf_colors = {
    fg      = { 'fg', 'Normal' },
    bg      = { 'bg', 'Normal' },
    hl      = { 'fg', 'Comment' },
    ['fg+'] = { 'fg', 'CursorLine', 'CursorColumn', 'Normal' },
    ['bg+'] = { 'bg', 'CursorLine', 'CursorColumn' },
    ['hl+'] = { 'fg', 'Statement' },
    info    = { 'fg', 'PreProc' },
    border  = { 'fg', 'Ignore' },
    prompt  = { 'fg', 'Conditional' },
    pointer = { 'fg', 'Exception' },
    marker  = { 'fg', 'Keyword' },
    spinner = { 'fg', 'Label' },
    header  = { 'fg', 'Comment' }
  }

  vim.api.nvim_exec([[
    let $FZF_DEFAULT_OPTS='--reverse'
  ]], '')

end

return M

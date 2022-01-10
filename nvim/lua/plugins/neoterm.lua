local M = {}

function M.config()
  vim.g.neoterm_default_mod = 'belowright'
  vim.g.neoterm_size = 15
  vim.g.neoterm_autoinsert = 1
  vim.g.neoterm_autoscroll = 1
  vim.g.neoterm_term_per_tab = 1

  vim.cmd([[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufEnter,BufWinEnter,WinEnter term://* startinsert
    autocmd BufLeave term://* stopinsert
    autocmd TermClose term://* call nvim_input('<CR>')
    autocmd TermClose * call feedkeys("i")
  ]])
end

return M

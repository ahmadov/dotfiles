local M = {}

function M.config()

  vim.api.nvim_exec([[
    augroup FormatAutogroupEslint
      autocmd!
      " autocmd BufWritePost *.js,*.ts,*.jsx,*.tsx Neoformat eslint_d
    augroup END
    let g:neoformat_c_clangformat = {
      \ 'exe': 'clang-format',
      \ 'args': ['-style=file'],
      \ }
    let g:neoformat_cpp_clangformat = {
      \ 'exe': 'clang-format',
      \ 'args': ['-style=file'],
      \ }
  ]], true)

end

return M

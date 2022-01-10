require('plugins')
require('settings')
require('keybindings')
require('disable_builtins')
require('plugins.colorizer').config()
require('colorscheme')

vim.cmd([[
  if exists('g:neovide')
    let g:neovide_cursor_animation_length=0.05
    let g:neovide_cursor_antialiasing=v:false
    let g:neovide_cursor_trail_length=0.8
    let g:neovide_transparency=1
  endif
]])


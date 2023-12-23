-- setup lazy.nvim + plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('settings')

require('lazy').setup('plugins')

require('disable_builtins')
require('keybindings')
require('colorscheme')

vim.cmd([[
  if exists('g:neovide')
    let g:neovide_cursor_animation_length=0.05
    let g:neovide_cursor_antialiasing=v:false
    let g:neovide_cursor_trail_length=0.8
    let g:neovide_transparency=1

    let g:neovide_cursor_vfx_mode = 'sonicboom'
    let g:neovide_cursor_vfx_opacity = 50
    let g:neovide_remember_window_size = v:true
  endif
]])

vim.opt.guifont = { "FiraCode Nerd Font Mono", ":h12" }

vim.keymap.set({ 'n', 'v' }, '<A-q>', '<cmd>q<CR>', { noremap = true })

-- see https://github.com/nvim-telescope/telescope.nvim/issues/2027#issuecomment-1561836585
vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
    end
  end,
})

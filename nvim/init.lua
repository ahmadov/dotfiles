-- setup packer + plugins
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
  print "Cloning packer .."
  fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }

  -- install plugins + compile their configs
  vim.cmd('packadd packer.nvim')
  require('plugins')
  vim.cmd('PackerSync')

  -- install binaries from mason.nvim & tsparsers
  vim.api.nvim_create_autocmd("User", {
    pattern = "PackerComplete",
    callback = function()
      vim.cmd("bw | silent! MasonInstallAll") -- close packer window
      require("packer").loader "nvim-treesitter"
    end,
  })
else
  require('plugins')
end

require('settings')
require('keybindings')
require('disable_builtins')
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

-- if vim.fn.has('unix') == 1 then
--   vim.o.guifont = 'FiraCode Nerd Font Mono 8' -- Fonts on Windows set in ginit to avoid metrics error in Neovim Qt
--   vim.o.shell = '/usr/bin/zsh' -- I use fish on Linux and it slow for running internal commands
-- end
vim.opt.guifont = { "FiraCode Nerd Font Mono", ":h12" }

vim.keymap.set({ 'n', 'v' }, '<CR>', ':', { noremap = true, desc = 'Enter command line mode' })
vim.keymap.set({ 'n', 'v' }, '<A-q>', '<cmd>q<CR>', { noremap = true, desc = 'Enter command line mode' })

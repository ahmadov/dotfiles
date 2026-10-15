vim.o.autoread                  = true
vim.wo.number                   = true
vim.o.relativenumber            = true
vim.o.viewoptions               = 'cursor,folds'
vim.o.fileencoding              = 'utf-8'
vim.o.splitright                = true
vim.o.completeopt               = 'menuone,noselect,noinsert'
vim.o.showcmd                   = false
vim.o.showmatch                 = false
vim.o.showmode                  = false
vim.o.clipboard                 = 'unnamed,unnamedplus'
vim.o.updatetime                = 200
vim.o.timeoutlen                = 300
vim.o.ttimeoutlen               = 50
vim.o.mouse                     = 'a'
vim.o.smartcase                 = true
vim.o.expandtab                 = true
vim.o.smartindent               = true
vim.o.shiftwidth                = 2
vim.o.showtabline               = 2
vim.o.tabstop                   = 2
vim.o.softtabstop               = 2
vim.o.undofile                  = true
vim.o.undodir                   = vim.fn.expand('~/.undodir')
vim.fn.mkdir(vim.o.undodir, 'p', tonumber('700', 8))
vim.o.cursorline               = true
vim.o.termguicolors             = true
vim.o.termsync                  = false
vim.o.cmdheight                 = 2
vim.o.wrap                      = false
vim.o.splitkeep                 = 'screen'
vim.o.linebreak                 = true
vim.o.numberwidth               = 2
vim.g.mapleader                 = ' ';
vim.o.signcolumn                = 'yes'
vim.o.listchars                 = 'space:⋅,tab:→ ' -- Display tabs
vim.o.inccommand                = 'split'
vim.o.lazyredraw                = true
vim.g.loaded_matchparen         = false
vim.o.colorcolumn               = "120"
vim.opt.shortmess = {
  t = true, -- truncate file messages at start
  A = true, -- ignore annoying swap file messages
  o = true, -- file-read message overwrites previous
  O = true, -- file-read message overwrites previous
  T = true, -- truncate non-file messages in middle
  f = true, -- (file x of x) instead of just (x of x
  F = true, -- Don't give file info when editing a file, NOTE: this breaks autocommand messages
  s = true,
  c = true,
  W = true, -- Don't show [w] or written when writing
}

vim.opt.shell = vim.fn.exepath('fish')

-- ftplugins reset 'formatoptions', so remove comment continuation after they run
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
  end,
})

-- Restore cursor position on file open (replaces remember.nvim)
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})
vim.o.title                     = true

vim.o.autoread                  = true
vim.wo.number                   = true
vim.o.relativenumber            = true
vim.o.encoding                  = 'utf-8'
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
vim.o.smarttab                  = true
vim.o.hidden                    = true
vim.bo.expandtab                = true
vim.bo.smartindent              = true
vim.o.smartindent               = true
vim.bo.shiftwidth               = 2
vim.o.shiftwidth                = 2
vim.o.showtabline               = 2
vim.o.tabstop                   = 2
vim.bo.tabstop                  = 2
vim.o.softtabstop               = 2
vim.bo.softtabstop              = 2
vim.o.autoindent                = true
vim.o.errorbells                = false
vim.wo.number                   = true
vim.o.undofile                  = true
-- vim.o.undodir                   = '~/.undodir
vim.o.compatible                = false
vim.wo.relativenumber           = true
vim.wo.cursorline               = true
vim.o.incsearch                 = true
vim.o.backspace                 = 'indent,eol,start'
vim.o.termguicolors             = true
vim.o.cmdheight                 = 2
vim.o.ttyfast                   = true
vim.o.wrap                      = false
vim.o.linebreak                 = true
vim.o.numberwidth               = 2
vim.g.mapleader                 = ' ';
vim.g.auto_save                 = 1
vim.o.signcolumn                = 'yes'
vim.g.indentLine_enabled        = 1
vim.wo.colorcolumn              = '99999'
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
if vim.fn.has('macunix') then
  vim.opt.shell = "/usr/local/bin/fish"
else
  vim.opt.shell = "/bin/fish"
end

vim.cmd('filetype plugin indent on') --- " Enables plugin & indent
vim.cmd([[
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab
  set autoindent
  set smartindent
  set title

  syntax enable
  syntax on
  set formatoptions-=c
  set formatoptions-=r
  set formatoptions-=o
]], '')

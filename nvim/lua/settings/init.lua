vim.o.autoread							= true
vim.wo.number           		= true
vim.o.relativenumber    		= true
vim.o.encoding          		= 'utf-8'
vim.o.fileencoding      		= 'utf-8'
vim.o.splitright        		= true
vim.o.clipboard         		= 'unnamed,unnamedplus'
vim.o.updatetime        		= 200
vim.o.timeoutlen        		= 300
vim.o.mouse             		= 'a'
vim.o.smartcase         		= true
vim.o.smarttab          		= true
vim.bo.expandtab        		= true
vim.bo.smartindent      		= true
vim.bo.shiftwidth       		= 2
vim.o.shiftwidth        		= 2
vim.o.showtabline       		= 2
vim.o.tabstop           		= 2
vim.bo.tabstop          		= 2
vim.o.softtabstop       		= 2
vim.bo.softtabstop      		= 2
vim.o.autoindent        		= true
vim.o.errorbells        		= false
vim.wo.number           		= true
vim.wo.relativenumber   		= true
vim.wo.cursorline       		= true
vim.o.incsearch         		= true
vim.o.backspace         		= 'indent,eol,start'
vim.o.termguicolors     		= true
vim.o.cmdheight         		= 2
vim.o.ttyfast           		= true
vim.o.numberwidth       		= 2
vim.g.mapleader							= ' ';
vim.g.auto_save							= 1
vim.wo.signcolumn						= 'yes'
vim.g.indentLine_enabled		= 1
vim.g.indentLine_char_list	= {'▏'}

vim.cmd [[
  set autoindent
  set expandtab
  set shiftwidth=2
  set smartindent
  set softtabstop=2
  set tabstop=2

  syntax enable
  syntax on
  set shortmess+=c
  set formatoptions-=c
  set formatoptions-=r
  set formatoptions-=o

  au FocusGained,BufEnter * :silent! !

  let g:vim_json_conceal=0
]]
--   au FocusLost,WinLeave * :silent! noautocmd w
vim.api.nvim_set_var('NERDSpaceDelims', 1)
vim.api.nvim_set_var('NERDCommentEmptyLines', 1)
vim.api.nvim_set_var('NERDTrimTrailingWhitespace', 1)
vim.api.nvim_set_var('NERDToggleCheckAllLines', 1)
vim.api.nvim_set_var('NERDCreateDefaultMappings', 0)
vim.api.nvim_set_var('NERDDefaultAlign', 'start')

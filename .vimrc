set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'scrooloose/nerdTree'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-function'
Plugin 'kana/vim-operator-user'
Plugin 'christoomey/vim-sort-motion'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-obsession'
Plugin 'SirVer/ultisnips'

call vundle#end()

filetype plugin indent on

nmap <silent> <F3> :NERDTreeToggle<CR>

let g:NERDTreeWinSize=30
autocmd BufEnter * silent! lcd %:p:h

set number  "Show line numbers
set relativenumber
nmap <leader>num :set nu! <CR>:set rnu!<CR>
set wrap  "enable wraping
set linebreak   "Break lines at word (requires Wrap lines)
set nolist         " list disables linebreak
set scrolloff=5         " 2 lines above/below cursor when scrolling
set noswapfile  " turn off swapfiles

syntax on

set showmatch   "Highlight matching brace
set showcmd     "Show command in bottom bar
set title       "Show file in titlebar
set autoindent  "Auto-indent new lines
set expandtab   "Use spaces instead of tabs
set smartindent "Enable smart-indent
set smarttab    "Enable smart-tabs
set hlsearch    "Highlight all search results
set smartcase   "Enable smart-case search
set cursorline  "Highlight current line
set hidden      "Remember undo after quitting

let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set background=dark

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_hightlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

" nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
" nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
" nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

" nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
" nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
" nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>

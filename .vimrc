set shell=/usr/bin/zsh

syntax on
let &t_ut='' "workaround for the background color issue on kitty terminal

set relativenumber
set nu
set showmatch
set showcmd
set title
set hidden
set tabstop=2 softtabstop=2
set shiftwidth=2
set autoindent
set expandtab
set smartindent
set smarttab
set smartcase
set undofile
set scrolloff=8
set incsearch
set cursorline

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
if has('nvim')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'

call plug#end()

filetype plugin indent on

if has('termguicolors')
   set termguicolors
endif

set background=dark
let g:gruvbox_material_background = 'hard'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_material_cursor = 'green'
let g:gruvbox_material_palette = 'mix'
let g:gruvbox_invert_selection='0'

colorscheme gruvbox-material
set synmaxcol=2048

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader=' '

let g:airline_theme = 'gruvbox_material'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_hightlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

" spacing
nnoremap <leader>m :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nnoremap <leader>t :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" better window nagivation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>ts :Rg<CR>

function! s:toggle_defx_explorer() abort
    exe "Defx -toggle -auto-cd -split=vertical -winwidth=30 -direction=topleft -search=`expand('%:p')` `getcwd()`"
endfunction

" defx
augroup vimrc_defx
  autocmd!
  autocmd FileType defx call s:defx_mappings()                                  "Defx mappings
  autocmd VimEnter * call s:setup_defx()
  autocmd BufEnter * let d = expand('%') | if isdirectory(d) | bd | call <sid>toggle_defx_explorer() | endif
augroup END
map <leader>n :call <sid>toggle_defx_explorer()<CR>
map <leader>fe :Defx -toggle -auto-cd -split=floating -search=`expand('%:p')` `getcwd()`<CR>

" navigation in the insert or command mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
nnoremap <leader>x "_x
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

" buffers 
nmap <leader>T :enew<CR>
nmap <C-L> :bnext<CR>
nmap <C-h> :bprevious<CR>
nmap <leader>bl :Buffers<CR>
nmap <leader>s :BLines<CR>
nmap <leader>S :Lines<CR>
map <C-s> :w<CR>
map <C-w>b :bp <BAR> bd! #<CR>

" FZF
nnoremap <C-p> :GFiles --cached --others<CR>
nnoremap <leader>pf :Files<CR>
if has("nvim")
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au FileType fzf tunmap <buffer> <Esc>
endif

command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <silent><expr> <C-space> coc#refresh()

" coc 
let g:coc_global_extensions = [
	\ 'coc-json',
	\ 'coc-rls',
	\ 'coc-go',
	\ 'coc-tsserver',
	\ 'coc-pairs',
	\ 'coc-tag',
	\ 'coc-clangd'
\ ]
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

"FuGITive
nmap <leader>gf :diffget //3<CR>
nmap <leader>gj :diffget //2<CR>
nmap <leader>gs :G<CR>

if &term =~ "xterm\\|rxvt\\|kitty\\"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif

function! s:setup_defx() abort
  silent! call defx#custom#option('_', {
        \ 'columns': s:default_columns,
        \ 'winwidth': 40,
        \ 'direction': 'topleft',
        \ 'split': 'vertical',
        \ 'ignored_files': '*.swp,.git',
        \ 'show_ignored_files': 0,
        \ 'toggle': 1,
        \ 'resume': 1
        \ })

  silent! call defx#custom#column('filename', {
        \ 'min_width': 80,
        \ 'max_width': 80,
        \ })

  " call s:defx_open({ 'dir': expand('<afile>') })
endfunction

function s:defx_toggle_tree() abort
  if defx#is_directory()
    return defx#do_action('open_or_close_tree')
  endif
  return defx#do_action('drop')
endfunction

function s:defx_open_tree() abort
  if defx#is_directory()
    return defx#do_action('open')
  endif
  return defx#do_action('drop')
endfunction

function! s:defx_mappings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ <sid>defx_toggle_tree()
  nnoremap <silent><buffer><expr> o
  \ <sid>defx_toggle_tree()
  nnoremap <silent><buffer><expr> O
  \ defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ <sid>defx_open_tree()
  nnoremap <silent><buffer><expr> s
  \ defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('preview')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
  nnoremap <silent><buffer><expr> <
  \ defx#do_action('resize', defx#get_context().winwidth - 10)
  nnoremap <silent><buffer><expr> >
  \ defx#do_action('resize', defx#get_context().winwidth + 10)
endfunction


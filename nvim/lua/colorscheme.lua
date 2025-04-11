local themes = require('themes')

themes.switchColorScheme('gruvbox-material-dark-lua')

vim.cmd([[
  hi LineNr guibg=NONE
  hi SignColumn guibg=NONE
  hi VertSplit guibg=#282c34
  hi EndOfBuffer guifg=#282c34
  hi CursorLineNr guifg=#EBA217

  hi GitSignsAdd guifg = #98c379 guibg = none
  hi GitSignsChange guifg = #fabd2f guibg = none
  hi GitSignsDelete guifg =#fb4934 guibg = none

  " LSP
  hi LspDiagnosticsUnderlineError guifg=#EB4917 gui=NONE
  hi LspDiagnosticsUnderlineWarning guifg=#EBA217 gui=NONE
  hi LspDiagnosticsUnderlineInformation guifg=#17D6EB, gui=NONE
  hi LspDiagnosticsUnderlineHint guifg=#17EB7A gui=NONE

  " set this value only on the dark background
  autocmd VimEnter * hi LspReferenceText  cterm=inverse ctermbg=242 guibg=#3c3b2a gui=NONE
  autocmd VimEnter * hi LspReferenceRead  cterm=inverse ctermbg=242 guibg=#3c3b2a gui=NONE
  autocmd VimEnter * hi LspReferenceWrite cterm=inverse ctermbg=242 guibg=#3c3b2a gui=NONE

  " hi DiffAdd                gui=NONE guifg=NONE guibg=#385634 
  " hi DiffChange             gui=NONE guifg=NONE guibg=#464c24 
  " hi DiffDelete             gui=NONE guifg=NONE guibg=#780e02
  " hi DiffText               gui=NONE guifg=NONE guibg=#725103
  " hi DiffviewDiffDelete     gui=NONE guifg=#878d96 guibg=NONE

  hi BufferCurrent          gui=NONE guifg=#98c379 guibg=NONE
]])

--   highlight LspDiagnosticsUnderlineError guifg=#EB4917 gui=undercurl
--   highlight LspDiagnosticsUnderlineWarning guifg=#EBA217 gui=undercurl
--   highlight LspDiagnosticsUnderlineInformation guifg=#17D6EB, gui=undercurl
--   highlight LspDiagnosticsUnderlineHint guifg=#17EB7A gui=undercurl

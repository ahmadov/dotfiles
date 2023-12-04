local themes = require('themes')

themes.switchColorScheme('gruvbox-dark-lua')

vim.cmd([[
  hi LineNr guibg=NONE
  hi SignColumn guibg=NONE
  hi VertSplit guibg=NONE
  hi EndOfBuffer guifg=#282c34

  hi GitSignsAdd guifg = #98c379 guibg = none
  hi GitSignsChange guifg = #fabd2f guibg = none
  hi GitSignsDelete guifg =#fb4934 guibg = none

  hi TelescopeBorder   guifg=#3e4451
  hi TelescopePromptBorder   guifg=#3e4451
  hi TelescopeResultsBorder  guifg=#3e4451
  hi TelescopePreviewBorder  guifg=#525865
  hi PmenuSel  guibg=#98c379

  " tree folder name , icon color
  hi NvimTreeFolderIcon guifg = #98c379
  hi NvimTreeFolderName guifg = #98c379
  hi NvimTreeIndentMarker guifg=#17D6EB
  
  " LSP
  highlight LspDiagnosticsUnderlineError guifg=#EB4917 gui=NONE
  highlight LspDiagnosticsUnderlineWarning guifg=#EBA217 gui=NONE
  highlight LspDiagnosticsUnderlineInformation guifg=#17D6EB, gui=NONE
  highlight LspDiagnosticsUnderlineHint guifg=#17EB7A gui=NONE

  autocmd VimEnter * hi LspReferenceText  cterm=inverse ctermbg=242 guibg=#3c3b2a gui=NONE
  autocmd VimEnter * hi LspReferenceRead  cterm=inverse ctermbg=242 guibg=#3c3b2a gui=NONE
  autocmd VimEnter * hi LspReferenceWrite cterm=inverse ctermbg=242 guibg=#3c3b2a gui=NONE
  " autocmd VimEnter * hi LspReferenceText cterm=inverse gui=NONE guibg=#3c3836
  " autocmd VimEnter * hi LspReferenceRead cterm=inverse gui=NONE guibg=#3c3836
  " autocmd VimEnter * hi LspReferenceWrite cterm=inverse gui=NONE guibg=#3c3836

  hi DiffAdd        gui=NONE guifg=NONE guibg=#385634 
  hi DiffChange     gui=NONE guifg=NONE guibg=#464c24 
  hi DiffDelete     gui=NONE guifg=NONE guibg=#780e02
  hi DiffText       gui=NONE guifg=NONE guibg=#725103

  hi DiffviewDiffDelete     gui=NONE guifg=#878d96 guibg=NONE
]])

--   highlight LspDiagnosticsUnderlineError guifg=#EB4917 gui=undercurl
--   highlight LspDiagnosticsUnderlineWarning guifg=#EBA217 gui=undercurl
--   highlight LspDiagnosticsUnderlineInformation guifg=#17D6EB, gui=undercurl
--   highlight LspDiagnosticsUnderlineHint guifg=#17EB7A gui=undercurl

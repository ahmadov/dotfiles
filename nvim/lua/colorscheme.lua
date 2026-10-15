local themes = require('themes')

-- Reapply after every theme switch, `:colorscheme` resets these
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    vim.cmd([[
      hi LineNr guibg=NONE
      hi SignColumn guibg=NONE
      hi WinSeparator guibg=#282c34
      hi EndOfBuffer guifg=#282c34
      hi CursorLineNr guifg=#EBA217

      hi GitSignsAdd guifg=#98c379 guibg=NONE
      hi GitSignsChange guifg=#fabd2f guibg=NONE
      hi GitSignsDelete guifg=#fb4934 guibg=NONE

      hi DiagnosticUnderlineError guifg=#EB4917
      hi DiagnosticUnderlineWarn guifg=#EBA217
      hi DiagnosticUnderlineInfo guifg=#17D6EB
      hi DiagnosticUnderlineHint guifg=#17EB7A

      hi BufferCurrent gui=NONE guifg=#98c379 guibg=NONE
    ]])
    if vim.o.background == 'dark' then
      for _, group in ipairs({ 'LspReferenceText', 'LspReferenceRead', 'LspReferenceWrite' }) do
        vim.api.nvim_set_hl(0, group, { bg = '#3c3b2a', ctermbg = 242, cterm = { reverse = true } })
      end
    end
  end,
})

themes.switchColorScheme('gruvbox-material-dark-lua')

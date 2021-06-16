-- vim.o.background = 'dark'
-- vim.api.nvim_set_var('gruvbox_invert_selection', 0)
-- vim.api.nvim_set_var('gruvbox_contrast_dark', 'hard')
-- vim.cmd([[colorscheme gruvbox]])

-- vim.cmd('syntax on')
-- local base16 = require('base16')
-- base16(base16.themes['onedark'], true)

local themes = require('themes')

themes.switchColorScheme('gruvbox-dark')

-- highlights
vim.cmd('hi LineNr guibg=NONE')
vim.cmd('hi SignColumn guibg=NONE')
vim.cmd('hi VertSplit guibg=NONE')
vim.cmd('hi EndOfBuffer guifg=#282c34')

vim.cmd([[
  hi GitSignsAdd guifg = #98c379 guibg = none
  hi GitSignsChange guifg = #fabd2f guibg = none
  hi GitSignsDelete guifg =#fb4934 guibg = none
]])

vim.cmd('hi TelescopeBorder   guifg=#3e4451')
vim.cmd('hi TelescopePromptBorder   guifg=#3e4451')
vim.cmd('hi TelescopeResultsBorder  guifg=#3e4451')
vim.cmd('hi TelescopePreviewBorder  guifg=#525865')
vim.cmd('hi PmenuSel  guibg=#98c379')

-- tree folder name , icon color
vim.cmd('hi NvimTreeFolderIcon guifg = #61afef')
vim.cmd('hi NvimTreeFolderName guifg = #61afef')
vim.cmd('hi NvimTreeIndentMarker guifg=#545862')

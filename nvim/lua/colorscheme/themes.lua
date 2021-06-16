local list = {}

list['gruvbox-dark'] = [[
  set background=dark
  let g:gruvbox_invert_selection = 0
  let g:gruvbox_contrast_dark = 'hard'
  colorscheme gruvbox
]]

list['everforest-dark'] = [[
  set background=dark
  let g:everforest_disable_italic_comment = 1
  let g:everforest_background = 'hard'
  let g:everforest_sign_column_background = 'none'
  let g:everforest_better_performance = 1
  colorscheme everforest
]]

list['gruvbox-mix-dark'] = [[
  set background=dark
  let g:gruvbox_material_background = 'medium'
  let g:gruvbox_material_palette = 'mix'
  let g:gruvbox_material_visual = 'grey background'
  let g:gruvbox_material_cursor = 'green'
  let g:gruvbox_material_disable_italic_comment = 1
  let g:gruvbox_material_sign_column_background = 'none'
  let g:gruvbox_material_statusline_style = "mix"
  let g:gruvbox_material_better_performance = 1
  colorscheme gruvbox-material
]]

local themes = {}

function themes.switchColorScheme(name)
  vim.cmd(list[name])
end

return themes

local list = {}

list['gruvbox-dark'] = [[
  set background=dark
  let g:gruvbox_invert_selection = 0
  let g:gruvbox_transparent_bg = 1
  let g:gruvbox_contrast_dark = 'hard'
  colorscheme gruvbox
]]

list['ayu-light'] = [[
  set background=light
  colorscheme ayu
]]

list['onebuddy-light'] = [[
  set background=light
  colorscheme onebuddy
]]

list['edge-light'] = [[
  let g:edge_style = 'neon'
  let g:edge_disable_italic_comment = 1
  let g:edge_background = 'hard'
  let g:edge_cursor = 'green'
  let g:edge_transparent_background = 0
  let g:edge_better_performance = 1
  let g:edge_ui_contrast = 'high'
  set background=light
  colorscheme edge
]]

list['everforest-light'] = [[
  let g:everforest_disable_italic_comment = 1
  let g:everforest_background = 'hard'
  let g:everforest_cursor = 'green'
  let g:everforest_transparent_background = 0
  let g:everforest_better_performance = 1
  let g:everforest_ui_contrast = 'high'
  set background=light
  colorscheme everforest
]]

list['everforest-dark'] = [[
  let g:everforest_disable_italic_comment = 1
  let g:everforest_background = 'hard'
  let g:everforest_cursor = 'green'
  let g:everforest_transparent_background = 0
  let g:everforest_better_performance = 1
  let g:everforest_ui_contrast = 'high'
  set background=dark
  colorscheme everforest
]]

list['gruvbox-material-light'] = [[
  let g:gruvbox_material_background = 'hard'
  let g:gruvbox_material_palette = 'mix'
  let g:gruvbox_material_visual = 'green background'
  let g:gruvbox_material_menu_selection_background = 'green'
  let g:gruvbox_material_cursor = 'orange'
  let g:gruvbox_material_disable_italic_comment = 1
  let g:gruvbox_material_sign_column_background = 'none'
  let g:gruvbox_material_statusline_style = 'material'
  let g:gruvbox_material_ui_contrast = 'high'
  let g:gruvbox_material_enable_bold = 1
  let g:gruvbox_material_better_performance = 1
  set background=light
  colorscheme gruvbox-material
]]

list['gruvbox-material-dark'] = [[
  let g:gruvbox_material_background = 'hard'
  let g:gruvbox_material_palette = 'material'
  let g:gruvbox_material_visual = 'green background'
  let g:gruvbox_material_menu_selection_background = 'green'
  let g:gruvbox_material_cursor = 'orange'
  let g:gruvbox_material_disable_italic_comment = 1
  let g:gruvbox_material_sign_column_background = 'none'
  let g:gruvbox_material_statusline_style = 'material'
  let g:gruvbox_material_ui_contrast = 'high'
  let g:gruvbox_material_enable_bold = 1
  let g:gruvbox_material_better_performance = 1
  set background=dark
  colorscheme gruvbox-material
]]

local themes = {}

function themes.switchColorScheme(name)
  vim.cmd(list[name])
end

return themes

local list = {}

list['gruvbox-dark'] = [[
  set background=dark
  let g:gruvbox_invert_selection = 0
  let g:gruvbox_transparent_bg = 1
  let g:gruvbox_contrast_dark = 'hard'
  colorscheme gruvbox
]]

list['onedark-darker-lua'] = function()
  require('onedark').setup({
      style = 'darker'
  })
  vim.o.background = 'dark'
  require('onedark').load()
end

list['onedark-deep-lua'] = function()
  require('onedark').setup({
      style = 'deep'
  })
  vim.o.background = 'dark'
  require('onedark').load()
end

list['onedark-warmer-lua'] = function()
  require('onedark').setup({
      style = 'warmer'
  })
  vim.o.background = 'dark'
  require('onedark').load()
end

list['gruvbox-baby-lua'] = function()
  vim.g.gruvbox_baby_telescope_theme = 1
  vim.g.gruvbox_baby_transparent_mode = 1
  vim.g.gruvbox_background_color = "#171717"
  vim.cmd("colorscheme gruvbox-baby")
end

list['material-lua'] = function()
  vim.g.material_style = "deep ocean"
  vim.cmd("colorscheme material")
end

list['gruvbox-dark-lua'] = function()
  local config = require("gruvbox").config
  require("gruvbox").setup({
    undercurl = true,
    underline = false,
    bold = true,
    italic = {
     strings = false,
     operators = false,
     comments = false,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = false, -- invert background for search, diffs, statuslines and errors
    invert = false, -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {
      dark0_hard = "#171717",
    },
    overrides = {
      -- GruvboxRed = { fg = "#fb4934" },
      -- GruvboxRedBold = { fg = "#fb4934", bold = config.bold },
      GruvboxGreen = { fg = "#a9b665" },
      GruvboxGreenBold = { fg = "#a9b665", bold = config.bold },
      -- GruvboxYellow = { fg = "#fabd2f" },
      -- GruvboxYellowBold = { fg = "#fabd2f", bold = config.bold },
      -- GruvboxBlue = { fg = "#7daea3" },
      -- GruvboxBlueBold = { fg = "#7daea3", bold = config.bold },
      -- GruvboxPurple = { fg = "#d3869b" },
      -- GruvboxPurpleBold = { fg = "#d3869b", bold = config.bold },
      GruvboxAqua = { fg = "#89b482" },
      GruvboxAquaBold = { fg = "#89b482", bold = config.bold },
      -- GruvboxOrange = { fg = "#fe8019" },
      -- GruvboxOrangeBold = { fg = "#fe8019", bold = config.bold },
      
      CursorLine = { bg = "#2f2f2f" },
      CursorLineNr = { link = "GruvboxGreen" },
      Identifier = { link = "GruvboxBlueBold" },
      Function = { link = "GruvboxGreen" },
      Statement = { link = "GruvboxRedBold" },
      Conditional = { link = "GruvboxRedBold" },
      Repeat = { link = "GruvboxRedBold" },
      Label = { link = "GruvboxRedBold" },
      Exception = { link = "GruvboxRedBold" },
      Keyword = { link = "GruvboxRedBold" },
      Operator = { link = "GruvboxOrangeBold" },
      Type = { link = "GruvboxYellowBold" },
      StorageClass = { link = "GruvboxOrangeBold" },
      SpecialChar = { link = "GruvboxRedBold" },
      Debug = { link = "GruvboxRedBold" },
      Visual = {bg = "#2a3c38"} -- #68948a opacity: 60%
    },
  });
  vim.cmd("colorscheme gruvbox")
end

list['ayu-light'] = [[
  set background=light
  colorscheme ayu
]]

list['onebuddy-light'] = [[
  set background=light
  colorscheme onebuddy
]]

list['edge-dark'] = [[
  let g:edge_style = 'neon'
  let g:edge_disable_italic_comment = 1
  let g:edge_background = 'hard'
  let g:edge_cursor = 'green'
  let g:edge_transparent_background = 2
  let g:edge_better_performance = 1
  let g:edge_ui_contrast = 'high'
  let g:edge_current_word = 'bold'
  set background=dark
  colorscheme edge
]]

list['edge-light'] = [[
  let g:edge_style = 'neon'
  let g:edge_disable_italic_comment = 1
  let g:edge_background = 'hard'
  let g:edge_cursor = 'green'
  let g:edge_transparent_background = 2
  let g:edge_better_performance = 1
  let g:edge_ui_contrast = 'high'
  let g:edge_current_word = 'bold'
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
  set background=dark
  let g:everforest_disable_italic_comment = 1
  let g:everforest_background = 'hard'
  let g:everforest_cursor = 'green'
  let g:everforest_transparent_background = 0
  let g:everforest_better_performance = 1
  let g:everforest_ui_contrast = 'high'
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
  set background=dark
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
  let g:gruvbox_material_diagnostic_line_highlight = 1
  let g:gruvbox_material_diagnostic_text_highlight = 1
  let g:gruvbox_material_disable_terminal_colors = 1
  colorscheme gruvbox-material
]]

local themes = {}

function themes.switchColorScheme(name)
  if name:sub(-string.len('-lua')) == '-lua' then
    list[name]()
  else
    vim.cmd(list[name])
  end
end

return themes

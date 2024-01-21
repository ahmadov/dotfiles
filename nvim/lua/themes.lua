local list = {}

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

list['everforest-dark-lua'] = function()
  vim.o.background = 'dark'
  require("everforest").setup({
    background = 'hard',
    dim_inactive_windows = true,
  })
  require("everforest").load()
end

list['everforest-light-lua'] = function()
  vim.o.background = 'light'
  require("everforest").setup({
    background = 'hard',
    dim_inactive_windows = true,
  })
  require("everforest").load()
end

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

list['gruvbox-material-dark-lua'] = function()
  vim.o.background = 'dark'
  vim.g.gruvbox_material_background = 'hard'
  vim.g.gruvbox_material_foreground = 'mix'
  vim.g.gruvbox_material_palette = 'mix'
  vim.g.gruvbox_material_visual = 'green background'
  vim.g.gruvbox_material_menu_selection_background = 'green'
  vim.g.gruvbox_material_cursor = 'orange'
  vim.g.gruvbox_material_disable_italic_comment = 1
  vim.g.gruvbox_material_sign_column_background = 'none'
  vim.g.gruvbox_material_statusline_style = 'material'
  vim.g.gruvbox_material_ui_contrast = 'high'
  vim.g.gruvbox_material_enable_bold = 1
  vim.g.gruvbox_material_better_performance = 1
  vim.g.gruvbox_material_diagnostic_line_highlight = 1
  vim.g.gruvbox_material_diagnostic_text_highlight = 1
  vim.g.gruvbox_material_disable_terminal_colors = 1
  vim.cmd([[
    let g:gruvbox_material_colors_override = { 'bg0': ['#1b1b1c', '234'] }
    colorscheme gruvbox-material
  ]])
end

local themes = {}

function themes.switchColorScheme(name)
  if name:sub(-string.len('-lua')) == '-lua' then
    list[name]()
  else
    vim.cmd(list[name])
  end
end

return themes

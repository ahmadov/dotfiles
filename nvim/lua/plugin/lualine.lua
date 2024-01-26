local M = {}

local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

function M.config()
  local get_git_root = function()
      local git_dir = require('utils').get_git_dir()
      if not git_dir then
          return ''
      end

      local git_root = git_dir:gsub('/.git/?$', '')
      return git_root:match '^.+/(.+)$'
  end

  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'edge',
      -- component_separators = { left = '', right = ''},
      -- section_separators = { left = '', right = ''},
      component_separators = '',
      section_separators = '',
      disabled_filetypes = {'packer', 'NvimTree', 'Outline', 'LspTrouble'},
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {{'filename', path = 1}},
      lualine_c = {'branch', 'diff', },
      lualine_d = {
        {
          'diagnostics',
          sources = { 'nvim_diagnostic' },
          symbols = { error = ' ', warn = ' ', info = ' ' },
          diagnostics_color = {
            color_error = { fg = colors.red },
            color_warn = { fg = colors.yellow },
            color_info = { fg = colors.cyan },
          },
        },
        {get_git_root}, 'encoding', 'filetype'},
      lualine_e = {'progress'},
      lualine_f = {'location'},
      -- lualine_z = { {"require('lsp-status').status()"}, },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {{'filename', path = 1}},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
  }
end

return M

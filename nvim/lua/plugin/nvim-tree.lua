local utils = require('utils')

local M = {}

function M.config()

  -- vim.g.nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ]
  vim.b.nvim_tree_gitignore = 1
  -- vim.g.nvim_tree_indent_markers = 1
  -- vim.g.nvim_tree_git_hl = 1
  -- vim.g.nvim_tree_root_folder_modifier = ':~'
  -- vim.g.nvim_tree_git_hl = 0

  -- vim.g.nvim_tree_show_icons = {
  --     git = 0,
  --     folders = 1,
  --     files = 1,
  --     folder_arrows = 1
  -- }

  -- vim.g.nvim_tree_icons = {
  --     default = ' ',
  --     symlink = ' ',
  --     git = {
  --         unstaged = '✗',
  --         staged = '✓',
  --         unmerged = '',
  --         renamed = '➜',
  --         untracked = '★'
  --     },
  -- }

  local get_lua_cb = function(cb_name)
      return string.format(":lua require('nvim-tree').on_keypress('%s')<CR>", cb_name)
  end

  function _G.toggle()
    if require('nvim-tree.view').win_open() then
       require('bufferline.state').set_offset(0)
       require('nvim-tree').close()
    else
       require('bufferline.state').set_offset(40, '')
       require('nvim-tree').find_file(true)
    end
  end

  require('nvim-tree').setup({
    auto_reload_on_write = true,
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    -- auto_close          = true,
    open_on_tab         = false,
    update_cwd          = false,
    hijack_cursor       = false,
    -- hide_dotfiles       = true,
    renderer = {
      indent_markers = {
        enable = true,
      },
    },
    actions = {
      change_dir = {
        enable = false,
        global = false,
      },
      open_file = {
        quit_on_open = false,
        resize_window = false,
        window_picker = {
          enable = true,
          chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          exclude = {
            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", },
            buftype  = { "nofile", "terminal", "help", },
          }
        }
      },
    },
    git = {
      enable = false,
      ignore = true,
      timeout = 400 -- (in ms)
    },
    diagnostics = {
      enable = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    filters = {
      dotfiles = false,
      custom = { ".git", "node_modules", ".cache" },
    },
    update_focused_file = {
      enable      = true,
      update_cwd  = true,
      ignore_list = { ".git", "node_modules", ".cache" },
    },
    system_open = {
      cmd  = nil,
      args = {}
    },
    view = {
      width = 35,
      side = 'left',
      -- auto_resize = false,
      preserve_window_proportions = false,
      hide_root_folder = false,
      number = false,
      relativenumber = false,
      signcolumn = 'yes',
      mappings = {
        custom_only = false,
        list = {}
      }
    }
  })

  -- Mappings for nvimtree
  utils.map(
      'n',
      '<C-n>',
      ':NvimTreeToggle<CR>',
      -- 'v:lua toggle()<CR>',
      {
          noremap = true,
          silent = true
      }
  )

  -- vim.g.nvim_tree_bindings = {
  --     ['<CR>'] = get_lua_cb('edit'),
  --     ['o'] = get_lua_cb('edit'),
  --     ['l'] = get_lua_cb('edit'),
  --     ['<2-LeftMouse>'] = get_lua_cb('edit'),
  --     ['<2-RightMouse>'] = get_lua_cb('cd'),
  --     ['<C-]>'] = get_lua_cb('cd'),
  --     ['<C-v>'] = get_lua_cb('vsplit'),
  --     ['<C-x>'] = get_lua_cb('split'),
  --     ['<C-t>'] = get_lua_cb('tabnew'),
  --     ['h'] = get_lua_cb('close_node'),
  --     ['<S-CR>'] = get_lua_cb('close_node'),
  --     ['<Tab>'] = get_lua_cb('preview'),
  --     ['I'] = get_lua_cb('toggle_ignored'),
  --     ['.'] = get_lua_cb('toggle_dotfiles'),
  --     ['R'] = get_lua_cb('refresh'),
  --     ['a'] = get_lua_cb('create'),
  --     ['d'] = get_lua_cb('remove'),
  --     ['r'] = get_lua_cb('rename'),
  --     ['<C-r>'] = get_lua_cb('full_rename'),
  --     ['x'] = get_lua_cb('cut'),
  --     ['c'] = get_lua_cb('copy'),
  --     ['p'] = get_lua_cb('paste'),
  --     ['[c'] = get_lua_cb('prev_git_item'),
  --     [']c'] = get_lua_cb('next_git_item'),
  --     ['-'] = get_lua_cb('dir_up'),
  --     ['q'] = get_lua_cb('close')
  -- }
  --
  vim.cmd([[
    hi link NvimTreeIndentMarker Whitespace
    hi link NvimTreeFolderIcon NonText
  ]])

  -- lazy-loading
  require('nvim-tree.events').on_nvim_tree_ready(function()
      vim.cmd 'NvimTreeRefresh'
  end)
end

return M

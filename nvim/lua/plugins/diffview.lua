local cb = require('diffview.config').diffview_callback
local M = {}

function M.config()
  local G = {}
  require('diffview').setup {
    diff_binaries = false,    -- Show diffs for binaries
    file_panel = {
      width = 35,
    },
    key_bindings = {
      view = {
        ['q']             = "<cmd>DiffviewClose<CR>",
        ['<esc>']         = "<cmd>DiffviewClose<CR>",
      },
      file_panel = {
        ['q']             = "<cmd>DiffviewClose<CR>",
        ['<esc>']         = "<cmd>DiffviewClose<CR>",
        ['<space>']       = cb('select_entry')
      }
      -- The `view` bindings are active in the diff buffers, only when the current
      -- tabpage is a Diffview.
      -- view = {
      --   ['<tab>']     = cb('select_next_entry'),  -- Open the diff for the next file 
      --   ['<s-tab>']   = cb('select_prev_entry'),  -- Open the diff for the previous file
      --   ['<leader>e'] = cb('focus_files'),        -- Bring focus to the files panel
      --   ['<leader>b'] = cb('toggle_files'),       -- Toggle the files panel.
      -- },
      -- file_panel = {
      --   ['j']             = cb('next_entry'),         -- Bring the cursor to the next file entry
      --   ['<down>']        = cb('next_entry'),
      --   ['k']             = cb('prev_entry'),         -- Bring the cursor to the previous file entry.
      --   ['<up>']          = cb('prev_entry'),
      --   ['<cr>']          = cb('select_entry'),       -- Open the diff for the selected entry.
      --   ['o']             = cb('select_entry'),
      --   ['<2-LeftMouse>'] = cb('select_entry'),
      --   ['-']             = cb('toggle_stage_entry'), -- Stage / unstage the selected entry.
      --   ['S']             = cb('stage_all'),          -- Stage all entries.
      --   ['U']             = cb('unstage_all'),        -- Unstage all entries.
      --   ['X']             = cb('restore_entry'),      -- Restore entry to the state on the left side.
      --   ['R']             = cb('refresh_files'),      -- Update stats and entries in the file list.
      --   ['<tab>']         = cb('select_next_entry'),
      --   ['<s-tab>']       = cb('select_prev_entry'),
      --   ['<leader>e']     = cb('focus_files'),
      --   ['<leader>b']     = cb('toggle_files'),
      -- }
    }
  }

  function G.apply_diff_tweaks()
    local StandardView = require('diffview.views.standard.standard_view').StandardView
    vim.schedule(function ()
      local view = require('diffview.lib').get_current_view()
      if view and view:instanceof(StandardView) then
        local curhl = vim.wo[view.left_winid].winhl
        vim.wo[view.left_winid].winhl = table.concat({
            "DiffAdd:DiffAddAsDelete",
            curhl ~= "" and curhl or nil
          }, ",")
      end
    end)
  end

  vim.api.nvim_exec([[
    hi! def DiffAddAsDelete guibg=#3C2C3C
    augroup diffview_config
      au!
      au TabNew * lua DiffviewConfig.apply_diff_tweaks()
    augroup END
  ]], false)

  _G.DiffviewConfig = G
end

return M


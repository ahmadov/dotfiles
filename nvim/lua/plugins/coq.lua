local M = {}

function M.config()
  vim.g.coq_settings = {
    auto_start = 'shut-up',
    display = {
      ghost_text = {
        enabled = false,
      },
      pum = {
        fast_close = false,
      },
      preview = {
        x_max_len = 100,
        -- resolve_timeout = 0.09,
        positions = { east = 1, south = 2, north = 3, west = 4 }
      }
    },
    keymap = {
      jump_to_mark = '<C-\\>'
    },
    clients = {
      tabnine = {
        enabled = false
      },
      tags = {
        enabled = false
      }
    }
  }
end

return M

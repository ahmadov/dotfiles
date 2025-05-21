local M = {}

function M.config()
  local osys = require("cmake-tools.osys")
  local cmake = require('cmake-tools')

  cmake.setup({
    cmake_build_directory = function()
      return "build/${variant:buildType}"
    end,
    cmake_use_preset = true,
    cmake_regenerate_on_save = false,
    cmake_dap_configuration = {
      name = "cpp",
      type = "codelldb",
      request = "launch",
      stopOnEntry = false,
      runInTerminal = true,
      console = "integratedTerminal",
    },
    cmake_notifications = {
      runner = { enabled = false },
      executor = { enabled = false },
    },
    cmake_executor = {
      name = "toggleterm",
      default_opts = {
        toggleterm = {
          direction = "horizontal",
          close_on_exit = false,
          auto_scroll = true,
          focus = false,
          singleton = true,
        },
      }
    },
    cmake_runner = {
      name = "toggleterm",
      default_opts = {
        toggleterm = {
          direction = "horizontal",
          close_on_exit = false,
          auto_scroll = true,
          focus = false,
          singleton = true,
        },
      }
    },
  })
end

return M

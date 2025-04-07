local M = {}

function M.config()
  local osys = require("cmake-tools.osys")
  require('cmake-tools').setup({
    cmake_build_directory = function()
      return "build/${variant:buildType}"
    end,
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
      spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
      refresh_rate_ms = 100, -- how often to iterate icons
    },
    cmake_runner = {
      opts = {
        quickfix = {
          auto_close_when_success = false,
          position = "bottom",
        },
      },
    },
    cmake_executor = {
      opts = {
        quickfix = {
          auto_close_when_success = false,
          position = "bottom",
        },
      },
    }
  })
end

return M

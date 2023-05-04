local M = {}

function M.config()
  local path = require('plenary.path')
  require('cmake').setup({
    build_dir = tostring(path:new('{cwd}', 'build', 'Debug')),
    -- configure_args = { '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1', '-G', 'Ninja' },
    configure_args = { '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1' },
    quickfix_height = 15,
    dap_configurations = {
      codelldb = {
        type = 'codelldb',
        request = 'launch',
        stopOnEntry = false,
        runInTerminal = false,
      }
    }, 
    dap_configuration = 'codelldb',
    dap_open_command = require('dapui').open
  })

  -- vim.api.nvim_command('command! -complete=file -nargs=+ Lldb lua require("utils").debug_lldb(<f-args>)')
end

return M

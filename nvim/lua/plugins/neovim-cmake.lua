local path = require('plenary.path')
local M = {}

function M.config()
  require('cmake').setup({
    build_dir = tostring(path:new('{cwd}', 'build', '')),
    configure_args = { '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1', '-G', 'Ninja' },
    -- configure_args = { '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1' },
    quickfix_height = 15,
    dap_open_command = require('dapui').open,
  })

  vim.api.nvim_command('command! -complete=file -nargs=+ Lldb lua require("utils").debug_lldb(<f-args>)')
end

return M

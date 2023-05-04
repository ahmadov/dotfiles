local M = {}

function M.config()
  vim.cmd([[
    let g:cmake_generate_options = [ '-DCMAKE_EXPORT_COMPILE_COMMANDS=ON' ]
  ]])
  -- let g:cmake_generate_options = [ '-GNinja', '-DCMAKE_EXPORT_COMPILE_COMMANDS=ON' ]
end

return M

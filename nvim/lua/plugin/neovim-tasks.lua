local path = require('plenary.path')
local tasks = require('tasks')
local dapui = require('dapui')

local M = {}

function M.config()
  tasks.setup({
    default_params = {
      cmake = {
        build_dir = tostring(path:new('{cwd}', 'build', '{build_type}')),
        build_type = 'Debug',
        args = {
          configure = { '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1', '-G', 'Ninja'}
        },
        dap_name = 'lldb',
      },
    },
    quickfix = {
      height = 15,
    },
    dap_open_command = dapui.open
  })

  vim.keymap.set({ '', 'i' }, '<C-BS>', function()
    tasks.cancel()
    dapui.close()
  end, { noremap = true, desc = 'Cancel last task' })

  local key_index = 5
  for _, task_name in ipairs({ 'debug' }) do
    vim.keymap.set({ '', 'i' }, string.format('<F%d>', key_index), function() tasks.start('auto', task_name) end, { noremap = true, desc = string.format('Run %s task', task_name) })
    vim.keymap.set(
      { '', 'i' },
      string.format('<A-a>', key_index),
      function() tasks.set_task_param('auto', task_name, 'args') end,
      { noremap = true, desc = string.format('Set args for %s task', task_name) }
    )
    vim.keymap.set(
      { '', 'i' },
      string.format('<A-e>', key_index),
      function() tasks.set_task_param('auto', task_name, 'env') end,
      { noremap = true, desc = string.format('Set env for %s task', task_name) }
    )
    key_index = key_index + 1
  end

  vim.keymap.set({ '', 'i' }, '<leader>cs', function() tasks.set_module_param('auto', 'target') end, { noremap = true, desc = 'Select CMake target' })
  vim.keymap.set({ '', 'i' }, '<leader>ct', function() tasks.set_module_param('auto', 'build_type') end, { noremap = true, desc = 'Select CMake build type' })
  vim.keymap.set({ '', 'i' }, '<leader>cr', function() tasks.start('auto', 'run') end, { noremap = true, desc = 'Run CMake target' })
  vim.keymap.set({ '', 'i' }, '<leader>cd', function() tasks.start('auto', 'debug') end, { noremap = true, desc = 'Debug CMake target' })
  vim.keymap.set({ '', 'i' }, '<leader>cb', function() tasks.start('auto', 'build') end, { noremap = true, desc = 'Build CMake target' })
  vim.keymap.set({ '', 'i' }, '<leader>cB', function() tasks.start('auto', 'build_all') end, { noremap = true, desc = 'Build all CMake targets' })

  vim.keymap.set({ '', 'i' }, '<leader>cg', function() tasks.start('auto', 'configure') end, { noremap = true, desc = 'Run CMake configure task' })
  vim.keymap.set({ '', 'i' }, '<S-F9>', function() tasks.start('auto', 'clippy') end, { noremap = true, desc = 'Run Cargo clippy task' })
  vim.keymap.set({ '', 'i' }, '<A-F9>', function() tasks.start('auto', 'clean') end, { noremap = true, desc = 'Run CMake clean task' })
  -- vim.api.nvim_command('command! -complete=file -nargs=+ Lldb lua require("utils").debug_lldb(<f-args>)')
end

return M

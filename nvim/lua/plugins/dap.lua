local M = {}

function M.config()
  require("dapui").setup({
    sidebar = {
      size = 55,
      position = 'right',
    },
    tray = {
      size = 15,
    },
  })

  local dap = require('dap')

  dap.adapters.cpp = {
    type = 'executable',
    attach = {
      pidProperty = 'pid',
      pidSelect = 'ask',
    },
    command = 'lldb-vscode',
    env = {
      LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = 'YES',
    },
    name = 'lldb',
  }

  require("nvim-dap-virtual-text").setup()

  vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticError' })
  vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DiagnosticInfo' })
  vim.fn.sign_define('DapStopped', { text = '', texthl = 'Constant' })
  vim.fn.sign_define('DapBreakpointRejected', { text = '' })

  vim.api.nvim_set_keymap('n', '<A-b>', '<Cmd>lua require("dap").toggle_breakpoint()<CR>', { noremap = true })

  vim.api.nvim_set_keymap('n', '<A-o>', '<Cmd>lua require("dap").step_over()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('i', '<A-o>', '<Cmd>lua require("dap").step_over()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('v', '<A-o>', '<Cmd>lua require("dap").step_over()<CR>', { noremap = true })

  vim.api.nvim_set_keymap('n', '<A-i>', '<Cmd>lua require("dap").step_into()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('i', '<A-i>', '<Cmd>lua require("dap").step_into()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('v', '<A-i>', '<Cmd>lua require("dap").step_into()<CR>', { noremap = true })

  vim.api.nvim_set_keymap('n', '<A-u>', '<Cmd>lua require("dap").step_out()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('i', '<A-u>', '<Cmd>lua require("dap").step_out()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('v', '<A-u>', '<Cmd>lua require("dap").step_out()<CR>', { noremap = true })

  vim.api.nvim_set_keymap('n', '<A-c>', '<Cmd>lua require("dap").continue()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('i', '<A-c>', '<Cmd>lua require("dap").continue()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('v', '<A-c>', '<Cmd>lua require("dap").continue()<CR>', { noremap = true })

  vim.api.nvim_set_keymap('n', '<A-d>', '<Cmd>lua require("dapui").toggle()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('i', '<A-d>', '<Cmd>lua require("dapui").toggle()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('v', '<A-d>', '<Cmd>lua require("dapui").toggle()<CR>', { noremap = true })

  vim.api.nvim_set_keymap('n', '<A-s>', '<Cmd>ClangdSwitchSourceHeader<CR>', { noremap = true })
  vim.api.nvim_set_keymap('i', '<A-s>', '<Cmd>ClangdSwitchSourceHeader<CR>', { noremap = true })
  vim.api.nvim_set_keymap('v', '<A-s>', '<Cmd>ClangdSwitchSourceHeader<CR>', { noremap = true })

  vim.api.nvim_set_keymap("n", "<A-f>", [[ <Cmd>lua require('dapui').float_element()<CR>]], { noremap = true })

  vim.api.nvim_set_keymap('n', '<A-BS>', '<Cmd>lua require("dapui").close(); require("dap").terminate()<CR><Cmd>DapVirtualTextForceRefresh<CR>', { noremap = true })
  vim.api.nvim_set_keymap('i', '<A-BS>', '<Cmd>lua require("dapui").close(); require("dap").terminate()<CR><Cmd>DapVirtualTextForceRefresh<CR>', { noremap = true })
  vim.api.nvim_set_keymap('v', '<A-BS>', '<Cmd>lua require("dapui").close(); require("dap").terminate()<CR><Cmd>DapVirtualTextForceRefresh<CR>', { noremap = true })

  vim.api.nvim_set_keymap('n', '<A-l>', '<Cmd>lua require("dapui").eval()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('v', '<A-l>', '<Cmd>lua require("dapui").eval()<CR>', { noremap = true })

end

return M

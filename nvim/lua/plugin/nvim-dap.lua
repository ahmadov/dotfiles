local dap = require('dap')
local dapui = require('dapui')
local dap_virtual_text = require('nvim-dap-virtual-text')

local M = {}

function M.config()
  dap.set_log_level('INFO') -- Helps when configuring DAP, see logs with :DapShowLog
  dapui.setup({
    mappings = {
      expand = "<Tab>",
    },
    layouts = {
      {
        elements = { {
            id = "watches",
            size = 0.2
          }, {
            id = "breakpoints",
            size = 0.2
          }, {
            id = "stacks",
            size = 0.3
          }, {
            id = "scopes",
            size = 0.3
          } },
        position = "left",
        size = 40
      }
    },
  })
  dap_virtual_text.setup()

  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd(), 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {}
    },
  }
  dap.configurations.c = dap.configurations.cpp

  dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
      command = '/Users/ahmadov/.local/share/nvim/mason/bin/codelldb',
      args = {"--port", "${port}"},
    },
    name = 'codelldb'
  }

  dap.adapters.lldb = {
    name = 'lldb',
    type = 'executable',
    attach = {
      pidProperty = 'pid',
      pidSelect = 'ask',
    },
    command = 'lldb-dap',
    env = {
      LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = 'YES',
    },
  }

  vim.api.nvim_create_user_command('Lldb',
    function(command)
      local config = {
        name = command.fargs[1],
        type = 'lldb',
        request = 'launch',
        program = command.fargs[1],
        args = { vim.list_slice(command.fargs, 2, vim.tbl_count(command.fargs)) },
        cwd = '${workspaceFolder}',
      }
      dap.run(config)
    end,
    { nargs = '+', complete = 'file', desc = 'Run command in lldb' }
  )
  vim.api.nvim_create_user_command('Codelldb',
    function(command)
      local config = {
        name = command.fargs[1],
        type = 'codelldb',
        request = 'launch',
        program = command.fargs[1],
        args = vim.list_slice(command.fargs, 2, vim.tbl_count(command.fargs)),
        cwd = '${workspaceFolder}',
      }
      dap.run(config)
    end,
    { nargs = '+', complete = 'file', desc = 'Run command in Codelldb' }
  )

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

  vim.api.nvim_set_keymap('n', '<A-v>', '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('i', '<A-v>', '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('v', '<A-v>', '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { noremap = true })

  vim.api.nvim_set_keymap("n", "<A-f>", [[ <Cmd>lua require('dapui').float_element()<CR>]], { noremap = true })

  vim.api.nvim_set_keymap('n', '<A-BS>', '<Cmd>lua require("dapui").close(); require("dap").terminate()<CR><Cmd>DapVirtualTextForceRefresh<CR>', { noremap = true })
  vim.api.nvim_set_keymap('i', '<A-BS>', '<Cmd>lua require("dapui").close(); require("dap").terminate()<CR><Cmd>DapVirtualTextForceRefresh<CR>', { noremap = true })
  vim.api.nvim_set_keymap('v', '<A-BS>', '<Cmd>lua require("dapui").close(); require("dap").terminate()<CR><Cmd>DapVirtualTextForceRefresh<CR>', { noremap = true })

  vim.keymap.set("n", "<A-/>", function() dapui.eval(nil, { enter = true }) end)

  dap.listeners.before.attach.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.launch.dapui_config = function()
    dapui.open()
  end
  -- dap.listeners.before.event_terminated.dapui_config = function()
  --   dapui.close()
  -- end
  -- dap.listeners.before.event_exited.dapui_config = function()
  --   dapui.close()
  -- end
end

return M

local dap = require('dap')
local dapui = require('dapui')
local dap_virtual_text = require('nvim-dap-virtual-text')

local M = {}

function M.config()
  dap.set_log_level('INFO') -- Helps when configuring DAP, see logs with :DapShowLog
  dapui.setup({
    mappings = {
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
      toggle = "t",
    },
    expand_lines = vim.fn.has("nvim-0.7"),
    layouts = {
      {
        elements = {
          'scopes',
          'breakpoints',
          'stacks',
          'watches',
        },
        size = 55,
        position = 'right',
      },
      {
        elements = {
          'repl',
          'console',
        },
        size = 15,
        position = 'bottom',
      },
    },
    floating = {
      max_height = nil,
      max_width = nil,
      border = "single",
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    windows = { indent = 1 },
    render = {
      max_type_length = nil,
    },
  })
  dap_virtual_text.setup()

  dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
      command = '~/git/codelldb/extension/adapter/codelldb',
      args = {"--port", "${port}"},
    }
  }

  dap.adapters.lldb = {
    type = 'executable',
    attach = {
      pidProperty = 'pid',
      pidSelect = 'ask',
    },
    command = 'lldb-vscode-14',
    env = {
      LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = 'YES',
    },
    name = 'lldb',
  }

  vim.api.nvim_create_user_command('Lldb',
    function(command)
      local config = {
        type = 'lldb',
        name = command.fargs[1],
        request = 'launch',
        program = command.fargs[1],
        args = { vim.list_slice(command.fargs, 2, vim.tbl_count(command.fargs)) },
      }
      dap.run(config)
      dap.repl.open()
    end,
    { nargs = '+', complete = 'file', desc = 'Run command in LLDB' }
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

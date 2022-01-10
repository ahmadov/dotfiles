local lsp = require('plugins.lsp')
local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')
local coq = require('coq')

lspconfig.ccls.setup{
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities,
  cmd = {"ccls"},
  root_dir = lspconfig.util.root_pattern('compile_commands.json', 'compile_flags.txt', '.git', 'CMakeLists.txt', 'Makefile'),
  filetypes = {'c', 'cpp', 'cc', 'objc', 'objcpp'},
}

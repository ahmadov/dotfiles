local lsp = require('plugin.lsp')
local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')
local configs = require('lspconfig.configs')
local coq = require('coq')

lspconfig.ccls.setup{
  on_attach = lsp.on_attach,
  capabilities = vim.tbl_extend("keep", lsp.capabilities, lsp_status.capabilities),
  handlers = lsp_status.extensions.clangd.setup(),
  cmd = {"ccls"},
  root_dir = lspconfig.util.root_pattern('compile_commands.json', 'compile_flags.txt', '.git', 'CMakeLists.txt', 'Makefile'),
  filetypes = {'c', 'cpp', 'cc', 'objc', 'objcpp'},
}

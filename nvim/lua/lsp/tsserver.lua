local lsp = require('plugins.lsp')
local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')

lspconfig.tsserver.setup{
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities,
}

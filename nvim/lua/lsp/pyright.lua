local lsp = require('plugin.lsp')
local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')

lspconfig.pyright.setup{
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities,
}

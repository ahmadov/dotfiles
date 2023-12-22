local lsp = require('plugin.lsp')
local lspconfig = require('lspconfig')

lspconfig.rust_analyzer.setup({
  root_dir = lspconfig.util.root_pattern('Cargo.toml'),
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities,
})

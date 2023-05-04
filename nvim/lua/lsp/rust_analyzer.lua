local lsp = require('plugin.lsp')
local lspconfig = require('lspconfig')
local coq = require('coq')

lspconfig.rust_analyzer.setup(
  coq.lsp_ensure_capabilities({
    root_dir = lspconfig.util.root_pattern('Cargo.toml'),
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
  })
)

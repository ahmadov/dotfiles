local lsp = require('lsp')

local M = {}

function M.setup()
  vim.lsp.config('rust_analyzer', {
    root_markers = { 'Cargo.toml', '.git' },
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
  })

  vim.lsp.enable('rust_analyzer')
end

return M

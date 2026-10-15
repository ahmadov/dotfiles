local M = {}

-- Built-in `grr`, `gri`, `gra`, ... would make `gr` below wait for 'timeoutlen'
for _, map in ipairs(vim.api.nvim_get_keymap('n')) do
  if map.lhs:match('^gr.$') then
    vim.keymap.del('n', map.lhs)
  end
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local function map(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, silent = true })
    end
    local telescope = function(picker)
      return function() require('telescope.builtin')[picker]() end
    end

    map('n', 'gd', telescope('lsp_definitions'))
    map('n', 'gr', telescope('lsp_references'))
    map('n', 'gi', telescope('lsp_implementations'))
    map('n', '<A-g>', telescope('lsp_document_symbols'))
    map('n', '<leader>ci', telescope('lsp_incoming_calls'))
    map('n', 'gt', vim.lsp.buf.type_definition)
    map('n', '<C-k>', vim.lsp.buf.signature_help)
    map('n', '<leader>L', vim.diagnostic.open_float)
    map({ 'n', 'x' }, '<leader>a', vim.lsp.buf.code_action)
    map('n', '<leader>i', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }), { bufnr = args.buf })
    end)
  end,
})

vim.diagnostic.config({
  virtual_text = false,
  underline = false,
  signs = true,
  update_in_insert = true,
  -- Used by the built-in `[d` and `]d`
  jump = {
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float({ bufnr = bufnr, scope = 'cursor', focus = false })
    end,
  },
})

function M.setup()
  require('mason').setup()
  require('mason-lspconfig').setup({ ensure_installed = { 'clangd' } })

  require('lsp.clangd').setup()
  require('lsp.intelephense').setup()
end

return M

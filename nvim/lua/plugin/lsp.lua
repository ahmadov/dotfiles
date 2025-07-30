local mason_lspconfig = require('mason-lspconfig')
local aerial = require('aerial')
local utils = require('utils')
-- local nvim_cmp = require('cmp_nvim_lsp');
local blink = require('blink.cmp');


function on_attach(client, bufnr)
  client.server_capabilities.semanticTokensProvider = nil

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- aerial.on_attach(_, bufnr);
  require('illuminate').on_attach(client)
  -- Aerial does not set any mappings by default, so you'll want to set some up
  -- Toggle the aerial window with <leader>o
  utils.buf_map(bufnr, 'n', '<leader>o', '<cmd>AerialToggle<CR>', {})
  -- Jump forwards/backwards with '[[' and ']]'
  utils.buf_map(bufnr, 'n', '[[', '<cmd>AerialPrev<CR>', {})
  utils.buf_map(bufnr, 'n', ']]', '<cmd>AerialNext<CR>', {})

  local opts = {noremap = true, silent = true}
  utils.map('n', 'gd', "<Cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
  utils.map('n', 'gr', "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
  utils.map('n', 'gi', "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", opts)
  -- utils.map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  utils.map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  utils.map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- utils.map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) -- until renamer.nvim fixes the issue
  -- utils.map('v', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) -- until renamer.nvim fixes the issue
  -- utils.map('i', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) -- until renamer.nvim fixes the issue
  utils.map('n', '<leader>L', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  utils.map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  utils.map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  utils.map('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  utils.map('x', '<leader>a', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)

  -- lspsaga
  -- utils.map('n', '<C-k>',  "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
  -- utils.map('n', 'gr',  "<cmd>lua require('lspsaga.provider').lsp_finder()<CR>", opts)


  -- Telescope LSP
  utils.map('n', '<A-g>', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", opts)
  utils.map('n', '<leader>i', "<cmd>lua require('telescope.builtin').lsp_incoming_calls()<CR>", opts)

  utils.map('n', ']g', "<cmd>lua require('gitsigns.actions').next_hunk()<CR>", opts)
  utils.map('n', '[g', "<cmd>lua require('gitsigns.actions').prev_hunk()<CR>", opts)
  utils.map('n', '<leader>hs', "<cmd>lua require('gitsigns.actions').stage_hunk()<CR>", opts)
  utils.map('v', '<leader>hs', "<cmd>lua require('gitsigns.actions').stage_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>", opts)
  utils.map('n', '<leader>hu', "<cmd>lua require('gitsigns.actions').undo_stage_hunk()<CR>", opts)
  utils.map('n', '<leader>hr', "<cmd>lua require('gitsigns.actions').reset_hunk()<CR>", opts)
  utils.map('v', '<leader>hr', "<cmd>lua require('gitsigns.actions').reset_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>", opts)
  utils.map('n', '<leader>hp', "<cmd>lua require('gitsigns.actions').preview_hunk()<CR>", opts)
  utils.map('n', '<leader>hb', "<cmd>lua require('gitsigns.actions').blame_line()<CR>", opts)

  -- utils.map('n', '<leader>d', "<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>", opts)
  -- utils.map('n', '[d', "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>", opts)
  -- utils.map('n', ']d', "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>", opts)
  
  -- Inlay hints
  vim.lsp.inlay_hint.enable(false)
  utils.map('n', '<leader>i', '<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({0}),{0})<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local capabilities = nvim_cmp.default_capabilities(capabilities)
capabilities = vim.tbl_deep_extend('force', capabilities, blink.get_lsp_capabilities({}, false))

capabilities.textDocument.semanticHighlighting = true
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

vim.diagnostic.config({
  virtual_text = false, -- Turn off inline diagnostics
  underline = false,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

local M = {}

M.on_attach = on_attach
M.capabilities = capabilities

function M.config()
  mason_lspconfig.setup({ ensure_installed = {'clangd', 'cmake', 'rust_analyzer'} })

  require('lsp.clangd');
  require('lsp.intelephense');
  require('lsp.rust_analyzer');
end

return M

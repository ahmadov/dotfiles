vim.cmd([[packadd nvim-lspconfig]])
local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')
local configs = require('lspconfig.configs')
local aerial = require('aerial')
local utils = require('utils')
local coq = require('coq')

lsp_status.config({
  status_symbol = '',
  current_function = false,
  diagnostics = false, -- Will be displayed via lualine
})
lsp_status.register_progress()

function on_attach(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  aerial.on_attach(_, bufnr);
  lsp_status.on_attach(_)
  require('illuminate').on_attach(_)
  utils.buf_map(bufnr, 'n', '<leader>o', '<cmd>AerialToggle<CR>', {})
  -- Jump forwards/backwards with '[[' and ']]'
  utils.buf_map(bufnr, 'n', '[[', '<cmd>AerialPrev<CR>', {})
  utils.buf_map(bufnr, 'n', ']]', '<cmd>AerialNext<CR>', {})

  local opts = {noremap = true, silent = true}
  utils.map('n', 'gd', "<Cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
  utils.map('n', 'gr', "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
  utils.map('n', 'gi', "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", opts)
  utils.map('n', '<leader>a', "<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>", opts)
  utils.map('v', '<leader>a', ":<C-U>lua require('telescope.builtin').lsp_range_code_actions()<CR>", opts)
  utils.map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  utils.map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  utils.map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  utils.map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  utils.map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  utils.map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  utils.map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  utils.map('n', '<space>rn', '<cmd>lua require("renamer").rename()<CR>', opts)
  utils.map('v', '<space>rn', '<cmd>lua require("renamer").rename()<CR>', opts)
  utils.map('i', '<F2>', '<cmd>lua require("renamer").rename()<CR>', opts)
  utils.map('n', '<space>L', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  utils.map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  utils.map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  utils.map('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
end

local capabilities = vim.tbl_extend(
  "keep",
  vim.lsp.protocol.make_client_capabilities(),
  lsp_status.capabilities
)
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
})

vim.cmd('autocmd CursorHold * lua vim.diagnostic.open_float()')

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

local function setup_servers()
  local servers = {'cssls', 'html', 'gopls', 'cmake', 'vuels'}
  for _, lsp in pairs(servers) do
    lspconfig[lsp].setup{
      coq.lsp_ensure_capabilities({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    }
  end
end

function M.config()
  setup_servers();
  require('lsp.clangd');
  require('lsp.intelephense');
  require('lsp.tsserver');
  require('lsp.rust_analyzer');
end

return M

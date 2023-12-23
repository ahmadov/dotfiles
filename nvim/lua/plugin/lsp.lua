local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')
local configs = require('lspconfig.configs')
local aerial = require('aerial')
local utils = require('utils')
local nvim_cmp = require('cmp_nvim_lsp');

function on_attach(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- aerial.on_attach(_, bufnr);
  require('illuminate').on_attach(_)
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
  -- utils.map('n', '<leader>a', "<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>", opts)
  -- utils.map('v', '<leader>a', ":<C-U>lua require('telescope.builtin').lsp_range_code_actions()<CR>", opts)
  -- utils.map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  utils.map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  utils.map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  utils.map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  utils.map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  utils.map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- utils.map('n', '<space>rn', '<cmd>lua require("renamer").rename()<CR>', opts)
  -- utils.map('v', '<space>rn', '<cmd>lua require("renamer").rename()<CR>', opts)
  -- utils.map('i', '<F2>', '<cmd>lua require("renamer").rename()<CR>', opts)
  -- utils.map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) -- until renamer.nvim fixes the issue
  -- utils.map('v', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) -- until renamer.nvim fixes the issue
  -- utils.map('i', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) -- until renamer.nvim fixes the issue
  utils.map('n', '<space>L', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  utils.map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  utils.map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  utils.map('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
  -- utils.map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- utils.map('x', '<space>a', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)

  -- lspsaga
  -- utils.map('n', '<C-k>',  "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
  -- utils.map('n', 'gr',  "<cmd>lua require('lspsaga.provider').lsp_finder()<CR>", opts)


  -- Telescope LSP
  utils.map('n', '<A-o>', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", opts)
  utils.map('n', '<A-i>', "<cmd>lua require('telescope.builtin').lsp_incoming_calls()<CR>", opts)

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
end

local capabilities = nvim_cmp.default_capabilities(capabilities)

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
  -- underline = false,
})

-- vim.cmd('autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()')
-- vim.cmd('autocmd CursorHold * lua vim.diagnostic.show()')
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
  local servers = {'clangd', 'cmake', 'rust_analyzer', 'pyright'}

  mason_lspconfig.setup({ ensure_installed = servers })
  mason_lspconfig.setup_handlers({
    function(server_name)
      lspconfig[server_name].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end,
  })
end

function M.config()
  setup_servers();
  require('lsp.clangd');
  require('lsp.intelephense');
  require('lsp.rust_analyzer');
end

return M

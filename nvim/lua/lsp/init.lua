vim.cmd [[packadd nvim-lspconfig]]
vim.cmd [[packadd nvim-compe]]

local lspconfig = require('lspconfig')

local function on_attach(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = {noremap = true, silent = true}
  vim.api.nvim_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  -- vim.api.nvim_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_set_keymap("n", "gd", "<Cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
  vim.api.nvim_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  vim.api.nvim_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  -- vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_set_keymap("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<space>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
end

local servers = {'tsserver', 'cssls', 'html', 'gopls', 'intelephense'}
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
  }
end

local function setup_servers()
--   require'lspinstall'.setup()
--   local servers = require'lspinstall'.installed_servers()
--   for _, server in pairs(servers) do
--     require'lspconfig'[server].setup{
--       on_attach = on_attach,
--     }
--   end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport =
    {properties = {'documentation', 'detail', 'additionalTextEdits'}}

local clangd_capabilities = capabilities;
clangd_capabilities.textDocument.semanticHighlighting = true;

require'lspconfig'.clangd.setup{
  capabilities = clangd_capabilities,
  cmd = {
    'clangd',
    '--clang-tidy',
    '--background-index',
    '--suggest-missing-includes',
    '--all-scopes-completion',
    '--completion-style=detailed',
    '--compile-commands-dir=Debug'
--     '--compile-commands-dir=' .. vim.g.cmake_default_config
  },
  filetypes = {"c", "cpp", "objc", "objcpp"},
  init_options = {
      clangdFileStatus = true,
      usePlaceholders = true,
      completeUnimported = true,
      semanticHighlighting = true
  },
  root_dir = lspconfig.util.root_pattern("compile_commands.json",
                                   "compile_flags.txt", ".git"),
  on_attach = on_attach,
}

-- if executable('intelephense')
--  augroup LspPHPIntelephense
--    au!
--    au User lsp_setup call lsp#register_server({
--        \ 'name': 'intelephense',
--        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
--        \ 'whitelist': ['php'],
--        \ 'initialization_options': {'storagePath': '/tmp/intelephense'},
--        \ 'workspace_config': {
--        \   'intelephense': {
--        \     'files': {
--        \       'maxSize': 1000000,
--        \       'associations': ['*.php', '*.phtml'],
--        \       'exclude': [],
--        \     },
--        \     'completion': {
--        \       'insertUseDeclaration': v:true,
--        \       'fullyQualifyGlobalConstantsAndFunctions': v:false,
--        \       'triggerParameterHints': v:true,
--        \       'maxItems': 100,
--        \     },
--        \     'format': {
--        \       'enable': v:true
--        \     },
--        \   },
--        \ }
--        \})
--  augroup END
-- endif


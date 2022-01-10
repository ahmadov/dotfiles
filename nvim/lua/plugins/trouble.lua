local utils = require('utils')

local M = {}

function M.setup()
    local opts = { silent = true, noremap = true }
    utils.map('n', '<space>xx', '<cmd>Trouble<CR>', opts)
    utils.map(
        'n',
        '<space>xw',
        '<cmd>TroubleToggle lsp_workspace_diagnostics<CR>',
        opts
    )
    utils.map(
        'n',
        '<space>xb',
        '<cmd>TroubleToggle lsp_document_diagnostics<CR>',
        opts
    )
    utils.map(
        'n',
        '<space>xq',
        '<cmd>TroubleToggle quickfix<CR>',
        opts
    )
    utils.map(
        'n',
        '<space>xl',
        '<cmd>TroubleToggle loclist<CR>',
        opts
    )
    utils.map(
        'n',
        'gR',
        '<cmd>Trouble lsp_references<CR>',
        opts
    )
end

function M.config()
    require('trouble').setup {
        fold_open = '▾',
        fold_closed = '▸',
        indent_lines = false,
        signs = {
            error = '',
            warning = '',
            hint = '',
            information = '',
            other = '',
        },
        action_keys = { jump = { '<cr>' }, toggle_fold = { '<tab>' } },
    }
    vim.cmd([[highlight link TroubleText CursorLineNr]])

    local signs = { Error = '', Warning = '', Hint = '', Information = '', Other = '' }
    for type, icon in pairs(signs) do
      local hl = "LspDiagnosticsSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
end

return M

-- load plugins
require('utils')
require('settings')
require('mappings')
require('plugins')
require('icons')
require('explorer')
require('buffer_line')
require('status_line')
require('finder')
require('fzf')
require('term')
-- lsp
require('lsp')
require('autocomplete')
require('git')
require('git_signs')
require 'colorizer'.setup()
require('highlighter')
require('colorscheme')
require('tagbar')
require('nvim-autopairs').setup()
require('lspkind').init(
    {
        File = ' '
    }
)

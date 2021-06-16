-- check if packer is installed (~/local/share/nvim/site/pack)
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

return require('packer').startup(
    function()
        use {'wbthomason/packer.nvim', opt = true}
        use {
          'glepnir/dashboard-nvim',
          cmd = {
            'Dashboard',
            'DashboardNewFile',
            'DashboardJumpMarks',
            'SessionLoad',
            'SessionSave'
          },
          config = require('plugins.dashboard').config()
        }
        use {
          'kyazdani42/nvim-web-devicons',
          config = require('plugins.nvim-web-devicons').config(),
        }
        use {
          'kyazdani42/nvim-tree.lua',
          event = "VimEnter",
          config = require('plugins.nvim-tree').config(),
        }
        use {
          'lewis6991/gitsigns.nvim',
          config = require('plugins.gitsigns').config(),
        }
        use {
          'glepnir/galaxyline.nvim',
          branch = 'main',
          config = require('plugins.galaxyline').config(),
          requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }
        use {
          'romgrk/barbar.nvim',
          event = "VimEnter",
          config = require('plugins.barbar').config(),
        }
        use {
          'hrsh7th/vim-eft',
          config = require('plugins.vim-eft').config(),
        }
        use {
          'kassio/neoterm',
          config = require('plugins.neoterm').config(),
        }
        use {
          'mbbill/undotree',
          config = require('plugins.undotree').config(),
        }
        use {
          'nvim-treesitter/nvim-treesitter',
          config = require('plugins.treesitter').config(),
        }
        use {"AndrewRadev/splitjoin.vim"}
        use {'norcalli/nvim-colorizer.lua'}
        use {'tpope/vim-dispatch'}
        use {'tpope/vim-repeat'}
        use {
          'junegunn/fzf.vim',
          config = require('plugins.fzf').config(),
        }
        use {'tpope/vim-surround'}
        use {'tpope/vim-fugitive'}
        use {
          'terrortylor/nvim-comment',
          config = require('plugins.nvim-comment').config(),
        }
        use {
          'lukas-reineke/indent-blankline.nvim',
          config = require('plugins.indent-blankline').config()
        }
        use {
          'karb94/neoscroll.nvim',
          config = require('plugins.neoscroll').config(),
        }
        use {
          'sbdchd/neoformat',
          config = require('plugins.neoformat').config(),
        }
        use {'cdelledonne/vim-cmake'}
        use {'alepez/vim-gtest'}
        use {
          'neovim/nvim-lspconfig',
          config = require('plugins.lsp').config(),
        }
        use {'kabouzeid/nvim-lspinstall'}
        use {
          'hrsh7th/nvim-compe',
          config = require('plugins.nvim-compe').config(),
          requires = { 'hrsh7th/vim-vsnip' },
        }
        use {
          'windwp/nvim-autopairs',
          config = require('plugins.nvim-autopairs').config(),
        }
        use {'alvan/vim-closetag'}
        use {'andymass/vim-matchup'}
        use {'tweekmonster/startuptime.vim'}
        use {
          'npxbr/gruvbox.nvim',
          requires = {'rktjmp/lush.nvim'}
        }
        use {
          'kristijanhusak/vim-dadbod-ui',
          requires = {'tpope/vim-dadbod'},
        }
        use({
          'nanotee/sqls.nvim',
          ft = 'sql',
        })
        use {'sainnhe/gruvbox-material'}
        use {'ThePrimeagen/harpoon'}
        use {'sainnhe/everforest'}
        use {'nvim-lua/lsp-status.nvim'}
        use {
          'stevearc/aerial.nvim',
          config = require('plugins.aerial').config(),
        }
        use {
          'nvim-telescope/telescope.nvim',
          config = require('plugins.telescope').config(),
          requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-media-files.nvim'},
            {'nvim-telescope/telescope-fzy-native.nvim'},
            {'nvim-telescope/telescope-fzf-writer.nvim'},
            {'nvim-telescope/telescope-symbols.nvim'}
          }
        }
    end
)

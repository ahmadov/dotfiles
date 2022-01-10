-- check if packer is installed (~/local/share/nvim/site/pack)
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if packer_exists then
  local use = require('packer').use
  return require('packer').startup(
      function()
          use {'wbthomason/packer.nvim', opt = true}
          use {'lewis6991/impatient.nvim', rocks = 'mpack'}
          use {
            'glepnir/dashboard-nvim',
            config = require('plugins.dashboard').config()
          }
          use {
            'folke/persistence.nvim',
            config = require('plugins.persistence').config(),
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
            'nvim-lualine/lualine.nvim',
            config = require('plugins.lualine').config(),
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
            'akinsho/toggleterm.nvim',
            config = require('plugins.toggleterm').config()
          }
          use {
            'mbbill/undotree',
            config = require('plugins.undotree').config(),
          }
          use {
            'nvim-treesitter/nvim-treesitter',
            config = require('plugins.treesitter').config(),
            requires = {
              -- Automatically end & rename tags
              'windwp/nvim-ts-autotag',
              -- Dynamically set commentstring based on cursor location in file
              'JoosepAlviste/nvim-ts-context-commentstring'
            }
          }
          use {'nvim-treesitter/nvim-treesitter-textobjects', after = {'nvim-treesitter'}}
          use {'RRethy/nvim-treesitter-textsubjects', after = {'nvim-treesitter'}}
          use {'RRethy/vim-illuminate'}
          use {'AndrewRadev/splitjoin.vim'}
          use {
            'norcalli/nvim-colorizer.lua',
          }
          use {'tpope/vim-repeat'}
          use {
            'junegunn/fzf.vim',
            config = require('plugins.fzf').config(),
          }
          use {'tpope/vim-surround'}
          use {'tpope/vim-fugitive'}
          use {
            'TimUntersberger/neogit',
            config = require('plugins.neogit').config(),
            requires = 'nvim-lua/plenary.nvim'
          }
          use {
            'sindrets/diffview.nvim',
            config = require('plugins.diffview').config(),
          }
          use {
            'terrortylor/nvim-comment',
            config = require('plugins.nvim-comment').config(),
          }
          use {
            'lukas-reineke/indent-blankline.nvim',
            config = require('plugins.indent-blankline').config()
          }
          use {
            'ethanholz/nvim-lastplace',
            config = require('plugins.lastplace').config()
          }
          use {
            'sbdchd/neoformat',
            config = require('plugins.neoformat').config(),
          }
          use {
            'Shatur/neovim-cmake',
            config = require('plugins.neovim-cmake').config()
          }
          use {'tversteeg/registers.nvim'}
          use {'alepez/vim-gtest'}
          use {'sumneko/lua-language-server'}
          use {
            'ms-jpq/coq_nvim',
            branch = 'coq',
            config = require('plugins.coq').config()
          }
          use {
            'ms-jpq/coq.artifacts',
            branch = 'artifacts'
          }
          use {
            'onsails/lspkind-nvim',
            config = require('plugins.lspkind').config(),
          }
          use {
            'neovim/nvim-lspconfig',
            config = require('plugins.lsp').config(),
          }
          use {'williamboman/nvim-lsp-installer'}
          use {
            'windwp/nvim-autopairs',
            config = require('plugins.nvim-autopairs').config(),
          }
          use {'alvan/vim-closetag'}
          use {'andymass/vim-matchup'}
          use {'tweekmonster/startuptime.vim'}
          use {
            'chentau/marks.nvim',
            config = require('plugins.marks').config()
          }
          use {'nvim-lua/lsp-status.nvim'}
          use {
            'ray-x/lsp_signature.nvim',
            config = require('plugins.lsp_signature').config()
          } 
          use {
            'stevearc/aerial.nvim',
            config = require('plugins.aerial').config(),
          }
          use {
            'simrat39/symbols-outline.nvim',
            config = require('plugins.symbols-outline').config(),
          }
          use {
            'filipdutescu/renamer.nvim',
            config = require('plugins.renamer').config()
          }
          use {
            'folke/trouble.nvim',
            setup = require('plugins.trouble').setup(),
            config = require('plugins.trouble').config(),
            requires = {'kyazdani42/nvim-web-devicons', opt = true},
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
          use {
            'mfussenegger/nvim-dap',
            config = require('plugins.dap').config(),
          }
          use {'rcarriga/nvim-dap-ui'}
          use {'theHamsta/nvim-dap-virtual-text'}
          use {'nvim-telescope/telescope-dap.nvim'}
          use {'p00f/nvim-ts-rainbow'}
          use {'famiu/nvim-reload'}
          use({
            'gelguy/wilder.nvim',
            opt = true
          })
          use {
            "luukvbaal/stabilize.nvim",
            config = function()
              require("stabilize").setup({
                force = true, -- stabilize window even when current cursor position will be hidden behind new window
                forcemark = nil, -- set context mark to register on force event which can be jumped to with '<forcemark>
                ignore = { -- do not manage windows matching these file/buftypes
                  filetype = { "packer", "Dashboard", "Trouble", "TelescopePrompt" },
                  buftype = {
                    "packer",
                    "Dashboard",
                    "terminal",
                    "quickfix",
                    "loclist",
                  },
                },
                nested = nil, -- comma-separated list of autocmds that wil trigger the plugins window restore function
              })
            end,
          }
          use({
            "Darazaki/indent-o-matic",
            disable = true,
            config = function()
              require("indent-o-matic").setup({
                -- The values indicated here are the defaults

                -- Number of lines without indentation before giving up (use -1 for infinite)
                max_lines = 2048,

                -- Space indentations that should be detected
                standard_widths = { 2, 4, 8 },
              })
            end,
          })
          use {
            'simrat39/rust-tools.nvim',
            config = function()
              require('rust-tools').setup({})
            end
          }
          use {
            'windwp/nvim-spectre',
            config = function()
              require('spectre').setup()
            end
          }
          use {
            'rcarriga/nvim-notify',
            config = require('plugins.nvim-notify').config()
          }

          use {'antoinemadec/FixCursorHold.nvim'}
          use {'folke/zen-mode.nvim'}

          -- Colorschemes
          use {'rktjmp/lush.nvim'}
          use {
            '~/git/gruvbox.nvim',
            requires = {'rktjmp/lush.nvim'},
          }
          use {'potatoesmaster/i3-vim-syntax'}
          use {'sainnhe/gruvbox-material'}
          use {'sainnhe/sonokai'}
          use {'tjdevries/colorbuddy.vim'}
          use {'tjdevries/gruvbuddy.nvim'}
          use {'Th3Whit3Wolf/onebuddy'}
          use {'EdenEast/nightfox.nvim'}
          use {'sainnhe/edge'}
          use {'sainnhe/everforest'}
          use {'navarasu/onedark.nvim'}
          use {'disrupted/one-nvim'}
          use {'Shatur/neovim-ayu'}
          use {'olimorris/onedarkpro.nvim'}
          -- Make it hard!
          use {
            'takac/vim-hardtime'
          }
      end
  )
end

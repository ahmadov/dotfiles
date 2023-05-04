-- check if packer is installed (~/local/share/nvim/site/pack)
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if packer_exists then
  local packer = require('packer')
  packer.set_handler(
    "conf",
    function(_, plugin, value)
      plugin.config = ([[require('%s').config()]]):format(value)
    end
  )
  local use = packer.use
  return require('packer').startup(
      function()
          use {'wbthomason/packer.nvim', opt = true}
          use {
              "williamboman/mason.nvim",
              conf = "plugin.mason"
          }
          use {
            'lewis6991/impatient.nvim',
            conf = "plugin.impatient",
          }
          use {'rhysd/accelerated-jk'}
          use {'kana/vim-niceblock'}

          use {
            'danymat/neogen',
            conf = "plugin.neogen",
          }
          use {
            'Saecki/crates.nvim',
            conf = "plugin.crates",
          }
          use {
            'brenoprata10/nvim-highlight-colors',
            conf = "plugin.highligth_color",
          }
          use {
            'kylechui/nvim-surround',
            conf = "plugin.nvim-surround",
          }
          -- use {
          --   'mg979/vim-visual-multi',
          --   conf = "plugin.visual_multi",
          -- }
          use {
            'monkoose/matchparen.nvim',
            conf = "plugin.matchparen",
          }
          use {
            'vladdoster/remember.nvim',
            conf = "plugin.lastplace",
          }
          use {'bronson/vim-visual-star-search'}
          -- use {
          --   'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
          --   conf = "plugin.lsp_lines",
          -- }
          use {
            'stevearc/stickybuf.nvim',
            conf = "plugin.stickybuf",
          }
          -- use {'gbprod/cutlass.nvim'}
          
          use {
            'glepnir/dashboard-nvim',
            branch = 'master',
            event = 'VimEnter',
            conf = "plugin.dashboard",
          }
          use {
            'jose-elias-alvarez/null-ls.nvim',
            -- conf = "plugin.null_ls",
          }
          use {
            'iamcco/markdown-preview.nvim',
            conf = "plugin.markdown-preview",
          }
          use {
            'folke/persistence.nvim',
            conf = "plugin.persistence",
          }
          use {
            'kyazdani42/nvim-web-devicons',
            conf = "plugin.nvim-web-devicons",
          }
          use {
            'nvim-neo-tree/neo-tree.nvim',
            conf = "plugin.neotree",
            branch = "v2.x",
            requires = { 
              'nvim-lua/plenary.nvim',
              'kyazdani42/nvim-web-devicons',
              'MunifTanjim/nui.nvim',
            }
          } 
          use {
            'lewis6991/gitsigns.nvim',
            conf = "plugin.gitsigns",
          }
          use {
            'nvim-lualine/lualine.nvim',
            conf = "plugin.lualine",
            requires = {'kyazdani42/nvim-web-devicons', opt = true}
          }
          use {
            'romgrk/barbar.nvim',
            event = "VimEnter",
            conf = "plugin.barbar",
          }
          use {
            'hrsh7th/vim-eft',
            conf = "plugin.vim-eft",
          }
          use {
            'akinsho/toggleterm.nvim',
            branch = 'main',
            conf = "plugin.toggleterm",
          }
          use {
            'mbbill/undotree',
            conf = "plugin.undotree",
          }
          use {
            'nvim-treesitter/nvim-treesitter',
            conf = "plugin.treesitter",
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
          -- use {'AndrewRadev/splitjoin.vim'}
          use {'tpope/vim-repeat'}
          use {'tpope/vim-fugitive'}
          use {
            'TimUntersberger/neogit',
            conf = "plugin.neogit",
            requires = 'nvim-lua/plenary.nvim'
          }
          use {
            'sindrets/diffview.nvim',
            -- conf = "plugin.diffview",
          }
          use {
            'numToStr/Comment.nvim',
            conf = "plugin.Comment",
          }
          use {
            'lukas-reineke/indent-blankline.nvim',
            conf = "plugin.indent-blankline",
          }
          -- use {
          --   'ethanholz/nvim-lastplace',
          --   conf = "plugin.lastplace",()
          -- }
          use {
            'sbdchd/neoformat',
            conf = "plugin.neoformat",
          }
          -- Replace with nvim-tasks
          -- use {
          --   'Shatur/neovim-cmake',
          --   conf = "plugin.neovim-cmake",
          -- }
          use {
            'Shatur/neovim-tasks',
            conf = "plugin.neovim-tasks",
          }
          use {
            'tversteeg/registers.nvim',
            branch = 'main'
          }
          use {'sumneko/lua-language-server'}
          use {
            'ms-jpq/coq_nvim',
            branch = 'coq',
            conf = "plugin.coq",
          }
          use {
            'ms-jpq/coq.artifacts',
            branch = 'artifacts'
          }
          use {
            'onsails/lspkind-nvim',
            conf = "plugin.lspkind",
          }
          use {
            'neovim/nvim-lspconfig',
            conf = "plugin.lsp",
          }
          use {'williamboman/nvim-lsp-installer'}
          use {
            'windwp/nvim-autopairs',
            conf = "plugin.nvim-autopairs",
          }
          use {'alvan/vim-closetag'}
          use {'tweekmonster/startuptime.vim'}
          use {'nvim-lua/lsp-status.nvim'}
          -- Try again
          -- use {
          --   'ray-x/lsp_signature.nvim',
          --   conf = "plugin.lsp_signature",()
          -- } 
          use {'MunifTanjim/nui.nvim'}
          use {
            'stevearc/aerial.nvim',
            conf = "plugin.aerial",
          }
          use {
            'glepnir/lspsaga.nvim',
            branch = 'main',
            conf = "plugin.lspsaga",
          }
          use {
            'folke/trouble.nvim',
            -- setup = require('plugin.trouble').setup(),
            conf = "plugin.trouble",
            requires = {'kyazdani42/nvim-web-devicons', opt = true},
          }
          use {
            'nvim-telescope/telescope.nvim',
            conf = "plugin.telescope",
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
            conf = "plugin.dap",
          }
          use {'rcarriga/nvim-dap-ui'}
          use {'theHamsta/nvim-dap-virtual-text'}
          use {'nvim-telescope/telescope-dap.nvim'}
          use {'p00f/nvim-ts-rainbow'}
          use {'famiu/nvim-reload'}
          use({
            'gelguy/wilder.nvim',
            -- TODO: config
          })
          use({
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
                  nested = nil, -- comma-separated list of autocmds that wil trigger the plugin.window restore function
                })
              end,
          })
          -- use({
          --   "Darazaki/indent-o-matic",
          -- })
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
            conf = "plugin.nvim-notify",
          }

          use {'antoinemadec/FixCursorHold.nvim', event = 'BufReadPre'}

          -- Colorschemes
          use {
            'ellisonleao/gruvbox.nvim',
          }
          use {'potatoesmaster/i3-vim-syntax'}
          use {'sainnhe/gruvbox-material'}
          use {'sainnhe/sonokai'}
          use {'sainnhe/edge'}
          use {'sainnhe/everforest'}
      end
  )
end

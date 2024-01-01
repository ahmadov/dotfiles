return {
  -- LSP
  {
    'neovim/nvim-lspconfig',
    config = function() require('plugin.lsp').config() end,
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      { 'williamboman/mason-lspconfig.nvim' }, 
      { 'j-hui/fidget.nvim', opts = {} },
      { 'folke/neodev.nvim', opts = {
        library = { plugins = { "nvim-dap-ui" }, types = true }
      }}
    }
  },
  {
    'hrsh7th/nvim-cmp',
    config = function() require('plugin.nvim-cmp').config() end,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        build = "make install_jsregexp",
        dependencies = 'saadparwaiz1/cmp_luasnip'
      }
    }
  },
  -- { 'danymat/neogen', opts = {} },

  -- Git
  {
    'lewis6991/gitsigns.nvim',
    config = function() require('plugin.gitsigns').config() end,
  },
  {'tpope/vim-fugitive'},
  {
    'NeogitOrg/neogit',
    config = function() require('plugin.neogit').config() end,
    dependencies = 'nvim-lua/plenary.nvim'
  },
  {
    'sindrets/diffview.nvim',
    config = function() require('plugin.diffview').config() end,
  },

  -- UI
  {
    'karb94/neoscroll.nvim',
    config = function ()
      require('plugin.neoscroll').config()
    end
  },

  -- Colorscheme

  -- Malicious
  'tpope/vim-sleuth',
  -- {
  --   'lervag/vimtex',
  --   config = function()
  --     require('plugin.vimtex').config()
  --   end,
  --   ft = { "tex" },
  -- },
  -- { 'folke/which-key.nvim', opts = {} },

  {
    'Saecki/crates.nvim',
    config = function() require('plugin.crates').config() end,
  },
  {
    'brenoprata10/nvim-highlight-colors',
    config = function() require('plugin.highligth_color').config() end,
  },
  { 'kylechui/nvim-surround', opts = {} },
  {
    'monkoose/matchparen.nvim',
    config = function() require('plugin.matchparen').config() end,
  },
  { 'vladdoster/remember.nvim', opts = {} },
  {
    'stevearc/stickybuf.nvim',
    config = function() require('plugin.stickybuf').config() end,
  },
  {
    'glepnir/dashboard-nvim',
    branch = 'master',
    event = 'VimEnter',
    -- config = function() require('plugin.dashboard').config() end,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    -- config = function() require('plugin.null_ls').config() end,
  },
  {
    'iamcco/markdown-preview.nvim',
    config = function() require('plugin.markdown-preview').config() end,
  },
  {
    'folke/persistence.nvim',
    config = function() require('plugin.persistence').config() end,
  },
  {
    'kyazdani42/nvim-web-devicons',
    config = function() require('plugin.nvim-web-devicons').config() end,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    config = function() require('plugin.neotree').config() end,
    branch = "v3.x",
    dependencies = { 
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function() require('plugin.lualine').config() end,
  },
  {
    'romgrk/barbar.nvim',
    event = "VimEnter",
    config = function() require('plugin.barbar').config() end,
  },
  {
    'hrsh7th/vim-eft',
    config = function() require('plugin.vim-eft').config() end,
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function() require('plugin.toggleterm').config() end,
  },
  {
    'kevinhwang91/nvim-ufo',
    config = function() require('plugin.ufo').config() end,
    dependencies = 'kevinhwang91/promise-async'
  },
  {
    'mbbill/undotree',
    config = function() require('plugin.undotree').config() end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugin.treesitter').config() end,
    dependencies = {
      -- Automatically end & rename tags
      'windwp/nvim-ts-autotag',
      'nvim-treesitter/nvim-treesitter-textobjects',
      -- Dynamically set commentstring based on cursor location in file
      {'JoosepAlviste/nvim-ts-context-commentstring', config = function() require('plugin.ts_commentstring').config() end}
    },
    build = ':TSUpdate'
  },
  {'RRethy/nvim-treesitter-textsubjects'},
  {'RRethy/vim-illuminate'},
  {'tpope/vim-repeat'},
  {
    'numToStr/Comment.nvim',
    config = function() require('plugin.Comment').config() end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('plugin.indent-blankline').config() end,
  },
  {
    'sbdchd/neoformat',
    config = function() require('plugin.neoformat').config() end,
  },
  {
    'Shatur/neovim-tasks',
    config = function() require('plugin.neovim-tasks').config() end,
  },
  {
    'tversteeg/registers.nvim',
    branch = 'main'
  },
  {'sumneko/lua-language-server'},
  -- {
  --   'ms-jpq/coq_nvim',
  --   branch = 'coq',
  --   config = function() require('plugin.coq').config() end,
  -- }
  -- {
  --   'ms-jpq/coq.artifacts',
  --   branch = 'artifacts'
  -- }
  {
    'onsails/lspkind-nvim',
    config = function() require('plugin.lspkind').config() end,
  },
  {
    'windwp/nvim-autopairs',
    config = function() require('plugin.nvim-autopairs').config() end,
  },
  {'alvan/vim-closetag'},
  {'tweekmonster/startuptime.vim'},
  { 'nvim-lua/lsp-status.nvim', },
  -- Try again
  -- {
  --   'ray-x/lsp_signature.nvim',
  --   config = function() require('plugin.lsp_signature').config() end,()
  -- } 
  {'MunifTanjim/nui.nvim'},
  {
    'stevearc/aerial.nvim',
    config = function() require('plugin.aerial').config() end,
  },
  {
    'nvimdev/lspsaga.nvim',
    branch = 'main',
    config = function() require('plugin.lspsaga').config() end,
  },
  {
    'folke/trouble.nvim',
    config = function() require('plugin.trouble').config() end,
    dependencies = {'kyazdani42/nvim-web-devicons'},
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    config = function() require('plugin.telescope').config() end,
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-media-files.nvim',
      'nvim-telescope/telescope-fzf-writer.nvim',
      'nvim-telescope/telescope-symbols.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    }
  },
  {
    'rcarriga/nvim-dap-ui',
    config = function() require('plugin.nvim-dap').config() end,
    dependencies = { 'mfussenegger/nvim-dap' }
  },
  {'theHamsta/nvim-dap-virtual-text'},
  {'nvim-telescope/telescope-dap.nvim'},
  {'p00f/nvim-ts-rainbow'},
  {'famiu/nvim-reload'},
  { 'gelguy/wilder.nvim' },
  {
    "luukvbaal/stabilize.nvim",
    config = function()
        require("stabilize").setup({
          force = true, -- stabilize window even when current cursor position will be hidden behind new window
          forcemark = nil, -- set context mark to register on force event which can be jumped to with '<forcemark>
          ignore = { -- do not manage windows matching these file/buftypes
            filetype = { "packer", "Dashboard", "Trouble", "TelescopePrompt" },
            buftype = {
              "Dashboard",
              "terminal",
              "quickfix",
              "loclist",
            },
          },
          nested = nil, -- comma-separated list of autocmds that wil trigger the plugin.window restore function
        })
      end,
  },
  { 'simrat39/rust-tools.nvim', opts = {} },
  { 'windwp/nvim-spectre', opts = {} },
  {
    'rcarriga/nvim-notify',
    config = function() require('plugin.nvim-notify').config() end,
  },

  {'antoinemadec/FixCursorHold.nvim', event = 'BufReadPre'},

  -- Colorschemes
  'ellisonleao/gruvbox.nvim',
  'srcery-colors/srcery-vim',
  'sainnhe/gruvbox-material',
  'marko-cerovac/material.nvim',
  'sainnhe/sonokai',
  'sainnhe/edge',
  'sainnhe/everforest',
  'navarasu/onedark.nvim',
}

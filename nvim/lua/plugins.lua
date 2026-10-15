return {
  -- LSP
  {
    'williamboman/mason.nvim',
    dependencies = {
      { 'williamboman/mason-lspconfig.nvim' }, 
    }
  },
  { 'j-hui/fidget.nvim', opts = {} },
  {
    'saghen/blink.cmp',
    version = '1.*',
    config = function() require('plugin.blink').config() end,
    dependencies = {
      -- 'rafamadriz/friendly-snippets',
    },
  },
  {
    'https://git.sr.ht/~p00f/clangd_extensions.nvim',
    config = function()
      require("clangd_extensions").setup({})
    end
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
  },

  -- Git
  {
    'lewis6991/gitsigns.nvim',
    config = function() require('plugin.gitsigns').config() end,
  },
  {
    'NeogitOrg/neogit',
    cmd = 'Neogit',
    config = function() require('plugin.neogit').config() end,
    dependencies = 'nvim-lua/plenary.nvim'
  },
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewRefresh', 'DiffviewFileHistory' },
    config = function() require('plugin.diffview').config() end,
  },

  { 'nmac427/guess-indent.nvim', opts = {} },

  {
    'Saecki/crates.nvim',
    event = 'BufRead Cargo.toml',
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
  {
    'stevearc/stickybuf.nvim',
    config = function() require('plugin.stickybuf').config() end,
  },
  {
    'nvimdev/dashboard-nvim',
    branch = 'master',
    event = 'VimEnter',
    config = function() require('plugin.dashboard').config() end,
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
    init = function() vim.g.barbar_auto_setup = false end,
    config = function() require('plugin.barbar').config() end,
  },
  {
    'hrsh7th/vim-eft',
    config = function() require('plugin.vim-eft').config() end,
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    cmd = { 'ToggleTerm', 'TermExec' },
    keys = { { [[<C-\>]], mode = { 'n', 'i' } } },
    config = function() require('plugin.toggleterm').config() end,
  },
  {
    'kevinhwang91/nvim-ufo',
    config = function() require('plugin.ufo').config() end,
    dependencies = 'kevinhwang91/promise-async'
  },
  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    config = function() require('plugin.undotree').config() end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugin.treesitter').config() end,
    dependencies = {
      'windwp/nvim-ts-autotag',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate'
  },
  {'RRethy/vim-illuminate'},
  {'tpope/vim-repeat'},
  {
    'stevearc/conform.nvim',
    cmd = 'ConformInfo',
    config = function() require('plugin.conform').config() end,
  },
  {
    'Civitasv/cmake-tools.nvim',
    cmd = {
      'CMakeBuild', 'CMakeBuildCurrentFile', 'CMakeClean', 'CMakeCloseExecutor', 'CMakeCloseRunner',
      'CMakeGenerate', 'CMakeInstall', 'CMakeLaunchArgs', 'CMakeOpenCache', 'CMakeOpenExecutor',
      'CMakeOpenRunner', 'CMakeQuickBuild', 'CMakeQuickRun', 'CMakeQuickStart', 'CMakeRun',
      'CMakeRunCurrentFile', 'CMakeRunTest', 'CMakeSelectBuildDir', 'CMakeSelectBuildPreset',
      'CMakeSelectBuildTarget', 'CMakeSelectBuildType', 'CMakeSelectConfigurePreset', 'CMakeSelectCwd',
      'CMakeSelectKit', 'CMakeSelectLaunchTarget', 'CMakeSelectTestPreset', 'CMakeSettings',
      'CMakeStopExecutor', 'CMakeStopRunner', 'CMakeTargetSettings',
    },
    config = function() require('plugin.cmake-tools').config() end,
  },
  {
    'tversteeg/registers.nvim',
    branch = 'main'
  },
  {
    'windwp/nvim-autopairs',
    config = function() require('plugin.nvim-autopairs').config() end,
  },
  {'MunifTanjim/nui.nvim'},
  {
    'stevearc/aerial.nvim',
    config = function() require('plugin.aerial').config() end,
  },
  {
    'nvimdev/lspsaga.nvim',
    branch = 'main',
    event = 'LspAttach',
    cmd = 'Lspsaga',
    config = function() require('plugin.lspsaga').config() end,
  },
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    keys = function() return require('plugin.trouble').keys end,
    config = function() require('plugin.trouble').config() end,
    dependencies = {'kyazdani42/nvim-web-devicons'},
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
    cmd = 'Telescope',
    config = function() require('plugin.telescope').config() end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-media-files.nvim',
      'nvim-telescope/telescope-symbols.nvim',
      'nvim-telescope/telescope-dap.nvim',
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
    -- The config defines adapters and keymaps, so attach it to nvim-dap: any `require('dap')` sets it up
    'mfussenegger/nvim-dap',
    config = function() require('plugin.nvim-dap').config() end,
    keys = {
      { '<A-b>', mode = { 'n', 'i', 'v' } },
      { '<A-o>', mode = { 'n', 'i', 'v' } },
      { '<A-i>', mode = { 'n', 'i', 'v' } },
      { '<A-u>', mode = { 'n', 'i', 'v' } },
      { '<A-c>', mode = { 'n', 'i', 'v' } },
      { '<A-t>', mode = { 'n', 'i', 'v' } },
      { '<A-r>', mode = { 'n', 'i', 'v' } },
      { '<A-d>', mode = { 'n', 'i', 'v' } },
      { '<A-v>', mode = { 'n', 'i', 'v' } },
      { '<A-BS>', mode = { 'n', 'i', 'v' } },
      { '<A-f>' },
      { '<A-/>' },
    },
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text',
    }
  },
  { 'windwp/nvim-spectre', cmd = 'Spectre', opts = {} },

  -- Colorschemes
  'ellisonleao/gruvbox.nvim',
  'sainnhe/sonokai',
  'sainnhe/edge',
  'sainnhe/gruvbox-material',
  'neanias/everforest-nvim',
}

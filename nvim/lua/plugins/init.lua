-- check if packer is installed (~/local/share/nvim/site/pack)
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

return require("packer").startup(
    function()
        use {"wbthomason/packer.nvim", opt = true}
        use {"kyazdani42/nvim-web-devicons"}
        use {"kyazdani42/nvim-tree.lua"}
        use {"lewis6991/gitsigns.nvim"}
        use {
          'glepnir/galaxyline.nvim',
            branch = 'main',
--             event = { 'VimEnter' },
            -- your statusline
            config = function() require 'status_line' end,
            -- some optional icons
            requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }
--         use {"akinsho/nvim-bufferline.lua"}
        use {"romgrk/barbar.nvim"}
        use {"kassio/neoterm"}
        use {"907th/vim-auto-save"}
        use {"nvim-treesitter/nvim-treesitter"}
        use "siduck76/nvim-base16.lua"
        use {"norcalli/nvim-colorizer.lua"}
        use {"tpope/vim-dispatch"}
        use {"tpope/vim-repeat"}
        use {"junegunn/fzf.vim"}
        use {"tpope/vim-surround"}
        use {"tpope/vim-fugitive"}
        use {"preservim/nerdcommenter"}
        use {"Yggdroot/indentLine"}
        use {"ryanoasis/vim-devicons"}
        use {"psliwka/vim-smoothie"}
        use {"sbdchd/neoformat"}
        use {"cdelledonne/vim-cmake"}
        use {"alepez/vim-gtest"}
        use {"neovim/nvim-lspconfig"}
        use {"kabouzeid/nvim-lspinstall"}
        use {"hrsh7th/nvim-compe"}
        use {"windwp/nvim-autopairs"}
        use {"alvan/vim-closetag"}
        use {"andymass/vim-matchup"}
        use {"Pocco81/TrueZen.nvim"}
        use {"tweekmonster/startuptime.vim"}
        use {"onsails/lspkind-nvim"}
        use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
        use {"sainnhe/sonokai"}
        use {"sainnhe/gruvbox-material"}
        use {"ThePrimeagen/harpoon"}
        use {"sainnhe/everforest"}
        use {"nvim-lua/lsp-status.nvim"}
        use {"elzr/vim-json"}
        use {"liuchengxu/vista.vim"}
        use {
          'nvim-telescope/telescope.nvim',
          requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
        }
        use {"nvim-telescope/telescope-fzy-native.nvim"}
        use {"nvim-telescope/telescope-media-files.nvim"}
        use {"nvim-telescope/telescope-fzf-writer.nvim"}
        use {"nvim-telescope/telescope-symbols.nvim"}
    end
)

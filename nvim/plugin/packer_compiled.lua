-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/e.ahmadov/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/e.ahmadov/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/e.ahmadov/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/e.ahmadov/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/e.ahmadov/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "require('plugin.Comment').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/opt/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  ["accelerated-jk"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/accelerated-jk",
    url = "https://github.com/rhysd/accelerated-jk"
  },
  ["aerial.nvim"] = {
    config = { "require('plugin.aerial').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["barbar.nvim"] = {
    config = { "require('plugin.barbar').config()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/opt/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["coq.artifacts"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/coq.artifacts",
    url = "https://github.com/ms-jpq/coq.artifacts"
  },
  coq_nvim = {
    config = { "require('plugin.coq').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/coq_nvim",
    url = "https://github.com/ms-jpq/coq_nvim"
  },
  ["crates.nvim"] = {
    config = { "require('plugin.crates').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/crates.nvim",
    url = "https://github.com/Saecki/crates.nvim"
  },
  ["dashboard-nvim"] = {
    config = { "require('plugin.dashboard').config()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/opt/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["diffview.nvim"] = {
    config = { "require('plugin.diffview').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  edge = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/edge",
    url = "https://github.com/sainnhe/edge"
  },
  everforest = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["gitsigns.nvim"] = {
    config = { "require('plugin.gitsigns').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox-baby"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/gruvbox-baby",
    url = "https://github.com/luisiacc/gruvbox-baby"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["i3-vim-syntax"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/i3-vim-syntax",
    url = "https://github.com/potatoesmaster/i3-vim-syntax"
  },
  ["impatient.nvim"] = {
    config = { "require('plugin.impatient').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "require('plugin.indent-blankline').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/lsp-status.nvim",
    url = "https://github.com/nvim-lua/lsp-status.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "require('plugin.lspkind').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "require('plugin.lspsaga').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/nvimdev/lspsaga.nvim"
  },
  ["lua-language-server"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/lua-language-server",
    url = "https://github.com/sumneko/lua-language-server"
  },
  ["lualine.nvim"] = {
    config = { "require('plugin.lualine').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    config = { "require('plugin.markdown-preview').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason.nvim"] = {
    config = { "require('plugin.mason').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["matchparen.nvim"] = {
    config = { "require('plugin.matchparen').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/matchparen.nvim",
    url = "https://github.com/monkoose/matchparen.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "require('plugin.neotree').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  neoformat = {
    config = { "require('plugin.neoformat').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/neoformat",
    url = "https://github.com/sbdchd/neoformat"
  },
  neogen = {
    config = { "require('plugin.neogen').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/neogen",
    url = "https://github.com/danymat/neogen"
  },
  neogit = {
    config = { "require('plugin.neogit').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/NeogitOrg/neogit"
  },
  ["neovim-tasks"] = {
    config = { "require('plugin.neovim-tasks').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/neovim-tasks",
    url = "https://github.com/Shatur/neovim-tasks"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "require('plugin.nvim-autopairs').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-dap"] = {
    config = { "require('plugin.dap').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-highlight-colors"] = {
    config = { "require('plugin.highligth_color').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/nvim-highlight-colors",
    url = "https://github.com/brenoprata10/nvim-highlight-colors"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "require('plugin.lsp').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "require('plugin.nvim-notify').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-reload"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/nvim-reload",
    url = "https://github.com/famiu/nvim-reload"
  },
  ["nvim-spectre"] = {
    config = { "\27LJ\2\0025\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fspectre\frequire\0" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/nvim-spectre",
    url = "https://github.com/windwp/nvim-spectre"
  },
  ["nvim-surround"] = {
    config = { "require('plugin.nvim-surround').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects", "nvim-treesitter-textsubjects" },
    config = { "require('plugin.treesitter').config()" },
    loaded = true,
    only_config = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-treesitter-textsubjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textsubjects",
    url = "https://github.com/RRethy/nvim-treesitter-textsubjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    config = { "require('plugin.ts_commentstring').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    config = { "require('plugin.nvim-web-devicons').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["persistence.nvim"] = {
    config = { "require('plugin.persistence').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/persistence.nvim",
    url = "https://github.com/folke/persistence.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["registers.nvim"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/registers.nvim",
    url = "https://github.com/tversteeg/registers.nvim"
  },
  ["remember.nvim"] = {
    config = { "require('plugin.lastplace').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/remember.nvim",
    url = "https://github.com/vladdoster/remember.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\2\2<\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\15rust-tools\frequire\0" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  sonokai = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/sonokai",
    url = "https://github.com/sainnhe/sonokai"
  },
  ["stabilize.nvim"] = {
    config = { "\27LJ\2\2Ô\1\0\0\4\0\n\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\5\0005\3\4\0=\3\6\0025\3\a\0=\3\b\2=\2\t\1B\0\2\1K\0\1\0\vignore\fbuftype\1\6\0\0\vpacker\14Dashboard\rterminal\rquickfix\floclist\rfiletype\1\0\0\1\5\0\0\vpacker\14Dashboard\fTrouble\20TelescopePrompt\1\0\1\nforce\2\nsetup\14stabilize\frequire\0" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/stabilize.nvim",
    url = "https://github.com/luukvbaal/stabilize.nvim"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/startuptime.vim",
    url = "https://github.com/tweekmonster/startuptime.vim"
  },
  ["stickybuf.nvim"] = {
    config = { "require('plugin.stickybuf').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/stickybuf.nvim",
    url = "https://github.com/stevearc/stickybuf.nvim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope-fzf-writer.nvim"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/telescope-fzf-writer.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-writer.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope.nvim"] = {
    config = { "require('plugin.telescope').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "require('plugin.toggleterm').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "require('plugin.trouble').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  undotree = {
    config = { "require('plugin.undotree').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/vim-closetag",
    url = "https://github.com/alvan/vim-closetag"
  },
  ["vim-eft"] = {
    config = { "require('plugin.vim-eft').config()" },
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/vim-eft",
    url = "https://github.com/hrsh7th/vim-eft"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-niceblock"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/vim-niceblock",
    url = "https://github.com/kana/vim-niceblock"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-visual-star-search"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/vim-visual-star-search",
    url = "https://github.com/bronson/vim-visual-star-search"
  },
  ["wilder.nvim"] = {
    loaded = true,
    path = "/home/e.ahmadov/.local/share/nvim/site/pack/packer/start/wilder.nvim",
    url = "https://github.com/gelguy/wilder.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('plugin.treesitter').config()
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-highlight-colors
time([[Config for nvim-highlight-colors]], true)
require('plugin.highligth_color').config()
time([[Config for nvim-highlight-colors]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require('plugin.indent-blankline').config()
time([[Config for indent-blankline.nvim]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
require('plugin.impatient').config()
time([[Config for impatient.nvim]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
require('plugin.neotree').config()
time([[Config for neo-tree.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
require('plugin.dap').config()
time([[Config for nvim-dap]], false)
-- Config for: rust-tools.nvim
time([[Config for rust-tools.nvim]], true)
try_loadstring("\27LJ\2\2<\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\15rust-tools\frequire\0", "config", "rust-tools.nvim")
time([[Config for rust-tools.nvim]], false)
-- Config for: crates.nvim
time([[Config for crates.nvim]], true)
require('plugin.crates').config()
time([[Config for crates.nvim]], false)
-- Config for: aerial.nvim
time([[Config for aerial.nvim]], true)
require('plugin.aerial').config()
time([[Config for aerial.nvim]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
require('plugin.nvim-web-devicons').config()
time([[Config for nvim-web-devicons]], false)
-- Config for: nvim-ts-context-commentstring
time([[Config for nvim-ts-context-commentstring]], true)
require('plugin.ts_commentstring').config()
time([[Config for nvim-ts-context-commentstring]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
require('plugin.toggleterm').config()
time([[Config for toggleterm.nvim]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
require('plugin.lspkind').config()
time([[Config for lspkind-nvim]], false)
-- Config for: neoformat
time([[Config for neoformat]], true)
require('plugin.neoformat').config()
time([[Config for neoformat]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require('plugin.gitsigns').config()
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-spectre
time([[Config for nvim-spectre]], true)
try_loadstring("\27LJ\2\0025\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fspectre\frequire\0", "config", "nvim-spectre")
time([[Config for nvim-spectre]], false)
-- Config for: neovim-tasks
time([[Config for neovim-tasks]], true)
require('plugin.neovim-tasks').config()
time([[Config for neovim-tasks]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
require('plugin.mason').config()
time([[Config for mason.nvim]], false)
-- Config for: markdown-preview.nvim
time([[Config for markdown-preview.nvim]], true)
require('plugin.markdown-preview').config()
time([[Config for markdown-preview.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
require('plugin.neogit').config()
time([[Config for neogit]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
require('plugin.diffview').config()
time([[Config for diffview.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
require('plugin.trouble').config()
time([[Config for trouble.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('plugin.lualine').config()
time([[Config for lualine.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
require('plugin.lspsaga').config()
time([[Config for lspsaga.nvim]], false)
-- Config for: vim-eft
time([[Config for vim-eft]], true)
require('plugin.vim-eft').config()
time([[Config for vim-eft]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require('plugin.telescope').config()
time([[Config for telescope.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
require('plugin.Comment').config()
time([[Config for Comment.nvim]], false)
-- Config for: coq_nvim
time([[Config for coq_nvim]], true)
require('plugin.coq').config()
time([[Config for coq_nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
require('plugin.nvim-surround').config()
time([[Config for nvim-surround]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require('plugin.lsp').config()
time([[Config for nvim-lspconfig]], false)
-- Config for: stickybuf.nvim
time([[Config for stickybuf.nvim]], true)
require('plugin.stickybuf').config()
time([[Config for stickybuf.nvim]], false)
-- Config for: undotree
time([[Config for undotree]], true)
require('plugin.undotree').config()
time([[Config for undotree]], false)
-- Config for: neogen
time([[Config for neogen]], true)
require('plugin.neogen').config()
time([[Config for neogen]], false)
-- Config for: matchparen.nvim
time([[Config for matchparen.nvim]], true)
require('plugin.matchparen').config()
time([[Config for matchparen.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require('plugin.nvim-autopairs').config()
time([[Config for nvim-autopairs]], false)
-- Config for: remember.nvim
time([[Config for remember.nvim]], true)
require('plugin.lastplace').config()
time([[Config for remember.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
require('plugin.nvim-notify').config()
time([[Config for nvim-notify]], false)
-- Config for: persistence.nvim
time([[Config for persistence.nvim]], true)
require('plugin.persistence').config()
time([[Config for persistence.nvim]], false)
-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
try_loadstring("\27LJ\2\2Ô\1\0\0\4\0\n\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\5\0005\3\4\0=\3\6\0025\3\a\0=\3\b\2=\2\t\1B\0\2\1K\0\1\0\vignore\fbuftype\1\6\0\0\vpacker\14Dashboard\rterminal\rquickfix\floclist\rfiletype\1\0\0\1\5\0\0\vpacker\14Dashboard\fTrouble\20TelescopePrompt\1\0\1\nforce\2\nsetup\14stabilize\frequire\0", "config", "stabilize.nvim")
time([[Config for stabilize.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
vim.cmd [[ packadd nvim-treesitter-textsubjects ]]
time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'barbar.nvim', 'dashboard-nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'FixCursorHold.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

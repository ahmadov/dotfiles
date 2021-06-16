" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
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

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/home/elmi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/elmi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/elmi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/elmi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/elmi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["TrueZen.nvim"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/TrueZen.nvim"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  everforest = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/everforest"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16status_line\frequire\0" },
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/gruvbox-material"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/gruvbox.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/harpoon"
  },
  indentLine = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  neoterm = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/neoterm"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-base16.lua"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/nvim-base16.lua"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  sonokai = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/sonokai"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/startuptime.vim"
  },
  ["telescope-fzf-writer.nvim"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/telescope-fzf-writer.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-auto-save"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/vim-auto-save"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-cmake"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/vim-cmake"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gtest"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/vim-gtest"
  },
  ["vim-json"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/vim-json"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/elmi/.local/share/nvim/site/pack/packer/start/vista.vim"
  }
}

time("Defining packer_plugins", false)
-- Config for: galaxyline.nvim
time("Config for galaxyline.nvim", true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16status_line\frequire\0", "config", "galaxyline.nvim")
time("Config for galaxyline.nvim", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry

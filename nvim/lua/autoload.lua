local plugins = {
  'colorscheme',
}

for _, plugin in ipairs(plugins) do
  require('plugins.' .. plugin)
end

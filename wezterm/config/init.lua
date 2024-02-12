local wezterm = require('wezterm')

local Config = {}

function Config:init()
   self.__index = self
   -- In newer versions of wezterm, use the config_builder which will
   -- help provide clearer error messages
   local config = setmetatable({ options = wezterm.config_builder() }, self)
   return config
end

function Config:append(new_options)
   for k, v in pairs(new_options) do
      if self.options[k] ~= nil then
         wezterm.log_warn(
            'Duplicate config option detected: ',
            { old = self.options[k], new = new_options[k] }
         )
         goto continue
      end
      self.options[k] = v
      ::continue::
   end
   return self
end

return Config


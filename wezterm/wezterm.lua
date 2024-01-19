return require('config'):init()
  :append(require('config.general'))
  :append(require('config.appearance'))
  :append(require('config.colorscheme'))
  :append(require('config.bindings'))
  .options

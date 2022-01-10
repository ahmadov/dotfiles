local M = {}

function M.config()
 require('lspkind').init({
   with_text = true,
   preset = 'codicons',
   File = ' ',
   symbol_map = {
     Text = '',
     Method = 'ƒ',
     Function = '',
     Constructor = '',
     Variable = '',
     Class = '',
     Interface = 'ﰮ',
     Module = '',
     Property = '',
     Unit = '',
     Value = '',
     Enum = '了',
     Keyword = '',
     Snippet = '﬌',
     Color = '',
     File = '',
     Folder = '',
     EnumMember = '',
     Constant = '',
     Event = "",
     Operator = "",
     Struct = ''
   },
 })
end

return M

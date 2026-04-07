local lsp = require('lsp')

local M = {}

function M.setup()
  vim.lsp.config('intelephense', {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
    settings = {
      intelephense = {
        stubs = { 
          "bcmath",
          "bz2",
          "calendar",
          "Core",
          "curl",
          "date",
          "dba",
          "dom",
          "enchant",
          "fileinfo",
          "filter",
          "ftp",
          "gd",
          "gettext",
          "hash",
          "iconv",
          "imap",
          "intl",
          "json",
          "ldap",
          "libxml",
          "mbstring",
          "mcrypt",
          "mysql",
          "mysqli",
          "password",
          "pcntl",
          "pcre",
          "PDO",
          "pdo_mysql",
          "Phar",
          "readline",
          "recode",
          "Reflection",
          "regex",
          "session",
          "SimpleXML",
          "soap",
          "sockets",
          "sodium",
          "SPL",
          "standard",
          "superglobals",
          "sysvsem",
          "sysvshm",
          "tokenizer",
          "xml",
          "xdebug",
          "xmlreader",
          "xmlwriter",
          "yaml",
          "zip",
          "zlib",
          "acf-pro",
          "wordpress-globals",
          "wp-cli",
          "genesis",
          "polylang"
        },
        files = {
            maxSize = 5000000;
        };
      };
    },
  })

  vim.lsp.enable('intelephense')
end

return M

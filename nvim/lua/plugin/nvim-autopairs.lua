local M = {}

function M.config()
  require("nvim-autopairs").setup({
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    ignored_next_char = "%w",
    check_ts = true,
  })
end

return M

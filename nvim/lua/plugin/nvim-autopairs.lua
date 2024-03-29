local M = {}

function M.config()
  require("nvim-autopairs").setup({
    pairs_map = {
      ["'"] = "'",
      ['"'] = '"',
      ["("] = ")",
      ["["] = "]",
      ["{"] = "}",
      ["`"] = "`",
    },
    disable_filetype = { "TelescopePrompt" },
    break_line_filetype = nil,
    check_line_pair = true,
    html_break_line_filetype = { "html", "vue", "typescriptreact", "svelte", "javascriptreact" },
    ignored_next_char = "%w",
    check_ts = true,
  })
end

return M

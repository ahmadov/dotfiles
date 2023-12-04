local M = {}

function M.config()

    vim.opt.termguicolors = true
    vim.cmd([[
      highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine
      highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine
      highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine
      highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine
      highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine
      highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine
    ]])

    vim.opt.list = true
    vim.opt.listchars:append("space:⋅")
    vim.opt.listchars:append("eol:↴")

    require('ibl').setup({
      scope = {
        show_start = false,
        show_end = false,
      }
    })
end

return M

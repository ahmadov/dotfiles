local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= "o" then
        scopes["o"][key] = value
    end
end

local M = {}

function M.is_buffer_empty()
    -- Check whether the current buffer is empty
    return vim.fn.empty(vim.fn.expand("%:t")) == 1
end

function M.has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end

function M.buf_map(buf, mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_buf_set_keymap(buf, mode, lhs, rhs, options)
end

function M.map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.load(plugin, ...)
    local ok, module = pcall(require, plugin)
    if ok then
      module.setup(...)
    end
end

function M.telescope_find_files(options)
  local opts = {}
  if options then
      opts = vim.tbl_extend("force", opts, options)
  end
  local ok = pcall(require('telescope.builtin').git_files, opts)
  if not ok then
    require('telescope.builtin').find_files(opts)
  end
end

local function zoom_in()
  vim.cmd([[tab split]])
  vim.api.nvim_tabpage_set_var(0, "zoomed", "true")
end

local function zoom_out()
  vim.cmd([[mkview]])
  vim.cmd([[tab close]])
  vim.cmd([[loadview]])
end

function M.toggle_zoom()
    if not vim.t["zoomed"] then
        zoom_in()
    else
        zoom_out()
    end
end

return M

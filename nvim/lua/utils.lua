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

-- Copied from from galaxyline.lua
function M.get_git_dir(path)

  -- Checks if provided directory contains git directory
  local function has_git_dir(dir)
    local git_dir = dir..'/.git'
    if vim.fn.isdirectory(git_dir) == 1 then return git_dir end
  end

  -- Get git directory from git file if present
  local function has_git_file(dir)
    local gitfile = io.open(dir..'/.git')
    if gitfile ~= nil then
      local git_dir = gitfile:read():match('gitdir: (.*)')
      gitfile:close()

      return git_dir
    end
  end

  -- Check if git directory is absolute path or a relative
  local function is_path_absolute(dir)
    local patterns = {
      '^/',        -- unix
      '^%a:[/\\]', -- windows
    }
    for _, pattern in ipairs(patterns) do
      if string.find(dir, pattern) then
        return true
      end
    end
    return false
  end

  -- If path nil or '.' get the absolute path to current directory
  if not path or path == '.' then
    path = vim.fn.getcwd()
  end

  local git_dir
  -- Check in each path for a git directory, continues until found or reached
  -- root directory
  while path do
    -- Try to get the git directory checking if it exists or from a git file
    git_dir = has_git_dir(path) or has_git_file(path)
    if git_dir ~= nil then
      break
    end
    -- Move to the parent directory, nil if there is none
    path = parent_pathname(path)
  end

  if not git_dir then return end

  if is_path_absolute(git_dir) then
    return git_dir
  end
  return  path .. '/' .. git_dir
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

local M = {}

local function read_json_file(file_path)
  local file = io.open(file_path, "r")
  if not file then
    print("Could not open file: " .. file_path)
    return {}
  end
  local content = file:read("*a")
  file:close()
  return vim.fn.json_decode(content)
end

function M.select_action()
  local action_items = read_json_file("cpp_actions.json")
  if vim.tbl_isempty(action_items) then
    return
  end

  require('telescope.pickers').new({
    layout_config = {
      width = 0.25,
      height = 0.25,
    }}, {
    prompt_title = 'Action Items',
    finder = require('telescope.finders').new_table({
      results = vim.tbl_keys(action_items),
    }),
    sorter = require('telescope.config').values.generic_sorter(),
    attach_mappings = function(prompt_bufnr, map)
      local actions = require('telescope.actions')
      local action_state = require('telescope.actions.state')

      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.cmd(action_items[selection.value])
      end)
      return true
    end,
  }):find()
end

return M

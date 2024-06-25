local keymaps = require("jamygolden/utils/keymaps")
local map = keymaps.map

local set_path_to_global_clipboard_func = function(is_absolute)
  return function()
    local current_file_path = vim.fn.expand(is_absolute and "%:p" or "%:~:.")

    vim.fn.setreg("+y", current_file_path)
  end
end

map({ "n", "v" }, "<leader>y", '"+y', { silent = false })
map({ "n" }, "<leader>Y", 'gg"+yG', { silent = false })
map({ "n" }, "<C-u>", "<C-u>zz")
map({ "n" }, "<C-d>", "<C-d>zz")
map({ "v" }, "<leader>p", '"_dP')
map({ "n" }, "<leader>cp", set_path_to_global_clipboard_func())
map({ "n" }, "<leader>cP", set_path_to_global_clipboard_func(true))

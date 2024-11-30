local table_utils = require("jamygolden/utils/table")
local keymap = vim.keymap
local mergeTables = table_utils.merge

local function map(mode, shortcut, command, options)
  keymap.set(mode, shortcut, command, mergeTables({ noremap = true, silent = true }, options or {}))
end

local M = {
  map = map,
}

return M

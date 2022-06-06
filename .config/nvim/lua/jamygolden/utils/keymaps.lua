local table_utils = require('jamygolden/utils/table')
local keymap = vim.keymap
local mergeTables = table_utils.merge

local function map(mode, shortcut, command, options)
  keymap.set(mode, shortcut, command, mergeTables({ noremap = true, silent = true }, options or {}))
end

local nmap = function(shortcut, command, options)
  map("n", shortcut, command, options)
end

local vmap = function(shortcut, command, options)
  map("v", shortcut, command, options)
end

local M = {
  map = map,
  nmap = nmap,
  vmap = vmap,
}

return M

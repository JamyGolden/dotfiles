local keymap = vim.api.nvim_set_keymap

local mergeTables = function(a, b)
  local c = {}

  for k,v in pairs(a) do c[k] = v end
  for k,v in pairs(b) do c[k] = v end

  return c
end

local function map(mode, shortcut, command, options)
  keymap(mode, shortcut, command, mergeTables({ noremap = true, silent = true }, options or {}))
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

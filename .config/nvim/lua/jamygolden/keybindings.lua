local keymaps = require 'jamygolden/utils/keymaps'
local fn = vim.fn
local cmd = vim.cmd
local map = keymaps.map
local nmap = keymaps.nmap
local vmap = keymaps.vmap

vim.g.mapleader = ' '

local set_path_to_global_clipboard_func = function()
  return function(is_absolute)
    local current_file_path = vim.fn.expand(is_absolute and "%" or "%:~:.")

    vim.fn.setreg('+y', current_file_path)
  end
end

map({ 'n', 'v' }, '<Leader>y', '\"+y', { silent = false })
nmap('<Leader>Y', 'gg\"+yG', { silent = false })
nmap('<C-u>', '<C-u>zz')
nmap('<C-d>', '<C-d>zz')
vmap('<Leader>p', '\"_dP')
nmap('<Leader>qq', ':q<cr>')
nmap('<Leader>qQ', ':qa<cr>')
nmap('<Leader>cp', set_path_to_global_clipboard_func())
nmap('<Leader>ca', set_path_to_global_clipboard_func(true))

-- Close tmp windows (Like GitFugitive) with <Leader>q
nmap('<Leader>q', function()
  local path = fn.expand('%')

  if string.find(path, '/tmp/') ~= nil then
    print('inside!', path)
    cmd('q')
  end
end)

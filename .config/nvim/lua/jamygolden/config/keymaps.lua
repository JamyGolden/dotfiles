local keymaps = require 'jamygolden/utils/keymaps'
local map = keymaps.map

local set_path_to_global_clipboard_func = function()
  return function(is_absolute)
    local current_file_path = vim.fn.expand(is_absolute and "%" or "%:~:.")

    vim.fn.setreg('+y', current_file_path)
  end
end

map({ 'n', 'v' }, '<leader>y', '\"+y', { silent = false })
map({ 'n' }, '<leader>Y', 'gg\"+yG', { silent = false })
map({ 'n' }, '<C-u>', '<C-u>zz')
map({ 'n' }, '<C-d>', '<C-d>zz')
map({ 'v' }, '<leader>p', '\"_dP')
map({ 'n' }, '<leader>qq', ':q<cr>')
map({ 'n' }, '<leader>qQ', ':qa<cr>')
map({ 'n' }, '<leader>cp', set_path_to_global_clipboard_func())
map({ 'n' }, '<leader>ca', set_path_to_global_clipboard_func())

-- Close tmp windows (Like GitFugitive) with <leader>q
map({ 'n' }, '<leader>q', function()
  local path = vim.fn.expand('%')

  if string.find(path, '/tmp/') ~= nil then
    print('inside!', path)
    vim.cmd('q')
  end
end)
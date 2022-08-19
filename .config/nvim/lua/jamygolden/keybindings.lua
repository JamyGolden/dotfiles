local keymaps = require 'jamygolden/utils/keymaps'
local fn = vim.fn
local cmd = vim.cmd
local map = keymaps.map
local nmap = keymaps.nmap
local vmap = keymaps.vmap

vim.g.mapleader = ' '

map({ 'n', 'v' }, '<Leader>y', '\"+y', { silent = false })
nmap('<Leader>Y', 'gg\"+yG', { silent = false })
vmap('<Leader>p', '\"_dP')
nmap('<Leader>qq', ':q<cr>')
nmap('<Leader>qQ', ':qa<cr>')

-- Close tmp windows (Like GitFugitive) with <Leader>q
nmap('<Leader>q', function()
  local path = fn.expand('%')

  if string.find(path, '/tmp/') ~= nil then
    print('inside!', path)
    cmd('q')
  end
end)

-- Install and update vim Plug
nmap('<Leader>1', ':luafile $MYVIMRC | :PackerInstall<Enter>', { silent = false })
nmap('<Leader><Enter>', ':luafile $MYVIMRC<Enter>', { silent = false })

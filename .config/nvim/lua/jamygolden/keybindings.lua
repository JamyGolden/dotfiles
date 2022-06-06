local keymaps = require 'jamygolden/utils/keymaps'
local nmap = keymaps.nmap
local vmap = keymaps.vmap

vim.g.mapleader = ' '

vmap('<Leader>y', '\"+y', { silent = false })
nmap('<Leader>y', '\"+y', { silent = false })
nmap('<Leader>Y', 'gg\"+yG', { silent = false })
vmap('<Leader>p', '\"_dP')
vmap('J', ':m \">+1<Enter>gv=gv')
vmap('K', ':m \"<-2<Enter>gv=gv')

-- Install and update vim Plug
nmap('<Leader>1', ':luafile $MYVIMRC | :PackerInstall<Enter>', { silent = false })
nmap('<Leader><Enter>', ':luafile $MYVIMRC<Enter>', { silent = false })

local keymaps = require 'jamygolden/utils/keymaps'
local nmap = keymaps.nmap
local g = vim.g

-----------------------------------------------------------------------
-- Options
-----------------------------------------------------------------------
g.tmux_navigator_no_mappings = 1
g.tmux_navigator_save_on_switch = 2

-----------------------------------------------------------------------
-- Keybindings
-----------------------------------------------------------------------
nmap('<c-h>', ':TmuxNavigateLeft<cr>')
nmap('<c-j>', ':TmuxNavigateDown<cr>')

nmap('<c-k>', ':TmuxNavigateUp<cr>')
nmap('<c-l>', ':TmuxNavigateRight<cr>')

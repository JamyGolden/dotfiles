local keymaps = require 'jamygolden/utils/keymaps'
local nmap = keymaps.nmap

-----------------------------------------------------------------------
-- Keymaps
-----------------------------------------------------------------------
nmap('<Leader>aa', ':lua require("harpoon.mark").add_file()<CR>')
nmap('<Leader>af', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
nmap('<Leader>an', ':lua require("harpoon.ui").nav_next()<CR>')
nmap('<Leader>aN', ':lua require("harpoon.ui").nav_prev()<CR>')

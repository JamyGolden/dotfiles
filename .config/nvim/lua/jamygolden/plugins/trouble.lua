local keymap = require('jamygolden/utils/keymaps')
local nmap = keymap.nmap

-----------------------------------------------------------------------
-- Setup
-----------------------------------------------------------------------
require("trouble").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

-----------------------------------------------------------------------
-- Keymaps
-----------------------------------------------------------------------
nmap("<leader>xx", "<cmd>Trouble<cr>")
nmap("<leader>xq", "<cmd>TroubleClose<cr>")
nmap("<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>")
nmap("<leader>xd", "<cmd>Trouble document_diagnostics<cr>")
nmap("<leader>xl", "<cmd>Trouble loclist<cr>")
nmap("<leader>xf", "<cmd>Trouble quickfix<cr>")
nmap("gR", "<cmd>Trouble lsp_references<cr>")

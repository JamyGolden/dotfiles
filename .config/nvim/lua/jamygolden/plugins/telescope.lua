local telescope = require 'telescope'
local keymaps = require 'jamygolden/utils/keymaps'
local nmap = keymaps.nmap

-----------------------------------------------------------------------
-- Setup
-----------------------------------------------------------------------
telescope.setup {
  pickers = {
    find_files = {
      hidden = true
    }
  }
}
telescope.load_extension('fzf')

-----------------------------------------------------------------------
-- Keymaps
-----------------------------------------------------------------------
nmap('<leader>k', '<cmd>lua require("telescope.builtin").find_files()<cr>')
nmap('<leader>ff', '<cmd>lua require("telescope.builtin").git_files()<cr>')
nmap('<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>')
nmap('<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>')
nmap('<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>')

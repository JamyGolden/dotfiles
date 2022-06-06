local telescope = require 'telescope'
local keymaps = require 'jamygolden/utils/keymaps'
local trouble = require("trouble.providers.telescope")
local nmap = keymaps.nmap

-----------------------------------------------------------------------
-- Setup
-----------------------------------------------------------------------
telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
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

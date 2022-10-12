local telescope = require 'telescope'
local keymaps = require 'jamygolden/utils/keymaps'
local trouble = require("trouble.providers.telescope")
local nmap = keymaps.nmap

-----------------------------------------------------------------------
-- Setup
-----------------------------------------------------------------------
telescope.setup {
  defaults = {
    file_ignore_patterns = { 'node_modules/', '.git/', 'dist/', 'build/' },
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
  pickers = {
    find_files = {
      hidden = true
    },
    live_grep = {
      additional_args = function(opts)
        return {"--hidden"}
      end
    },
    find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
  },
}
telescope.load_extension('fzf')

-----------------------------------------------------------------------
-- Keymaps
-----------------------------------------------------------------------
nmap('<leader>k', '<cmd>lua require("telescope.builtin").git_files({ show_untracked = true })<cr>')
nmap('<leader>fk', '<cmd>lua require("telescope.builtin").find_files()<cr>')
nmap('<leader>ff', '<cmd>lua require("telescope.builtin").live_grep()<cr>')
nmap('<leader>fr', '<cmd>lua require("telescope.builtin").resume()<cr>')
nmap('<leader>fo', '<cmd>lua require("telescope.builtin").live_grep({ grep_open_files = true })<cr>')
nmap('<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>')
nmap('<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>')
nmap('<leader>f/', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>')

-- Using the `<leader>g` namespace because it's conceptially vim related
nmap('<leader>gst', '<cmd>lua require("telescope.builtin").git_status()<cr>')
nmap('<leader>gbr', '<cmd>lua require("telescope.builtin").git_branches()<cr>')
nmap('<leader>gc', '<cmd>lua require("telescope.builtin").git_commits()<cr>')

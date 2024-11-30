return {
  "christoomey/vim-tmux-navigator",
  event = "VeryLazy",
  keys = {
    { "<c-h>", ":TmuxNavigateLeft<cr>", desc = "TmuxNavigateLeft" },
    { "<c-j>", ":TmuxNavigateDown<cr>", desc = "TmuxNavigateDown" },
    { "<c-k>", ":TmuxNavigateUp<cr>", desc = "TmuxNavigateUp" },
    { "<c-l>", ":TmuxNavigateRight<cr>", desc = "TmuxNavigateRight" },
  },
  config = function()
    vim.g.tmux_navigator_no_mappings = 1
    vim.g.tmux_navigator_save_on_switch = 2
  end,
}

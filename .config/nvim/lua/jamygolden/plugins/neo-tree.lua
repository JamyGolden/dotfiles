return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "-", "<cmd>Neotree toggle<cr>", desc = "Toggle (NeoTree)" },
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = true,
      },
      follow_current_file = {
        enabled = true, -- This will find and focus the file in the active buffer every
      },
    },
    window = {
      mappings = {
        ["m"] = { -- takes text input for destination, also accepts the optional config.show_path option like "add".
          "move",
          config = {
            show_path = "relative", -- "none", "relative", "absolute"
          },
        },
      },
    },
  },
}

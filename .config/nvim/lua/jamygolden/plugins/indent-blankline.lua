return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "¦",
      tab_char = "¦",
    },
    scope = { enabled = false },
    exclude = {
      filetypes = {
        "TelescopePrompt",
        "TelescopeResults",
        "Trouble",
        "alpha",
        "dashboard",
        "help",
        "lazy",
        "man",
        "mason",
        "neo-tree",
        "notify",
        "toggleterm",
        "trouble",
      },
    },
  },
}

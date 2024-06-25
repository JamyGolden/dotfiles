return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "bash",
        "css",
        "html",
        "java",
        "javascript",
        "json",
        "kotlin",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "rust",
        "tmux",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
      highlight = { enable = true },
      indent = { enable = true },
      sync_install = false,
    })
  end,
}

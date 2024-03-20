return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
      require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      auto_install = true,
      ensure_installed = {
        "bash",
        "css",
        "html",
        "java",
        "javascript",
        "kotlin",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "rust",
        "tsx",
        "typescript",
        "vim",
        "yaml"
      },
      highlight = true,
      indent = { enable = true },
      sync_install = false,
    })
  end
}
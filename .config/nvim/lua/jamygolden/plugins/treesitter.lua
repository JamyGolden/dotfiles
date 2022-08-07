require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "css",
    "help",
    "html",
    "java",
    "javascript",
    "kotlin",
    "lua",
    "make",
    "markdown",
    "rust",
    "tsx",
    "vim",
    "yaml"
  },
  sync_install = false,
  highlight = {
    enable = true,
  },
}

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
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
      -- "rust",
      "tsx",
      "typescript",
      "vim",
      "yaml"
    },
    highlight = {
      enable = true,
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },
    indent = { enable = true },
    sync_install = false,
  },
}
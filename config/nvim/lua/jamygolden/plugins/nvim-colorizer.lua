vim.o.termguicolors = true

return {
  -- "ap/vim-css-color",
  "norcalli/nvim-colorizer.lua",
  event = "BufEnter",
  -- config = function()
  --   require("colorizer").setup()
  -- end,
  opts = {
    'yaml',
    html = { mode = 'background' },
  }
}

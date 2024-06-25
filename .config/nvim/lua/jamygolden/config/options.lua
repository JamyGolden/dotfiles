local paths = require("jamygolden/utils/paths")
local opt = vim.opt

-- This file is automatically loaded by plugins.core
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.maplocalleader = "\\"

-----------------------------------------------------------------------
-- General
-----------------------------------------------------------------------
opt.modifiable = true
opt.shell = "/bin/zsh" -- https://superuser.com/questions/287994/how-to-specify-shell-for-vim
opt.fileencoding = "utf-8"
opt.scrolloff = 8
opt.linebreak = true -- Break lines at word (requires Wrap lines)
opt.showbreak = "+++" -- Wrap-broken line prefix
opt.textwidth = 72 -- Line wrap (number of cols)
opt.colorcolumn = "72,120" -- Set column marker
opt.showmatch = true -- Highlight matching brace
opt.visualbell = true -- Use visual bell (no beeping)
opt.cursorline = true -- Highlight current line
opt.hlsearch = true -- Highlight all search results
opt.smartcase = true -- Enable smart-case search
opt.ignorecase = true -- Always case-insensitive
opt.backupcopy = "yes"
opt.swapfile = true
opt.smartcase = true
opt.laststatus = 2
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.scrolloff = 12
opt.ruler = true -- Show row and column ruler information
opt.number = true -- line numbers and distances
opt.undolevels = 1000 -- Number of undo levels
opt.undofile = true
opt.relativenumber = true
opt.undodir = paths.undo_dir .. "/" -- Persistent undo
opt.directory = paths.swp_dir .. "/" -- swp file tmp storage
opt.backupdir = paths.backup_dir .. "/" -- backup file tmp storage

-- Disable Background Color Erase (BCE) so that color schemes render
-- properly when inside 256-color tmux and GNU screen.
if vim.fn.getenv("TERM") == "256color" then
  vim.o.t_ut = ""
end

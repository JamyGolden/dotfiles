local cmd = vim.cmd

-----------------------------------------------------------------------
-- Autocommands
-----------------------------------------------------------------------

-- Add quick visual highlight when something is yanked for usability
cmd([[au TextYankPost * silent! lua vim.highlight.on_yank { higroup="IncSearch", timeout=150, on_visual=false }]])
